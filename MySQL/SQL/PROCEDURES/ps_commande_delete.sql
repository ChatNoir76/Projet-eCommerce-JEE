Delimiter |
drop procedure if exists ps_commande_delete |
create procedure ps_commande_delete(
							in id integer, 
							out errcode integer,
							out errmsg varchar(255))
/* Objectif : suppression d'une commande
			  1) le triggers va supprimer les FK dans histo_commande
              2) suppression commande
              3) création d'une nouvelle vierge
*/
begin
	declare idclient int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set idclient = (select commande.id_client from commande where commande.id_commande = id);
        
        delete from commande
        where commande.id_commande = id;
        
        insert into commande (remise_globale, date_creation_commande, id_client) Values
		(0, now(), idclient);
        
    commit;
end | delimiter ;

