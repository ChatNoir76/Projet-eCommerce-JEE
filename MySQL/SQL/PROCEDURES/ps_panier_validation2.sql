delimiter |
drop PROCEDURE if exists ps_panier_validation |
create procedure ps_panier_validation(
	in idc int,
	out errcode int,
	out errmsg varchar(1000))
/* Objectif : validation du panier avec déduction des stocks
		  deux cas possibles :
		  1) les stocks sont déduit sans qty négative => ok
		  2) la déduction génère une qty négative => rollback
*/
begin
declare isError boolean;
declare fin_lecture_ligne int default 0;
declare _quantity int (11);
declare _idp int (11);   
declare _qtyDispo int (11); 
declare listeCP cursor for 	select commande_produit.quantite_produit,
							commande_produit.id_produit
							from commande_produit
							where commande_produit.id_commande = idc;
                            
declare continue handler for not found set fin_lecture_ligne = 1;
declare continue handler for 65000
begin
	insert into tmp_panier values (_idp, _qtyDispo);
	set isError = true;
end;
declare exit handler for sqlexception
begin
	get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
	set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
	rollback;
end;
start transaction;
	drop temporary table if exists tmp_panier ;
	create temporary table tmp_panier(
			tmp_idp int (11),
			tmp_quantityDispo int (11));
commit;
        
start transaction;
	set errcode = 0; set errmsg = null; set isError = false;
	open listeCP;
	fetch listeCP into _quantity, _idp;
	repeat
		set _qtyDispo = (SELECT produit.stock_inventaire_produit
		FROM produit
		WHERE produit.id_produit = _idp);
    
		update produit
		set produit.stock_inventaire_produit = (_qtyDispo - _quantity)
		where produit.id_produit = _idp;
        
        if ((_qtyDispo - _quantity) < 0) then
			signal sqlstate 'WL000' set MYSQL_ERRNO=65000, MESSAGE_TEXT = "quantity neg";
        end if;
            
	fetch listeCP into _quantity, _idp;
		until fin_lecture_ligne = 1
	end repeat;
	close listeCP;
    
    -- mise à jour du statut
    insert into histo_commande
    values (now(), 3, idc);
    
    
    
    if (isError) then
		select * from tmp_panier;
        rollback;
	else
		commit;
    end if;
end |