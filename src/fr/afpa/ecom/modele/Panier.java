package fr.afpa.ecom.modele;

import java.util.ArrayList;

import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class Panier {

    private int                        _idCommande;
    private int                        _idClient;
    private ArrayList<CommandeProduit> articles;
    
    public int count() {
        int nbcount = 0;
        for ( CommandeProduit cp : articles ) {
            nbcount += cp.get_quantite();
        }
        return nbcount;
    }
    
    public double getSommeAPayer()
    {
        double apayer = 0;
        for ( CommandeProduit cp : articles ) {
            apayer += (cp.get_prix_TTC_unitaire() * cp.get_quantite());
        }

        return apayer;
    }

    public ArrayList<CommandeProduit> getArticles() {
        return articles;
    }

    public void setArticles( ArrayList<CommandeProduit> articles ) {
        this.articles = articles;
    }

    public Panier( int idCommande, int idClient, ArrayList<CommandeProduit> mesArticles ) {
        this._idCommande = idCommande;
        this._idClient = idClient;
        this.articles = ( mesArticles == null ? new ArrayList<CommandeProduit>() : mesArticles );
    }

    public Panier( int idCommande, int idClient ) {
        this._idCommande = idCommande;
        this._idClient = idClient;
        this.articles = new ArrayList<CommandeProduit>();
    }
    

}
