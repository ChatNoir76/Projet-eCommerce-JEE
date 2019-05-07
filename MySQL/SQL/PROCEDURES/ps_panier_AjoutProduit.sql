Delimiter |
drop procedure if exists ps_panier_ajoutproduit |
create procedure ps_panier_ajoutproduit(in idc int,
                                    in idp int,
                                    in quantity int,
                                    out errcode int,
                                    out errmsg varchar(1000))
/* Objectif : ajouter un produit dans la table commandeproduit (panier)
			  deux cas possibles :
              1) la clef commande / produit n'existe pas, la ligne est crée
              2) la clef commande / produit existe, la quantité de produit est incrémentée
*/
begin
    declare existIdc int;
    declare comStt int;
	declare nbKey int;
    declare prixHT decimal(15,3);
    declare remise decimal(5,4);
    declare tva decimal(5,4);
    declare prixTTC decimal(15,3);
    declare newQty int;
    declare idprod int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;
    set newQty = 0;set prixHT = 0;set remise = 0;set tva = 0;set prixTTC = 0;set idprod = 0;

    set existIdc = (select count(*)
                    from commande
                    where id_commande = idc);
    if (existIdc = 0) then
        # commande introuvable
        signal sqlstate 'EL000' set MYSQL_ERRNO=60043;
    end if;

    set comStt = (select id_statut_commande
                from histo_commande
                where id_commande = idc
    );
    if (isnull(comStt)) then
        # statut commande introuvable
        signal sqlstate 'EL000' set MYSQL_ERRNO=60044;
    end if;
    if (comStt > 2) then
        # commande déjà payé
        signal sqlstate 'EL000' set MYSQL_ERRNO=60045;
    end if;
    


    #détermination du nombres de ligne avec la clef (idc + idp)
    set nbKey = (   select count(*)
                    from commande_produit
                    where commande_produit.id_commande = idc
                    and commande_produit.id_produit = idp );

    case nbKey
			when 0 then 
				# la ligne n'existe pas
                set newQty = quantity;

                if (newQty > 0) then
                                -- vérification de l'existance du produit
                    set idprod = (select count(*)
                                from produit
                                where id_produit = idp);
                    if (idprod = 0) then
                        # id produit introuvable
                        signal sqlstate 'EL000' set MYSQL_ERRNO=60042;
                    end if;
                    
                    set prixHT = (select prixht_produit
                                from produit
                                where id_produit = idp);
                    set prixHT = (if (isnull(prixHT),0,prixHT));
                    set tva = (select tva_produit
                                from produit
                                where id_produit = idp);
                    set tva = (if (isnull(tva),0,tva));
                    set remise = (select remise_eventuelle
                                from histo_produit
                                where id_produit = idp
                                order by date_chg_statut desc limit 1);
                    set remise = (if (isnull(remise),0,remise));
                    set prixTTC = (prixHT - remise) * (1 + tva);

                    insert into commande_produit(quantite_produit, prix_HT_unitaire_debut, remise_appliquee, tva_appliquee, prix_TTC_unitaire_final, id_commande, id_produit)
                    values (newQty, prixHT, remise, tva, prixTTC, idc, idp );
                else
                    # quantité négative
				    signal sqlstate 'EL000' set MYSQL_ERRNO=60041;
                end if;
			when 1 then
				# la ligne existe déjà
                set newQty =    (select quantite_produit
                                from commande_produit
                                where id_commande = idc
                                and id_produit = idp);
                set newQty = newQty + quantity;

                -- si quantité est négatif, on vérifie le total > 0
                if ((newQty) > 0) then
                    -- quantitée supérieure à zéro
                    update commande_produit
                    set commande_produit.quantite_produit = (newQty)
                    where commande_produit.id_commande = idc
                    and commande_produit.id_produit = idp;
                else
                    -- quantitée inférieure à zéro
                    delete from commande_produit
                    where commande_produit.id_commande = idc
                    and commande_produit.id_produit = idp;
                end if;
			else 
				# la ligne est présente plusieur fois -> anormal
				signal sqlstate 'EL000' set MYSQL_ERRNO=60040;
		end case;
	commit;
end | delimiter ;


