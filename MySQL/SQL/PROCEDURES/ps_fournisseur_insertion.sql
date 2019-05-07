Delimiter |
drop procedure if exists ps_fournisseur_insertion |
create procedure ps_fournisseur_insertion( 
			in nom varchar(255),  
			in mail varchar(255),   
			in adresse varchar(255), 
			in code_postal varchar(25), 
			in ville varchar(255), 
			in pays varchar(255),
			out errcode integer,
			out errmsg varchar(255),
			out idfournisseur integer)
/* Objectif : enregistrer un fournisseur dans la table fournisseur
			  il aura le statut actif par défaut (1)
*/
begin
	declare Etatmail int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null; set idfournisseur = -1;
        set Etatmail = fx_verif_mail(mail);
        
        case Etatmail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001;
				
			when 1 then
				# creation fournisseur
				insert into fournisseur(nom_fournisseur, mail_fournisseur, adresse_fournisseur, code_postal_fournisseur, ville_fournisseur, pays_fournisseur)
				values (nom, mail, adresse, code_postal, ville, pays);
				set idfournisseur = last_insert_id();
			
			when 2 then
				#non renseigné (=null)
				signal sqlstate 'EL000' set MYSQL_ERRNO=60003;
		end case;
	
        commit;
        
end | delimiter ;