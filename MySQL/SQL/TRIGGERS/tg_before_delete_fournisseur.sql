delimiter |
drop trigger if exists tg_before_delete_fournisseur |
create trigger tg_before_delete_fournisseur before delete on fournisseur
/* Objectif : suppression de la clef étrangère dans histo_fournisseur

condition : ne pas avoir de référence dans histo_prix_fournisseur
			(contrainte géré par ps_commande_delete)
*/
for each row
begin
	# suppression de l'historique histo_fournisseur
    delete from histo_fournisseur
	where old.id_fournisseur = histo_fournisseur.id_fournisseur;
end | delimiter ;