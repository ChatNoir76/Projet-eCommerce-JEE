delimiter |
drop trigger if exists tg_after_insertion_commande |
create trigger tg_after_insertion_commande after insert on commande
/* Objectif : Création d'un lien entre la nouvelle commande et son statut
*/
for each row
begin
	# creation d'un lien entre commande et son nouveau statut
	insert into histo_commande(date_chg_statut, id_statut_commande, id_commande) values
    (now(), 1, new.id_commande);
end | delimiter ;