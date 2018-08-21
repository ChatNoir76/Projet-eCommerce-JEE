package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;

public abstract class DAO<T> {
	
	private Connection _con=null;
	private EnumObject _eo;
	private String _nTable;
	
	//ACCESSEURS
	/**
	 * Récupère le nom de la Classe/Table Principale liée à la DAO
	 * @return nom de la table principale
	 */
	protected EnumObject getEO() {
		return _eo;
	}
	protected Connection con()
	{
		return _con;
	}
	public String getClasse()
	{
		return _nTable;
	}
	
	//CONSTRUCTEUR
 	public DAO(Connection con, EnumObject eo) {
		this._con = con;
		this._eo = eo;
		this._nTable = eo.getNomTable();
	}
	public DAO(Connection con, EnumObject eo, String nomTable) {
		this._con = con;
		this._eo = eo;
		this._nTable = nomTable;
	}

	//METHODES COMMUNES
	/**
	 * Récupere la liste des noms de colonne de la table SQL
	 * <p>La requete exécutée est de la forme : SELECT * FROM (nom table)</p>
	 * @return Liste des noms
	 * @throws DaoException
	 */
	public ArrayList<String> getNomColonneDAO() throws DaoException
	{
		ResultSetMetaData md = null;
		ArrayList<String> nomColonne = new ArrayList<String>();
		ResultSet rs = null;
		
		try {
			rs = _con.createStatement().executeQuery("SELECT * FROM " + getClasse());
			md = rs.getMetaData();
			
			for (int a = 1;a<=md.getColumnCount();a++)
			{
				nomColonne.add(md.getColumnLabel(a));
			}
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return nomColonne;
	}
	
	//METHODES Abstraites
	/**
	 * Retourne une liste d'objet T
	 * @return Liste d'objets
	 * @throws DaoException
	 */
	public abstract ArrayList<T> getAll() throws DaoException;
	public abstract T getById(int id) throws DaoException;
}
