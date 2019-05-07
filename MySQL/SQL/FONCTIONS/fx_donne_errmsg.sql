delimiter |
drop function if exists fx_donne_errmsg |
create function fx_donne_errmsg(errcode int) returns varchar(255)
/* Objectif : retourne le message en fonction de son numéro de code erreur
			  récupération du message dans la table error_message
              si pas de message --> renvoi null
*/
begin
	return (select FR_lib from error_message where iderror_message = errcode);
end |