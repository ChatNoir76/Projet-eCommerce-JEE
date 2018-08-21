package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Fournisseur;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.service.Service;

class DAOCP_Fournisseur extends DAOCP<Fournisseur> {

	private final String _PSinsert = "CALL ps_fournisseur_insertion(?,?,?,?,?,?,?,?,?)";
	private final String _PSupdate = "CALL ps_fournisseur_update(?,?,?,?,?,?,?,?,?)";
	private final String _PSdelete = "CALL ps_fournisseur_delete(?,?,?)";
	
	public DAOCP_Fournisseur(Connection con) {
		super(con, EnumObject.Fournisseur);
		
	}

	@Override
	public void insert(Fournisseur obj) throws DaoException {
		// call ps_fournisseur_insertion("test1","mailfournisseur1@test.com",null,null,null,null,@a,@b,@c);
		int errcode;
		String errmsg;
		int id;
		
		try {
			CallableStatement cs = con().prepareCall(_PSinsert);
			//IN
			cs.setString(1, obj.get_nom());
			cs.setString(2,obj.get_mail());
			cs.setString(3,obj.get_adresse());
			cs.setString(4,obj.get_codePostal());
			cs.setString(5,obj.get_ville());
			cs.setString(6,obj.get_pays());
			
			//OUT
			cs.registerOutParameter(7, java.sql.Types.INTEGER);
			cs.registerOutParameter(8, java.sql.Types.VARCHAR);
			cs.registerOutParameter(9, java.sql.Types.INTEGER);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(7);
			errmsg = cs.getString(8);
			id = cs.getInt(9);
			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur : récupération de l'id
				obj.set_id(id);
				Service.mdInformation("Création du fournisseur n°" + id + " effectuée");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}

	@Override
	public void update(Fournisseur obj) throws DaoException {
		int errcode;
		String errmsg;
		
		try {
			CallableStatement cs = con().prepareCall(_PSupdate);
			//IN
			cs.setInt(1, obj.get_id());
			cs.setString(2, obj.get_nom());
			cs.setString(3,obj.get_mail());
			cs.setString(4,obj.get_adresse());
			cs.setString(5,obj.get_codePostal());
			cs.setString(6,obj.get_ville());
			cs.setString(7,obj.get_pays());
			
			//OUT
			cs.registerOutParameter(8, java.sql.Types.INTEGER);
			cs.registerOutParameter(9, java.sql.Types.VARCHAR);
			cs.execute();
			
			//Récupération des OUT
			errcode = cs.getInt(8);
			errmsg = cs.getString(9);

			
			//Traitement des informations (id+erreurs)
			switch (errcode)
			{
			case 0: //pas d'erreur : récupération de l'id
				Service.mdInformation("Fournisseur n°" + obj.get_id() + " à été mise à jour");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}

	@Override
	public void delete(Fournisseur obj) throws DaoException {
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
				Service.mdInformation("Fournisseur n°" + obj.get_id() + " à été supprimé de la base de données");
				break;
			default:
				throw new DaoException(errcode,errmsg);
			}
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
	}

	@Override
	public ArrayList<Fournisseur> getAll() throws DaoException {
		ArrayList<Fournisseur> al = new ArrayList<Fournisseur>();
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse());
			
			while (rs.next()) 
			{
				al.add(new Fournisseur(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return al;
	}

	@Override
	public Fournisseur getById(int id) throws DaoException {
		Fournisseur f=null;
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse() + " where id_fournisseur=" + id);
			
			if (rs.first()) 
			{
				f = new Fournisseur(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getString(5), rs.getString(6), rs.getString(7));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return f;
	}

}
