delimiter |
drop trigger if exists tg_after_insertion_fournisseur |
create trigger tg_after_insertion_fournisseur after insert on fournisseur
/* Objectif : Création d'un lien entre le nouveau fournisseur et son statut (1 : actif par défaut)
*/
for each row
begin
	# creation du lien
	insert into histo_fournisseur(date_chg_statut, id_statut_fournisseur, id_fournisseur) values
    (now(), 1, new.id_fournisseur);
end | delimiter ;