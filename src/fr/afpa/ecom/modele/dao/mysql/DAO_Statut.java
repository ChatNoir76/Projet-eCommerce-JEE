package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.modele.dao.ServiceDAO;
import fr.afpa.ecom.modele.secondaire.Statut;

class DAO_Statut extends DAO<Statut> { 
	
	/**
	 * 
	 * @param con
	 * @param eo Classe principale dont la classe Statut sera liée
	 */
	public DAO_Statut(Connection con, EnumObject eo) {
		super(con, eo, ServiceDAO.Statut + eo.getNomTable());
	}

	@Override
	public ArrayList<Statut> getAll() throws DaoException {
		ArrayList<Statut> al = new ArrayList<Statut>();
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse());
			
			while (rs.next()) 
			{ 
				al.add(new Statut(rs.getInt(1),rs.getString(2),getEO()));
			}
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return al;
	}

	@Override
	public Statut getById(int id) throws DaoException {
		Statut s = null;
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse() + " where id_statut_" + getEO().getNomTable() + "=" + id);
			
			if (rs.first()) 
			{
				s = new Statut(rs.getInt(1),rs.getString(2),getEO());
			}
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return s;
	}

}
