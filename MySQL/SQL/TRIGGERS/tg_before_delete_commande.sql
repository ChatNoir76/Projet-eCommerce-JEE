delimiter |
drop trigger if exists tg_before_delete_commande |
create trigger tg_before_delete_commande before delete on commande
for each row
/*objectif : suppression dans histo commande 
			 suppression dans commande_produit
             pour autoriser la suppression de la commande
*/
begin
        delete from histo_commande
        where old.id_commande = histo_commande.id_commande;
        
        delete from commande_produit
        where old.id_commande = commande_produit.id_commande;
end | delimiter ;



