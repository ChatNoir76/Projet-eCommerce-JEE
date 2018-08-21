package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;

class DAOCP_Produit extends DAOCP<Produit> {
	
	private final String _PSinsert = "CALL ps_produit_insertion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String _PSupdate = "CALL ps_produit_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String _PSdelete = "CALL ps_produit_delete(?,?,?)";
	
	//CONSTRUCTEUR
	public DAOCP_Produit(Connection con) {
		super(con,EnumObject.Produit);
	}
	
	//METHODES
	@Override
	public ArrayList<Produit> getAll() throws DaoException {
		ArrayList<Produit> al = new ArrayList<Produit>();
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse());
			
			while (rs.next()) 
			{
				al.add(new Produit(rs.getInt(1),rs.getString(2), rs.getDouble(3),rs.getInt(4), 
						rs.getInt(5), rs.getInt(6), rs.getFloat(7)));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return al;
	}
	@Override
	public void insert(Produit obj) throws DaoException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void update(Produit obj) throws DaoException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(Produit obj) throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Produit getById(int id) throws DaoException {
		Produit p=null;
		ResultSet rs = null;
		try {
			rs = con().createStatement().executeQuery("SELECT * FROM " + getClasse() + " where id_client=" + id);
			
			if (rs.first()) 
			{
				p = new Produit(rs.getInt(1),rs.getString(2), rs.getDouble(3),rs.getInt(4), 
						rs.getInt(5), rs.getInt(6), rs.getFloat(7));
			}
			
			rs.close();
		} catch (SQLException e) {
			throw new DaoException(e.getErrorCode(),e.getMessage());
		}
		return p;
	}

}
