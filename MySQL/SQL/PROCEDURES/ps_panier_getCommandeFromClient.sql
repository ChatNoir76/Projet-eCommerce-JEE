Delimiter |
drop procedure if exists ps_panier_getcommandefromclient |
create procedure ps_panier_getcommandefromclient(in idclient int, 
                                    out errcode int,
                                    out errmsg varchar(1000))
/*
  OBJECTIF :  récupérer le dernier id commande dont le statut est inférieur à 2 (panier validé)
              pour le client passé en paramètre
*/
begin
  declare idcommande int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    Start transaction;
		set errcode = 0;set errmsg = null;set idcommande = -1;

    set idcommande = (select id_commande
                    from commande
                    where id_client = idclient
                    order by date_creation_commande desc limit 1);

    if (isnull(idcommande) or (idcommande = -1)) then
			signal sqlstate 'EL000' set MYSQL_ERRNO=60060;
    end if;

		select id_commande, remise_globale, date_creation_commande, id_client
    from commande
    where id_client = idclient
    order by date_creation_commande desc limit 1;


	commit;
end | delimiter ;

