Delimiter |
drop procedure if exists ps_commande_insertion |
create procedure ps_commande_insertion(in remise_globale decimal(5,4), 
                                      in id_client int,
                                      out errcode int,
                                      out errmsg varchar(255),
                                      out id_commande int)
/* Objectif : création d'une commande (panier) pour un id_client passé en parametre
			  deux cas possibles :
              1) le client n'est pas connu -> erreur
              2) le client à crée un compte, son id est connu, création commande + statut = 1
*/
begin
	declare nbClient int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
    # initialisation des variables OUT
    set errcode = 0; set errmsg = null; set id_commande = null;
    set nbClient = (select count(*) from client where client.id_client = id_client);
    if (nbClient <> 1) then
		#si pas ou plusieurs client dans la base client
        signal sqlstate 'EL000' set MYSQL_ERRNO=60020;
    end if;
    
	# requete à effectuer
	insert into commande (remise_globale, date_creation_commande, id_client) Values
	(remise_globale, now(), id_client);
	
	set id_commande = last_insert_id();
	commit;
end | delimiter ;
