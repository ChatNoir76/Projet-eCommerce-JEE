Delimiter |
drop procedure if exists ps_produitgenreproduit_insertion |
create procedure ps_produitgenreproduit_insertion(in id_produit int,
									in id_genreproduit int,
									out errcode integer,
									out errmsg varchar(255))
/* Objectif :   enregistrer un genre produit dans la table produit_genre_produit
		        PAS DE trigger lié à cette insertion
*/
begin
    declare id_type_prod int;
    declare exit handler for 1062 # 1062 : Duplicate entry (relation type - genre déjà présente)
    begin
		declare nbmail int;
        set errcode = 60035;
        set errmsg = fx_donne_errmsg(errcode);
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
        set id_type_prod = (select id_type_produit 
                            from produit
                            where produit.id_produit = id_produit);
        
        if (isnull(id_type_prod)) then
            signal sqlstate 'EL000' set MYSQL_ERRNO=60034, MESSAGE_TEXT = "erreur logiciel";
        end if;

        case (fx_verif_genre_type_produit(id_type_prod, id_genreproduit))
            when -2 then
                signal sqlstate 'EL000' set MYSQL_ERRNO=60032, MESSAGE_TEXT = "erreur logiciel";
            when -1 then
                signal sqlstate 'EL000' set MYSQL_ERRNO=60031, MESSAGE_TEXT = "erreur logiciel";
            when 0 then 
                signal sqlstate 'EL000' set MYSQL_ERRNO=60030, MESSAGE_TEXT = "erreur logiciel";
            when 1 then
                insert into produit_genre_produit(id_produit, id_genre_produit)
                values(id_produit, id_genreproduit);
            else
                signal sqlstate 'EL000' set MYSQL_ERRNO=60033, MESSAGE_TEXT = "erreur logiciel";
            end case;

        commit;
        
end | delimiter ;