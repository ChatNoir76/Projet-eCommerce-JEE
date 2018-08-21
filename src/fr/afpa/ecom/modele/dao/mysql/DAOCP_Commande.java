package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.modele.dao.ServiceDAO;
import fr.afpa.ecom.service.Service;

class DAOCP_Commande extends DAOCP<Commande> {

	private final String _PSinsert = "CALL ps_commande_insertion(?,?,?,?,?)";
	private final String _PSupdate = "CALL ps_commande_update(?,?,?,?)";
	private final String _PSdelete = "CALL ps_commande_delete(?,?,?)";
	
	public DAOCP_Commande(Connection con) {
		super(con, EnumObject.Commande);
	}

	@Override
	public void insert(Commande obj) throws DaoException {
		int errcode;
		String errmsg;
		int id;
		
		try {
			CallableStatement cs = con().prepareCall(_PSinsert);
			//IN
			cs.setDouble(1, obj.get_remiseGlobale());
			cs.setInt(2,obj.get_idClient());
			
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
				obj.set_id(id);
				Service.mdInformation("Création de la commande n°" + id + " effectuée");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}

	@Override
	public void update(Commande obj) throws DaoException {
		int errcode;
		String errmsg;
		
		try {
			CallableStatement cs = con().prepareCall(_PSupdate);
			//IN
			cs.setInt(1, obj.get_id());
			cs.setDouble(2,obj.get_remiseGlobale());
			
			//OUT
			cs.registerOutParameter(3, java.sql.Types.INTEGER);
			cs.registerOutParameter(4, java.sql.Types.VARCHAR);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(3);
			errmsg = cs.getString(4);
			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur : récupération de l'id
				Service.mdInformation("Commande n°" + obj.get_id() + " à été mise à jour");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}

	@Override
	public void delete(Commande obj) throws DaoException {
		int errcode;
		String errmsg;
		
		try {
			CallableStatement cs = con().prepareCall(_PSdelete);
			//IN
			cs.setInt(1,obj.get_id());
			
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
			case 0: //pas d'erreur : récupération de l'id
				Service.mdInformation("Commande n°" + obj.get_id() + " à été supprimé de la base de données");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}

	@Override
	public ArrayList<Commande> getAll() throws DaoException {
		ArrayList<Commande> al = new ArrayList<Commande>();
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse());
			
			while (rs.next()) 
			{ //id_commande, remise_globale, date_creation_commande, id_client
				al.add(new Commande(rs.getInt(1),rs.getDouble(2),ServiceDAO.getDateTime(rs.getDate(3),rs.getTime(3)), rs.getInt(4)));
			}
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return al;
	}

	@Override
	public Commande getById(int id) throws DaoException {
		Commande c = null;
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse() + " where id_commande=" + id);
			
			if (rs.first()) 
			{
				c = new Commande(rs.getInt(1),rs.getDouble(2),ServiceDAO.getDateTime(rs.getDate(3),rs.getTime(3)), rs.getInt(4));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return c;
	}

}
