package fr.afpa.ecom.controleur.service;

import java.util.ArrayList;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.DaoException;

public class ServSession {

    /**
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon
     * 
     * @param nomChamp
     * @return la valeur du parametre
     */
    public static String getValeurChamp( String nomChamp ) {
        String valeur = Controleur.getRequest().getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

    public static String getSessionString( String attribut ) {
        return Controleur.getSession().getAttribute( attribut ) == null
                ? null
                : (String) Controleur.getSession().getAttribute( attribut );
    }

    public static Client getSessionClient() {
        return Controleur.getSession().getAttribute( Controleur.ATT_CLIENT ) == null
                ? null
                : (Client) Controleur.getSession().getAttribute( Controleur.ATT_CLIENT );
    }

    public static Produit getSessionProduit() {
        return Controleur.getSession().getAttribute( Controleur.ATT_PRODUIT ) == null
                ? null
                : (Produit) Controleur.getSession().getAttribute( Controleur.ATT_PRODUIT );
    }

    public static int getSessionInt( String attribut ) {
        return Controleur.getSession().getAttribute( attribut ) == null
                ? -1
                : (int) Controleur.getSession().getAttribute( attribut );
    }

    @SuppressWarnings( "unchecked" )
    public static ArrayList<Client> getSessionListClient() {
        return Controleur.getSession().getAttribute( Controleur.ATT_LISTE_CLIENT ) == null
                ? null
                : (ArrayList<Client>) Controleur.getSession().getAttribute( Controleur.ATT_LISTE_CLIENT );
    }

    @SuppressWarnings( "unchecked" )
    public static ArrayList<Produit> getSessionListProduit() {
        return Controleur.getSession().getAttribute( Controleur.ATT_LISTE_PRODUIT ) == null
                ? null
                : (ArrayList<Produit>) Controleur.getSession().getAttribute( Controleur.ATT_LISTE_PRODUIT );
    }

    public static Panier getSessionPanier() {
        return Controleur.getSession().getAttribute( Controleur.ATT_PANIER ) == null
                ? null
                : (Panier) Controleur.getSession().getAttribute( Controleur.ATT_PANIER );
    }

    public static void setSessionListProduit() throws DaoException {

        Controleur.getRequest().setAttribute( Controleur.ATT_LISTE_PRODUIT, Controleur.getDao().getProduit().getAll() );
    }

    public static void setSessionListClient() throws DaoException {
        Controleur.getRequest().setAttribute( Controleur.ATT_LISTE_CLIENT, Controleur.getDao().getClient().getAll() );
    }

    public static void setSessionProduitToView() throws DaoException {
        int id = Integer.parseInt( ServSession.getValeurChamp( Controleur.PARAM_IDPRODUIT ) );
        Controleur.getRequest().setAttribute( Controleur.ATT_PRODUIT, ServProduit.getProduitFromId( id ) );
    }

    public static void setSessionPanier( Panier p ) {
        Controleur.getSession().setAttribute( Controleur.ATT_PANIER, p );
    }

}
