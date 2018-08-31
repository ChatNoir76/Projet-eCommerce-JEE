package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import fr.afpa.ecom.modele.dao.DaoException;


/**
 * @author chatnoir</br>
 * Pattern singleton</br>
 * Module de connexion MySQL unique
 * 
 */
class Singleton {
	
	private static String _url = "jdbc:mysql://localhost:3306/ecommerce?"
	        + "useUnicode=yes&"
	        + "characterEncoding=UTF-8&"
	        + "useSSL=true&noAccessToProcedureBodies=true&"
	        + "useJDBCCompliantTimezoneShift=true&"
	        + "useLegacyDatetimeCode=false&"
	        + "serverTimezone=UTC";
	private static String _pwd = "GoEclipse";
	private static String _driver = "com.mysql.cj.jdbc.Driver";
	private static String _user = "eclipse";
	private static Connection _con = null;
			
	private Singleton() throws DaoException
	{
		try {
			Class.forName(_driver);
			_con = DriverManager.getConnection(_url,_user,_pwd);
		} catch (ClassNotFoundException e) {
			throw new DaoException("Problème avec le driver\n" + e.getMessage());
		} catch (SQLException e) {
			throw new DaoException("Problème avec le DriverManager\n" + e.getMessage());
		}
	}
	
	/**
	 * Instance d'ouverture de connexion MySQL via driver et url par défaut
	 * @return une connexion MySQL
	 * @throws DaoException 
	 */
	public static Connection getInstance() throws DaoException
	{
		if(_con==null) {new Singleton();}
		return _con;
	}
	
	/**
	 * Fermeture de la connexion
	 * @throws DaoException 
	 */
	public void close() throws DaoException
	{
		if(_con!=null)
		{
			try {
				_con.close();
				_con=null;
			} catch (SQLException e) {
				throw new DaoException(e.getErrorCode(),e.getMessage());
			}
		}
	}
	

	

}
	
	

