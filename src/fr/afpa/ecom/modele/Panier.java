package fr.afpa.ecom.modele;

import java.util.ArrayList;

import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class Panier {

    private Commande                   maCommande;
    private Client                     monClient;
    private ArrayList<CommandeProduit> articles;

    public Commande getMaCommande() {
        return maCommande;
    }

    public void setMaCommande( Commande maCommande ) {
        this.maCommande = maCommande;
    }

    public Client getMonClient() {
        return monClient;
    }

    public void setMonClient( Client monClient ) {
        this.monClient = monClient;
    }

    public ArrayList<CommandeProduit> getArticles() {
        return articles;
    }

    public void setArticles( ArrayList<CommandeProduit> articles ) {
        this.articles = articles;
    }

    public Panier( Commande maCommande, Client monClient, ArrayList<CommandeProduit> mesArticles ) {
        this.maCommande = maCommande;
        this.monClient = monClient;
        this.articles = ( mesArticles == null ? new ArrayList<CommandeProduit>() : mesArticles );
    }

    public Panier( Commande maCommande, Client monClient ) {
        this.maCommande = maCommande;
        this.monClient = monClient;
        this.articles = new ArrayList<CommandeProduit>();
    }

}
