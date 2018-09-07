package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.modele.dao.ServiceDAO;
import fr.afpa.ecom.modele.secondaire.HistoClassic;
import fr.afpa.ecom.modele.secondaire.HistoProduit;
import fr.afpa.ecom.modele.secondaire.Historique;

/**
 * <p>DAO = DAO Complète, permettant de créer les types principaux</p>
 * @author chatnoir
 * permet de créer un DAOobjet de type T via le DAOFactory
 * <p>Cette DAO crée les types de classe principale</p>
 * @param <T>
 * @param <H>
 */
public abstract class DAOCP<T> extends DAO<T>{
	
	private final String _PSDerStatut = "CALL ps_dernier_statut(?,?,?,?,?)";
	
	public String getHistoClasse()
	{
		return ServiceDAO.Historique + getClasse();
	}
	
	
	//CONSTRUCTEUR
	/**
	 * Constructeur de la couche DAO MySQL
	 * <p>Cette couche DAO est utilisée pour les classe principale</p>
	 * @param con Singleton
	 * @param obj Type de l'objet selon l'énumération
	 */
 	public DAOCP(Connection con, EnumObject eo)
	{
		super(con,eo);
	}
	
	//METHODES COMMUNES
	/**
	 * Renvoie l'historique d'une classe principale
	 * @param idObj
	 * @return ArrayList<Historique>
	 * @throws DaoException
	 * @see Historique
	 */
	public ArrayList<Historique> getHistoriqueFromId(int idObj) throws DaoException
	{
		ArrayList<Historique> al = new ArrayList<Historique>();
		ResultSet rs = null;
		
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getHistoClasse());
			while (rs.next()) 
			{
				switch (this.getEO().getType())
				{
				case 3 : 
					if (rs.getInt(5)==idObj)
					{
						al.add(new HistoProduit(rs.getDate(1),rs.getInt(4),rs.getInt(5),rs.getFloat(2),rs.getDate(3)));
					}
				break;
					
				default :
					if (rs.getInt(3)==idObj)
					{
						al.add(new HistoClassic(rs.getDate(1),rs.getInt(2),rs.getInt(3)));
					}
				}
			}
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return al;
	}
	/**
	 * renvoie le dernier statut de l'objet de la classe principale
	 * <p>appel à une procédure stockée</p>
	 *  <p>ps_dernier_statut</p>
	 * @param id
	 * @return
	 */
	public int getDernierStatut(int idObj) throws DaoException
	{
		int errcode;
		String errmsg;
		int id = -1;
		
		try {
			CallableStatement cs = con().prepareCall(_PSDerStatut);
			//IN
			cs.setString(1, this.getClasse());
			cs.setInt(2,idObj);
			
			//OUT
			cs.registerOutParameter(3, java.sql.Types.INTEGER);
			cs.registerOutParameter(4, java.sql.Types.VARCHAR);
			cs.registerOutParameter(5, java.sql.Types.INTEGER);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(3);
			errmsg = cs.getString(4);
			id = cs.getInt(5);
			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur : récupération de l'id
				return id;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());

		}
	}
	
	//METHODES ABSTRAITES
	/**
	 * Insertion d'un objet T dans la BDD
	 * <p>Ce type d'opération est géré par une procédure stockée</p>
	 * @param obj
	 * @throws DaoException
	 */
	public abstract void insert(T obj) throws DaoException;
	/**
	 * Mise à jour d'un objet T dans la BDD
	 * <p>Ce type d'opération est géré par une procédure stockée</p>
	 * @param obj
	 * @throws DaoException
	 */
	public abstract void update(T obj) throws DaoException;
	/**
	 * Supression d'un objet T dans la BDD
	 * <p>Ce type d'opération est géré par une procédure stockée</p>
	 * @param obj
	 * @throws DaoException
	 */
	public abstract void delete(T obj) throws DaoException;
	
}
