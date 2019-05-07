Delimiter |
drop procedure if exists ps_client_insertion |
create procedure ps_client_insertion(in nom_client varchar(255), 
									in prenom_client varchar(255), 
									in sexe_client char(1), 
									in email_client varchar(255), 
									in tel_client varchar(25), 
									in date_naissance_client datetime, 
									in adresse_client varchar(255), 
									in code_postal_client varchar(25), 
									in ville_client varchar(255), 
									in pays_client varchar(255), 
									in commentaire_client varchar(1000), 
									in mdp_client varchar(25),
									out errcode integer,
									out errmsg varchar(255),
									out id_client integer)
/* Objectif : enregistrer un client dans la table client
			  deux cas possibles :
              1) le client n'est pas connu, il a rempli le panier, il est guest
              2) le client à crée un compte (nouveau client)
              
              la PS envoie soit toute les infos cas n°2
              soit les valeurs à null en ignorant les paramètres de départ cas n°1
              
              si mail_client est à null alors création d'un client par défaut
*/
begin
	declare id_statut_mail int;
	declare nbmail int;
	declare exit handler for 1062 # 1062 : Duplicate entry
    begin
		set errcode = 60070;
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
		set errcode = 0; set errmsg = null; set id_client = -1;set nbmail = 0;

		set nbmail = (select count(*)
						from client
						where client.mail_client like email_client);

		if (nbmail > 0) then
		#adresse mail déjà présente
			signal sqlstate 'EL000' set MYSQL_ERRNO=60000;
        end if;

		set id_statut_mail = fx_verif_mail(email_client);

        case id_statut_mail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001;
				
			when 1 then
				# creation de compte
				insert into client(date_inscription_client, nom_client, prenom_client, sexe_client, mail_client, tel_client, date_naissance_client, adresse_client, code_postal_client, ville_client, pays_client, commentaire_client, mdp_client)
				values (now(), nom_client, prenom_client, sexe_client, email_client, tel_client, date_naissance_client, adresse_client, code_postal_client, ville_client, pays_client, commentaire_client, mdp_client);
				set id_client = last_insert_id();
			
			when 2 then
				# creation client guest
				insert into client(date_inscription_client, nom_client, prenom_client, sexe_client, mail_client, tel_client, date_naissance_client, adresse_client, code_postal_client, ville_client, pays_client, commentaire_client, mdp_client)
				values (now(), 'guest', null, null, null, null, null, null, null, null, null, null, 'Site01');
				set id_client = last_insert_id();
				
				#guest = mail unique --> creation mail avec id utilisateur
				UPDATE client 
				SET client.mail_client = concat('guest',id_client,'@monsite.fr') 
				WHERE client.id_client=id_client;
			else 
				#format mail indéterminé
				signal sqlstate 'EL000' set MYSQL_ERRNO=60002;
		end case;
	
        commit;
        
end | delimiter ;