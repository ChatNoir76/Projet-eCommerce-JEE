Delimiter |
drop procedure if exists ps_panier_update |
create procedure ps_panier_update(in idc int,
                                in idp int,
                                in quantity int,
                                in remise decimal(5,4),
                                out errcode int,
                                out errmsg varchar(1000))
/* Objectif : update produit dans la table commandeproduit (panier)
			  deux cas possibles :
              1) la quantité mise a jour est superieur à 1
              2) la quantité mise a jour est inferieurou egale à 0 --> delete
*/
begin
    declare newremise decimal(5,4);
    declare prixTTC decimal(15,3);
    declare prixHT decimal(15,3);
    declare tva decimal(5,4);
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;

    set newremise = (select remise_appliquee
                    from commande_produit
                    where id_produit = idp
                    and id_commande = idc);
    set prixHT = (select prix_HT_unitaire_debut
                    from commande_produit
                    where id_produit = idp
                    and id_commande = idc);
    set tva = (select tva_appliquee
                    from commande_produit
                    where id_produit = idp
                    and id_commande = idc);
    set newremise = (if (isnull(remise),newremise,remise));
    set prixTTC = (prixHT * (1 - newremise)) * (1 + tva);
    
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;
    if (quantity <= 0) then
        # commande introuvable
        delete from commande_produit
        where id_commande = idc
        and id_produit = idp;
    else
        update commande_produit
        set commande_produit.quantite_produit = quantity,
            commande_produit.remise_appliquee = newremise,
            commande_produit.prix_TTC_unitaire_final = prixTTC
        where commande_produit.id_commande = idc
        and commande_produit.id_produit = idp;
    end if;

	commit;
end | delimiter ;


