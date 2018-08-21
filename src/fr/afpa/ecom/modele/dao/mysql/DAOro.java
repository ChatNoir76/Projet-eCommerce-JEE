package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;
import java.util.ArrayList;

import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;

/**
 * <p> DAOhs = DAO ayant les méthodes pour gérer les classes Histo / Statut reliées aux classes pincipales</p>
 * @author chatnoir
 *	
 * @param <T>
 */
public abstract class DAOro<T> extends DAO<T> {

	//CONSTRUCTEUR
	public DAOro(Connection con, String nomPrefixeTable, EnumObject eo) {
		super(con, eo, nomPrefixeTable + eo.getNomTable());
	}
	
	//T = Historique ou Statut
	public abstract ArrayList<T> getList(int idObj) throws DaoException ;
	

}
