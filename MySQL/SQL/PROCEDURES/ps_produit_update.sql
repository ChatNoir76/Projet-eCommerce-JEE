Delimiter |
drop procedure if exists ps_produit_update |
create procedure ps_produit_update(in idproduit int,
                                    in nom_produit varchar(255), 
									in prixht_produit decimal(15,3), 
									in stock_inventaire_produit int, 
									in stock_minimum int, 
									in stock_objectif int, 
									in tva_produit decimal(5,4), 
									in id_type_produit int,
									out errcode integer,
									out errmsg varchar(255))
/* Objectif : modifier les info d'un produit dans la table produit
*/
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;

		update produit
        set produit.nom_produit = nom_produit, 
        produit.prixht_produit = prixht_produit, 
        produit.stock_inventaire_produit = stock_inventaire_produit, 
        produit.stock_minimum = stock_minimum, 
        produit.stock_objectif = stock_objectif, 
        produit.tva_produit = tva_produit, 
        produit.id_type_produit = id_type_produit
		where produit.id_produit = idproduit;

        commit;
        
end | delimiter ;