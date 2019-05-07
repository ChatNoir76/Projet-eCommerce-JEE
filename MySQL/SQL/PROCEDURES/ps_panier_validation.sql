Delimiter |
drop procedure if exists ps_panier_validation |
create procedure ps_panier_validation(in idc int,
                                out errcode int,
                                out errmsg varchar(1000))
/* Objectif : update produit dans la table commandeproduit (panier)
			  deux cas possibles :
              1) la quantité mise a jour est superieur à 1
              2) la quantité mise a jour est inferieurou egale à 0 --> delete
*/
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;

    select commande_produit.*, produit.*
    from commande_produit, produit
    where commande_produit.quantite_produit > produit.stock_inventaire_produit
    and commande_produit.id_produit = produit.id_produit
    and commande_produit.id_commande = idc;

	commit;
end | delimiter ;


