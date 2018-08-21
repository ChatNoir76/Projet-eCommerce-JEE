package fr.afpa.ecom.service;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import fr.afpa.ecom.modele.Client;

public class Service {

    public static void mdInformation( String message ) {
        JOptionPane.showMessageDialog( null, message, "Information", JOptionPane.INFORMATION_MESSAGE );
    }

    public static void mdAvertissement( String message ) {
        JOptionPane.showMessageDialog( null, message, "Attention", JOptionPane.WARNING_MESSAGE );
    }

    public static void mdErreur( String message ) {
        JOptionPane.showMessageDialog( null, message, "Erreur", JOptionPane.ERROR_MESSAGE );
    }

    public static int verifConnexionClient( ArrayList<Client> maListe, String email, String mdp ) {
        // 0 => pas d'erreur
        // 1 => email non trouvé
        // 2 => mdp erroné

        Client temp = null;

        for ( Client c : maListe ) {
            if ( c.get_mail().equals( email ) ) {
                temp = c;
            }
        }

        if ( temp == null ) {
            return 1;
        }

        return ( temp.get_motDePasse().equals( mdp ) ? 0 : 2 );
    }
}
