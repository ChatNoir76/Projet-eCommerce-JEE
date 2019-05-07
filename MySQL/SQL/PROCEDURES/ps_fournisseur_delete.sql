Delimiter |
drop procedure if exists ps_fournisseur_delete |
create procedure ps_fournisseur_delete( 
			in idfour int,
			out errcode integer,
			out errmsg varchar(255))
/* Objectif : suppression d'un fournisseur dans la table fournisseur

Condition : pas de FK présent dans histo_prix_fournisseur
			  
*/
begin
	declare nbfour int;declare nbfk int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set nbfour = (select count(*) from fournisseur where fournisseur.id_fournisseur = idfour);
        set nbfk = (select count(*) from histo_prix_fournisseur where histo_prix_fournisseur.id_fournisseur = idfour);
        
        if (nbfour = 0) then
			#le fournisseur n'existe pas
			signal sqlstate 'EL000' set MYSQL_ERRNO=60021;
        end if;
        if (nbfk <> 0) then
			#le fournisseur à déjà des références
			signal sqlstate 'EL000' set MYSQL_ERRNO=60013;
        end if;
        
		# delete fournisseur
		delete from fournisseur
		where fournisseur.id_fournisseur = idfour;

        commit;
        
end | delimiter ;