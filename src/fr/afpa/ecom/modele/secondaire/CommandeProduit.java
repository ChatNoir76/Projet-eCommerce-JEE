package fr.afpa.ecom.modele.secondaire;

import fr.afpa.ecom.modele.Produit;

public class CommandeProduit {

    private Produit    _produit;
    private int    _quantite;
    private double _prix_HT;
    private float  _remise;
    private float  _tva;
    private double _prix_TTC;

    public int get_quantite() {
        return _quantite;
    }

    public double get_prix_HT() {
        return Math.floor( _prix_HT * 100 )/100;
    }

    public double get_remise() {
        return Math.floor( _remise * 100 )/100;
    }

    public double get_tva() {
        return Math.floor( _tva * 100 )/100;
    }

    public double get_prix_TTC() {
        return Math.floor( _prix_TTC * 100 )/100;
    }

    public String toString()
    {
        return "article n°" + _produit.get_id() + " qty(" + _quantite + ")";
    }
    
    public Produit get_produit() {
        return _produit;
    }

    public CommandeProduit( int quantite, double prix_HT, float remise, float tva, double prix_TTC ,Produit produit) {
        super();
        this._produit = produit;
        this._quantite = quantite;
        this._prix_HT = prix_HT;
        this._remise = remise;
        this._tva = tva;
        this._prix_TTC = prix_TTC;
    }

}
