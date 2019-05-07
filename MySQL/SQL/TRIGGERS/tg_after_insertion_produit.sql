delimiter |
drop trigger if exists tg_after_insertion_produit |
create trigger tg_after_insertion_produit after insert on produit
/* Objectif : 	Création d'un lien entre le nouveau produit et son statut
				date de dispo à now() en attendant via @date_dispo_produit
*/
for each row
begin
	# creation du lien
	insert into histo_produit(date_chg_statut, remise_eventuelle, date_dispo, id_statut_produit, id_produit) values
    (now(), 0.0000, @date_dispo_produit, 1, new.id_produit);
end | delimiter ;