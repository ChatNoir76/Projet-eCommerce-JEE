Delimiter |
drop procedure if exists ps_fournisseur_update |
create procedure ps_fournisseur_update( 
			in idfour int,
			in nom varchar(255),  
			in mail varchar(255),   
			in adresse varchar(255), 
			in code_postal varchar(25), 
			in ville varchar(255), 
			in pays varchar(255),
			out errcode integer,
			out errmsg varchar(255))
/* Objectif : mise à jour d'un fournisseur dans la table fournisseur
			  
*/
begin
	declare Etatmail int; declare nbfour int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set nbfour = (select count(*) from fournisseur where fournisseur.id_fournisseur = idfour);
        set Etatmail = fx_verif_mail(mail);
        
        if (nbfour = 0) then
			#le fournisseur n'existe pas
			signal sqlstate 'EL000' set MYSQL_ERRNO=60021;
        end if;
        
        case Etatmail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001;
				
			when 1 then
				# mise à jour fournisseur
				update fournisseur
                set nom_fournisseur = nom, mail_fournisseur = mail, adresse_fournisseur = adresse, 
                code_postal_fournisseur = code_postal, ville_fournisseur = ville, pays_fournisseur = pays
				where fournisseur.id_fournisseur = idfour;
			
			when 2 then
				#non renseigné (=null)
				signal sqlstate 'EL000' set MYSQL_ERRNO=60003;
		end case;
	
        commit;
        
end | delimiter ;