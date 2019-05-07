/* Objectif : avoir une vue histo_commande + id_client
			  avec le statut commande le plus récent
*/
drop view if exists vw_histo_panier;
create view vw_histo_panier as
	select 	t2.id_client, t2.remise_globale, t2.date_creation_commande,
			t1.id_commande, t1.id_statut_commande, t1.date_chg_statut
	from histo_commande t1, commande t2
	where t1.id_commande = t2.id_commande and t1.date_chg_statut=(select max(date_chg_statut) from histo_commande t3 where t3.id_commande=t1.id_commande );
