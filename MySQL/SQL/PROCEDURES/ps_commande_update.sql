Delimiter |
drop procedure if exists ps_commande_update |
create procedure ps_commande_update(
							in id int,
							in remise decimal(5,4), 
							out errcode integer,
							out errmsg varchar(255))
/* Objectif : mise à jour d'une commande
			  via son id, mise à jour du champs remise
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
        
        update commande
        set commande.remise_globale = remise
        where commande.id_commande = id;
        
    commit;
end | delimiter ;

