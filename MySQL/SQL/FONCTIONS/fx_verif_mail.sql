delimiter |
drop function if exists fx_verif_mail |
create function fx_verif_mail(monmail varchar(255)) returns int
/* Objectif : détermine si une adresse mail est valide ou non
			  le statut est renvoyé sous forme d'integer
              le but de cette fonction est aussi de gérer les cas particuliers
détail des valeurs de retour
0--> mail non valide
1--> mail valide (classic minimum)
2--> mail null (guest)
*/
begin
	declare maRep int;
    #vérification du format
	set maRep = (if(monmail like ('%@%.%'), 1, 0));
    #gestion cas particulier GUEST mail=null
    set maRep = (if(isnull(monmail), 2, maRep));
    return maRep;
end |