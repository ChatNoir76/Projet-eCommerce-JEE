Delimiter |
drop procedure if exists ps_client_delete |
create procedure ps_client_delete(
							in id integer, 
							out errcode integer,
							out errmsg varchar(255))
/* Objectif : suppression d'un client de la table client
			  uniquement possible si pas de référencement dans d'autre table (FK)
*/
begin
	declare nbOld int;
    declare nbNew int;
    declare nb int;
    declare find bool;
	declare exit handler for 1451 -- impossible de supprimer à cause des FK
    begin
        set errcode = 60010, errmsg = fx_donne_errmsg(errcode);
		rollback;
    end;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set nb = (select count(*) from client where id_client=id);
        set find = if(nb=1,true, false);
        set nbOld = (select count(*) from client);
        
        if (find=false) then 
			-- si élément non trouvé
			signal sqlstate 'EL000' set MYSQL_ERRNO=60011, MESSAGE_TEXT = "erreur logiciel";
        end if;
        
        delete from client where id_client=id;
        set nbNew = (select count(*) from client);
        
        if (nbNew <> nbOld - 1) then
			select nbNew, nbOld;
			-- si la suppression ne concerne pas qu'une ligne...
			signal sqlstate 'EL000' set MYSQL_ERRNO=60012, MESSAGE_TEXT = "erreur logiciel";
        end if;
        
    commit;
end | delimiter ;

