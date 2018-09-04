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
        if ( session.getAttribute( Controleur.getATT_CLIENT() ) == null ) {
            return null;
        } else {
            return (Client) session.getAttribute( Controleur.getATT_CLIENT() );
        }
    }

    public static int getSessionLevel( HttpSession session ) {
        return session.getAttribute( Controleur.getATT_CLIENT_STT() ) == null ? 0
                : (int) session.getAttribute( Controleur.getATT_CLIENT_STT() );
    }

    public static void deconnexionClient( HttpSession session ) {
        session.setAttribute( Controleur.getATT_CLIENT(), null );
        session.setAttribute( Controleur.getATT_CLIENT_STT(), null );
    }

    public static void connexionClient( HttpSession session, String mail, String mdp )
            throws connexionException, DaoException {
        Client c = null;
        c = getClientFromList( Controleur.getDao().getClient().getAll(), mail, mdp );
        if ( c != null ) {
            session.setAttribute( Controleur.getATT_CLIENT(), c );
            session.setAttribute( Controleur.getATT_CLIENT_STT(),
                    Controleur.getDao().getClient().getDernierStatut( c.get_id() ) );
        }
    }

    public static Produit getProduitFromStrId( int idProduit ) throws DaoException {

        if ( idProduit < 0 ) {
            return null;
        } else {
            return Controleur.getDao().getProduit().getById( idProduit );
        }

    }
}
