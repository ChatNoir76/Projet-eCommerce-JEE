package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.modele.dao.ServiceDAO;
import fr.afpa.ecom.service.Service;

class DAOCP_Client extends DAOCP<Client>{
	
	private final String _PSinsert = "CALL ps_client_insertion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String _PSupdate = "CALL ps_client_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String _PSdelete = "CALL ps_client_delete(?,?,?)";
	
	//CONSTRUCTEUR
	/**
	 * Connexion venant d'un singleton MySQL
	 * @param con parametre de connexion
	 */
	public DAOCP_Client(Connection con) {
		super(con, EnumObject.Client);
	}

	//METHODES
	@Override
	public ArrayList<Client> getAll() throws DaoException {
		ArrayList<Client> al = new ArrayList<Client>();
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse());
			
			while (rs.next()) 
			{
				al.add(new Client(rs.getInt(1),ServiceDAO.getDateTime(rs.getDate(2),rs.getTime(2)), rs.getString(3),rs.getString(4), 
						ServiceDAO.RemplaceStringNull(rs.getString(5),"i").charAt(0), rs.getString(6), 
						rs.getString(7), ServiceDAO.getDateTime(rs.getDate(8),rs.getTime(8)), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14)));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return al;
	}
	@Override
	public void insert(Client obj) throws DaoException {
		int errcode;
		String errmsg;
		int id;
		
		try {
			CallableStatement cs = con().prepareCall(_PSinsert);
			//IN
			cs.setDate(1, ServiceDAO.setDateTime(obj.get_dateInscription()));
			cs.setString(2,obj.get_nom());
			cs.setString(3,obj.get_prenom());
			cs.setString(4,obj.get_sexeToString());
			cs.setString(5,obj.get_mail());
			cs.setString(6,obj.get_tel());
			cs.setDate(7, ServiceDAO.setDateTime(obj.get_dateNaissance()));
			cs.setString(8,obj.get_adresse());
			cs.setString(9,obj.get_codePostal());
			cs.setString(10,obj.get_ville());
			cs.setString(11,obj.get_pays());
			cs.setString(12,obj.get_commentaire());
			cs.setString(13,obj.get_motDePasse());
			
			//OUT
			cs.registerOutParameter(14, java.sql.Types.INTEGER);
			cs.registerOutParameter(15, java.sql.Types.VARCHAR);
			cs.registerOutParameter(16, java.sql.Types.INTEGER);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(14);
			errmsg = cs.getString(15);
			id = cs.getInt(16);
			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur : récupération de l'id
				obj.set_id(id);
				Service.mdInformation("Création du client n°" + id + " effectuée");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		
	}
	@Override
	public void update(Client obj) throws DaoException {
		int errcode;
		String errmsg;
		
		try {
			CallableStatement cs = con().prepareCall(_PSupdate);
			//IN
			cs.setInt(1, obj.get_id());
			cs.setString(2,obj.get_nom());
			cs.setString(3,obj.get_prenom());
			cs.setString(4,obj.get_sexeToString());
			cs.setString(5,obj.get_mail());
			cs.setString(6,obj.get_tel());
			cs.setDate(7, ServiceDAO.setDateTime(obj.get_dateNaissance()));
			cs.setString(8,obj.get_adresse());
			cs.setString(9,obj.get_codePostal());
			cs.setString(10,obj.get_ville());
			cs.setString(11,obj.get_pays());
			cs.setString(12,obj.get_commentaire());
			cs.setString(13,obj.get_motDePasse());
			
			//OUT
			cs.registerOutParameter(14, java.sql.Types.INTEGER);
			cs.registerOutParameter(15, java.sql.Types.VARCHAR);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(14);
			errmsg = cs.getString(15);
			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur : récupération de l'id
				Service.mdInformation("Client n°" + obj.get_id() + " mise à jour avec succès...");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}
	@Override
	public void delete(Client obj) throws DaoException {
		int errcode;
		String errmsg;
		
		try {
			CallableStatement cs = con().prepareCall(_PSdelete);
			//IN
			cs.setInt(1, obj.get_id());
			
			//OUT
			cs.registerOutParameter(2, java.sql.Types.INTEGER);
			cs.registerOutParameter(3, java.sql.Types.VARCHAR);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(2);
			errmsg = cs.getString(3);
			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur
				Service.mdInformation("Client n°" + obj.get_id() + " à été supprimé de la base de données");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}
	@Override
	public Client getById(int id) throws DaoException {
		Client c=null;
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse() + " where id_client=" + id);
			
			if (rs.first()) 
			{
				c = new Client(rs.getInt(1),ServiceDAO.getDateTime(rs.getDate(2),rs.getTime(2)), rs.getString(3),rs.getString(4), 
						ServiceDAO.RemplaceStringNull(rs.getString(5),"i").charAt(0), rs.getString(6), 
						rs.getString(7), ServiceDAO.getDateTime(rs.getDate(8),rs.getTime(8)), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return c;
	}

}
