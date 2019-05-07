Delimiter |
drop procedure if exists ps_produit_insertion |
create procedure ps_produit_insertion(in nom_produit varchar(255), 
									in prixht_produit decimal(15,3), 
									in stock_inventaire_produit int, 
									in stock_minimum int, 
									in stock_objectif int, 
									in tva_produit decimal(5,4), 
									in id_type_produit int,
									out errcode integer,
									out errmsg varchar(255),
									out id_produit integer)
/* Objectif : enregistrer un produit dans la table produit
			  activation d'un trigger pour gérer le statut (histo_produit)
			  (valeur à now() en attendant de revenir dessus)
*/
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null; set id_produit = -1;
		set @date_dispo_produit = now();

		insert into produit (nom_produit, prixht_produit, stock_inventaire_produit, stock_minimum, stock_objectif, tva_produit, id_type_produit)
		values (nom_produit, prixht_produit, stock_inventaire_produit, stock_minimum, stock_objectif, tva_produit, id_type_produit);
		set id_produit = last_insert_id();
        commit;
        
end | delimiter ;