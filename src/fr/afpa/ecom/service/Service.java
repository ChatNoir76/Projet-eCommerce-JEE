package fr.afpa.ecom.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.mysql.DAOCP;

public class Service {

    private static final String ATT_CLIENT     = Controleur.getATT_CLIENT();
    private static final String ATT_CLIENT_STT = Controleur.getATT_CLIENT_STT();

    public static void mdInformation( String message ) {
        JOptionPane.showMessageDialog( null, message, "Information", JOptionPane.INFORMATION_MESSAGE );
    }

    public static void mdAvertissement( String message ) {
        JOptionPane.showMessageDialog( null, message, "Attention", JOptionPane.WARNING_MESSAGE );
    }

    public static void mdErreur( String message ) {
        JOptionPane.showMessageDialog( null, message, "Erreur", JOptionPane.ERROR_MESSAGE );
    }

    public static Client getClientFromList( ArrayList<Client> maListe, String email, String mdp )
            throws connexionException {

        Client temp = null;

        for ( Client c : maListe ) {
            if ( c.get_mail().equals( email ) ) {
                temp = c;
            }
        }

        if ( temp == null ) {
            throw new connexionException( "Combinaison email / mot de passe incorrecte..." );
        }
        if ( !temp.get_motDePasse().equals( mdp ) ) {
            throw new connexionException( "Combinaison email / mot de passe incorrecte..." );
        }
        return temp;
    }

    /*
     * 
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * 
     * sinon.
     * 
     */
    public static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

    public static Client getSessionClient( HttpSession session ) {
        return (Client) session.getAttribute( ATT_CLIENT );
    }

    public static int getSessionLevel( HttpSession session ) {
        return session.getAttribute( ATT_CLIENT_STT ) == null ? -1 : (int) session.getAttribute( ATT_CLIENT_STT );
    }

    public static void deconnexionClient( HttpSession session ) {
        session.setAttribute( ATT_CLIENT, null );
        session.setAttribute( ATT_CLIENT_STT, null );
    }

    public static void connexionClient( HttpSession session, String mail, String mdp )
            throws connexionException, DaoException {
        Client c = null;
        c = getClientFromList( Controleur.getDao().getClient().getAll(), mail, mdp );
        if ( c != null ) {
            session.setAttribute( ATT_CLIENT, c );
            session.setAttribute( ATT_CLIENT_STT, Controleur.getDao().getClient().getDernierStatut( c.get_id() ) );
        }
    }

    public static Produit getProduitFromStrId( String idProduit ) throws DaoException {

        if ( idProduit == null ) {
            return null;
        } else {
            int id = Integer.parseInt( idProduit );
            Produit p;
            p = Controleur.getDao().getProduit().getById( id );
            return p;
        }

    }
}
