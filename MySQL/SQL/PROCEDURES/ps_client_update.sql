Delimiter |
drop procedure if exists ps_client_update |
create procedure ps_client_update(
							in id integer, 
							in nom varchar(255), 
							in prenom varchar(255), 
							in sexe char(1), 
							in mail varchar(255), 
							in tel varchar(25), 
							in date_naissance datetime, 
							in adresse varchar(255), 
							in code_postal varchar(25), 
							in ville varchar(255), 
							in pays varchar(255), 
							in commentaire varchar(1000), 
							in mdp varchar(25),
							out errcode integer,
							out errmsg varchar(255))
/* Objectif : mise à jour d'un client dans la table client
			  récupération du client via son id
*/
begin
	declare id_statut_mail int;
	declare exit handler for 1062 # 1062 : Duplicate entry (soit par id soit par mail)
    begin
		declare nbmail int;
        # détermine si l'email est unique ou multiple
        set nbmail = (select count(*) from client where client.mail_client = mail_client);
        # enregistrement des errcode et msg par défaut
        get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
        if (nbmail > 0) then # gestion du cas particulier ou la duplicate entry est l'adresse mail et non l'id
			set errcode = 60000;
            set errmsg = fx_donne_errmsg(errcode);
        end if;
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
        set id_statut_mail = fx_verif_mail(mail);
        
        case id_statut_mail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001, MESSAGE_TEXT = "erreur logiciel";
				
			when 1 then
				# Mail valide
				update client
                set
                nom_client=nom, prenom_client=prenom, 
                sexe_client = sexe, mail_client = mail, tel_client = tel, 
                date_naissance_client = date_naissance, adresse_client=adresse, 
                code_postal_client = code_postal, ville_client=ville, pays_client = pays, 
                commentaire_client = commentaire, mdp_client = mdp
                where id_client = id;
			
			when 2 then
				# Mail null
				signal sqlstate 'EL000' set MYSQL_ERRNO=60003, MESSAGE_TEXT = "erreur logiciel";
			else 
				#format mail indéterminé
				signal sqlstate 'EL000' set MYSQL_ERRNO=60002, MESSAGE_TEXT = "erreur logiciel";
		end case;
    commit;
end | delimiter ;
