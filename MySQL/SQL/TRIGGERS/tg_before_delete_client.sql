delimiter |
drop trigger if exists tg_before_delete_client |
create trigger tg_before_delete_client before delete on client
for each row
/*objectif : autoriser la suppression d'un client ayant un statut guest
			 suppression dans histo_client
             suppression dans commande
*/
begin
	declare StatutMaxHisto int;

	-- recupère le nombre de fois ou l\'id du client est > 1
    set StatutMaxHisto = (Select max(histo_client.id_statut_client) from histo_client where histo_client.id_client = old.id_client);

    if (StatutMaxHisto = 1) then
		-- suppression dans histo_client
		delete from histo_client
        where histo_client.id_client = old.id_client;
        
        -- suppression dans commande
        delete from commande
        where old.id_client = commande.id_client;

    end if;
    
end | delimiter ;



