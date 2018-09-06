package fr.afpa.ecom.controleur.service;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.DaoException;

public class ServProduit {

    public static Produit getProduitFromId( int idProduit ) throws DaoException {

        if ( idProduit < 0 ) {
            return null;
        } else {
            return Controleur.getDao().getProduit().getById( idProduit );
        }

    }

}
