package fr.afpa.ecom.modele;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class Panier {

    private Commande                   _commande;
    private int                        _idClient;
    private ArrayList<CommandeProduit> articles;

    public int get_idCommande() {
        return _commande.get_id();
    }

    public int get_idClient() {
        return _idClient;
    }

    public String getDateCommande() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern( "dd MMMM yyyy" );
        return _commande.get_creationCommande().format( dtf );
    }

    public Commande get_commande() {
        return _commande;
    }

    public int count() {
        int nbcount = 0;
        for ( CommandeProduit cp : articles ) {
            nbcount += cp.get_quantite();
        }
        return nbcount;
    }

    public double getSommeAPayer() {
        double apayer = 0;
        for ( CommandeProduit cp : articles ) {
            apayer += ( cp.get_prix_TTC_unitaire() * cp.get_quantite() );
        }

        return apayer - ( apayer * _commande.get_remiseGlobale() );
    }

    public ArrayList<CommandeProduit> getArticles() {
        return articles;
    }

    public void setArticles( ArrayList<CommandeProduit> articles ) {
        this.articles = articles;
    }

    public void addArticle( CommandeProduit comProd ) {
        if ( this.articles == null ) {
            this.articles = new ArrayList<CommandeProduit>();
        }
        this.articles.add( comProd );
    }

    public Panier( Commande commande, int idClient, ArrayList<CommandeProduit> mesArticles ) {
        this._commande = commande;
        this._idClient = idClient;
        this.articles = ( mesArticles == null ? new ArrayList<CommandeProduit>() : mesArticles );
    }

    public Panier( Commande commande, int idClient ) {
        this._commande = commande;
        this._idClient = idClient;
        this.articles = new ArrayList<CommandeProduit>();
    }

}
