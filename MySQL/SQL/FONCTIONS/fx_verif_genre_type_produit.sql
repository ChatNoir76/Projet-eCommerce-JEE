delimiter |
drop function if exists fx_verif_genre_type_produit |
create function fx_verif_genre_type_produit(id_type int, id_genre int) returns int
/* Objectif : détermine si un genre produit peut etre appliquer par rapport à son type
			  ceci est déterminé par la table relationnelle type_genre_produit

-2--> l'id type n'a pas été trouvé dans type_genre_produit
-1--> l'id genre n'a pas été trouvé dans type_genre_produit
0--> la relation n'est pas permise
1--> la relation est autorisée
*/
begin
	declare maRep int;declare idg int;declare idt int;declare nbRel int;
    set idt = ( select count(*) 
        from type_genre_produit
        where id_type_produit = id_type);
    set idg = ( select count(*) 
        from type_genre_produit
        where id_genre_produit = id_genre);  

    #autorisation de la relation
    set nbRel = (select count(*)
        from type_genre_produit
        where id_type_produit = id_type
        and id_genre_produit = id_genre);
    set maRep = (if (nbRel <= 0,0,1));

    #vérification des ids
    set maRep = (if( idg <= 0,-1,maRep));
    set maRep = (if( idt <= 0,-2,maRep));
    return maRep;
end |