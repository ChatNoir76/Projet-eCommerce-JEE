package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class DAOPanier {

    private Connection _con=null;
    private Panier _p = null;
    
	//CONSTRUCTEUR
	public DAOPanier(Connection con, Panier p) {
		_con = con;
		_p =p;
	}
	
	public ArrayList<CommandeProduit> getAllInPanier()
	{
	    ArrayList<CommandeProduit> lcp = null;
	    
	    return lcp;
	}
	
	public void ajoutPanier(CommandeProduit cp)
	{
	    // ps_commandeProduit_insertion
	}
	
	

}
