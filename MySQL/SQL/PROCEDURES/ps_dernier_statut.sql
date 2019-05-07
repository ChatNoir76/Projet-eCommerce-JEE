Delimiter |
drop procedure if exists ps_dernier_statut |
create procedure ps_dernier_statut(in nom_statut varchar(50), 
									in id_obj int, 
                                    out errcode int,
                                    out errmsg varchar(1000),
                                    out id_trouve int)
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    Start transaction;
		set errcode = 0;set errmsg = null;set id_trouve = -1;
		set @maRequete = concat("set @id = (Select histo_",nom_statut,".id_statut_",nom_statut," from histo_",nom_statut,
						", ",nom_statut,", statut_",nom_statut,
						" where ",nom_statut,".id_",nom_statut," = histo_",nom_statut,".id_",nom_statut,
						" AND statut_",nom_statut,".id_statut_",nom_statut," = histo_",nom_statut,".id_statut_",nom_statut,
						" AND ",nom_statut,".id_",nom_statut,"=",id_obj," order by date_chg_statut desc limit 1);");
		prepare stmt from @maRequete;
		execute stmt;
        Deallocate prepare stmt;
		set id_trouve = @id;
        if (isnull(id_trouve)) then
			signal sqlstate 'EL000' set MYSQL_ERRNO=60050;
        end if;
	commit;
end | delimiter ;

