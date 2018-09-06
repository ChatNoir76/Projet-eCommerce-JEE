package fr.afpa.ecom.controleur.service;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.dao.DaoException;

public class ServPanier {

    public static void initialisationClientCommandePourPanier() throws DaoException, ServiceException {
        // Création et connexion du client
        Client c = new Client();
        Controleur.getDao().getClient().insert( c );
        ServClient.connexionClient( c.get_mail(), c.get_motDePasse() );
        // Création de la commande
        Commande com = new Commande( c.get_id() );
        Controleur.getDao().getCommande().insert( com );
    }
}
