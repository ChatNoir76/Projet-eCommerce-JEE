Delimiter |
drop procedure if exists ps_histoprixfournisseur_insertion |
create procedure ps_histoprixfournisseur_insertion(in id_produit int,
									in id_fournisseur int,
									in prix decimal(15,3),
									out errcode integer,
									out errmsg varchar(255))
/* Objectif :   enregistrer le prix d'un fournisseur par rapport a un produit dans la table histo_prix_fournisseur
		        PAS DE trigger lié à cette insertion
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

		insert into histo_prix_fournisseur (prix_achat, date_chg_prix, id_fournisseur, id_produit)
		values (prix, now(), id_fournisseur, id_produit);
        commit;
        
end | delimiter ;