package fr.afpa.ecom.modele;

import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class Panier {

    private Commande maCommande;
    private Client monClient;
    private CommandeProduit[] articles;
    
    public Panier( Commande maCommande, Client monClient ) {
        super();
        this.maCommande = maCommande;
        this.monClient = monClient;
    }
    
    
    
    
    
}
