package fr.afpa.ecom.modele.dao;

import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.Fournisseur;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.mysql.DAO;
import fr.afpa.ecom.modele.secondaire.Statut;
import fr.afpa.ecom.modele.dao.mysql.DAOCP;
import fr.afpa.ecom.modele.dao.mysql.DAOFactory;
import fr.afpa.ecom.modele.dao.mysql.DAOPanier;

/**
 * @author chatnoir
 * <p>Pour gérer différents types de DAO (MySQL, MSSQL)</p>
 * <p>elle permet de créer des objets DAO en fonction du language BDD demandé </p>
 */
public abstract class AbstractDAOFactory {
	
	//CONSTRUCTEUR
	/**
	 * @param type il s'agit du language souhaité
	 * @return le pattern DAO du language souhaité
	 * <p>il n'y a que le pattern MySQL de disponible avec cette version</p>
	 * @throws DaoException 
	 */
	public static AbstractDAOFactory getFactory(EnumDAO type) throws DaoException{
	    switch(type.getTypeDAO()){
	      case 1:
	        return new DAOFactory();
	      default: //ici ajouter les autres daofactory ex 2 pour MSSQL
	        return null;
	    }
	}
	
	
	//PRINCIPALE
	/**
	 * @return la DAO de type Client
	 */
	public abstract DAOCP<Client> getClient();
	/**
	 * @return la DAO de type Commande
	 */
	public abstract DAOCP<Commande> getCommande();
	/**
	 * @return la DAO de type Produit
	 */
	public abstract DAOCP<Produit> getProduit();
	/**
	 * @return la DAO de type Fournisseur
	 */
	public abstract DAOCP<Fournisseur> getFournisseur();
	
	public abstract DAOPanier getPanier(int idClient) throws DaoException;
	
	//SECONDAIRE
	public abstract DAO<Statut> getStatut(EnumObject eo);
	//public abstract DAOro<Historique> getHisto(EnumObject eo);
	
}
