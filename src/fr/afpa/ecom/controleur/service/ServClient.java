package fr.afpa.ecom.controleur.service;

import java.util.ArrayList;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.dao.DaoException;

public class ServClient {

    public static Client getClientFromList( String email, String mdp )
            throws ServiceException, DaoException {
        ArrayList<Client> maListe = Controleur.getDao().getClient().getAll();

        Client temp = null;

        for ( Client c : maListe ) {
            if ( c.get_mail().equals( email ) ) {
                temp = c;
            }
        }

        if ( temp == null ) {
            throw new ServiceException( "Combinaison email / mot de passe incorrecte..." );
        }
        if ( !temp.get_motDePasse().equals( mdp ) ) {
            throw new ServiceException( "Combinaison email / mot de passe incorrecte..." );
        }
        return temp;
    }

    public static void deconnexionClient() {
        Controleur.getSession().setAttribute( Controleur.ATT_CLIENT, null );
        Controleur.getSession().setAttribute( Controleur.ATT_CLIENT_STT, null );
    }

    public static Client connexionClient( String mail, String mdp )
            throws ServiceException, DaoException {
        Client c = null;
        c = getClientFromList( mail, mdp );
        if ( c != null ) {
            int idstatut = Controleur.getDao().getClient().getDernierStatut( c.get_id() );
            if (idstatut >0)
            {
            Controleur.getSession().setAttribute( Controleur.ATT_CLIENT, c );
            Controleur.getSession().setAttribute( 
                    Controleur.ATT_CLIENT_STT,
                    idstatut );
            }
        } else {
            throw new ServiceException( "Connexion impossible..." );
        }
        return c;
    }

}
