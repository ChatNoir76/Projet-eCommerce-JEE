package fr.afpa.ecom.modele.dao.mysql;

import java.sql.Connection;

import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.Fournisseur;
import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.modele.secondaire.Statut;

/**
 * @author chatnoir
 * <p>Fabrique d'objets au format MySQL</p>
 */
public class DAOFactory extends AbstractDAOFactory {

private static Connection con; //=Singleton.getInstance();
	

	public DAOFactory() throws DaoException
	{
		con=Singleton.getInstance();
	}

	//FACTORY DES CLASSES PRINCIPALES
	public DAOCP<Client> getClient(){return new DAOCP_Client(con);}
	public DAOCP<Commande> getCommande() {return new DAOCP_Commande(con);}
	public DAOCP<Produit> getProduit() {return new DAOCP_Produit(con);}
	public DAOCP<Fournisseur> getFournisseur() {return new DAOCP_Fournisseur(con);}
	public DAOPanier getPanier(Panier p) {return new DAOPanier(con,p);}

	//FACTORY DES CLASSES SECONDAIRES
	public DAO<Statut> getStatut(EnumObject eo) {return new DAO_Statut(con,eo);}
	

	
	
}
