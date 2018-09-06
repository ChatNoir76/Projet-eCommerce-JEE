package fr.afpa.ecom.modele.secondaire;

public class CommandeProduit {

    private int    _idproduit;
    private int    _quantite;
    private double _prix_HT;
    private float  _remise;
    private float  _tva;
    private double _prix_TTC;

    public int get_quantite() {
        return _quantite;
    }

    public double get_prix_HT() {
        return _prix_HT;
    }

    public float get_remise() {
        return _remise;
    }

    public float get_tva() {
        return _tva;
    }

    public double get_prix_TTC() {
        return _prix_TTC;
    }

    public String toString()
    {
        return "article n°" + _idproduit + " qty(" + _quantite + ")";
    }

    public CommandeProduit( int idproduit, int quantite, double prix_HT, float remise, float tva, double prix_TTC ) {
        super();
        this._idproduit = idproduit;
        this._quantite = quantite;
        this._prix_HT = prix_HT;
        this._remise = remise;
        this._tva = tva;
        this._prix_TTC = prix_TTC;
    }

}
