Delimiter |
drop procedure if exists ps_panier_getlistcommandeproduit |
create procedure ps_panier_getlistcommandeproduit(in idcommande int, 
                                    out errcode int,
                                    out errmsg varchar(1000))
                                    /*
  OBJECTIF :  récupérer la liste (commandeproduit) en fonction de l'id commande
*/
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    Start transaction;
		set errcode = 0;set errmsg = null;

		select 	commande_produit.quantite_produit,
            commande_produit.prix_HT_unitaire_debut, 
            commande_produit.remise_appliquee, 
            commande_produit.tva_appliquee, 
            commande_produit.prix_TTC_unitaire_final,
            produit.id_produit, 
            produit.nom_produit, 
            produit.prixht_produit, 
            produit.stock_inventaire_produit, 
            produit.stock_minimum, 
            produit.stock_objectif, 
            produit.tva_produit, 
            produit.id_type_produit
    from commande_produit, produit
    where id_commande = idcommande
    and commande_produit.id_produit = produit.id_produit;
    
	commit;
end | delimiter ;

