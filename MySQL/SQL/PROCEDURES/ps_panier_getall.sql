Delimiter |
drop procedure if exists ps_panier_getall |
create procedure ps_panier_getall(in idclient int,
                                out errcode int,
                                out errmsg varchar(1000))
/* Objectif : select de toutes les commandes d'un client avec le statut (commande) le plus récent et supérieur à 2
*/
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;

    select  t1.id_client, t1.id_commande, t1.remise_globale, t1.date_creation_commande, t1.date_chg_statut, t1.id_statut_commande,
            t2.quantite_produit, t2.prix_HT_unitaire_debut, t2.remise_appliquee, t2.tva_appliquee, t2.prix_TTC_unitaire_final, t2.id_produit,
            t3.nom_produit, t3.prixht_produit, t3.stock_inventaire_produit, t3.stock_minimum, t3.stock_objectif, t3.tva_produit, t3.id_type_produit
    from vw_histo_panier t1, commande_produit t2, produit t3
    where t1.id_client = idclient
    and t1.id_commande = t2.id_commande
    and t2.id_produit = t3.id_produit
    and t1.id_statut_commande > 2;

	commit;
end | delimiter ;


