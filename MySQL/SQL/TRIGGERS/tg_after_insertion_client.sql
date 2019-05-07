delimiter |
drop trigger if exists tg_after_insertion_client |
create trigger tg_after_insertion_client after insert on client
for each row
/*objectif : remplir la table histo client après une création
			 d'un client soit en guest soit en création de compte
*/
begin
	declare id_verif_mail int;
    set id_verif_mail = fx_verif_mail(new.mail_client);
	case id_verif_mail #en fonction du statut du mail, insertion histo client en 1:guest ou 2:classic
		when 0 then 
			#format mail non respecté
			signal sqlstate 'EL000' set MYSQL_ERRNO=60001, MESSAGE_TEXT = "erreur logiciel";
            
        when 1 then
			#nouveau client ayant crée un compte, statut en classic
			insert into histo_client(date_chg_statut, id_statut_client, id_client) values
			(now(), 2, new.id_client);
        
        when 2 then
			#nouveau client inconnu, statut en guest
			insert into histo_client(date_chg_statut, id_statut_client, id_client) values
			(now(), 1, new.id_client);
		else 
			#format mail indéterminé
			signal sqlstate 'EL000' set MYSQL_ERRNO=60002, MESSAGE_TEXT = "erreur logiciel";
    end case;
end | delimiter ;



