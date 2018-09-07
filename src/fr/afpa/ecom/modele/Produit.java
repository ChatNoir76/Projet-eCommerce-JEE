package fr.afpa.ecom.modele;

/**
 * @author chatnoir
 * <p>Classe métier</p>
 * @see GenreProduit
 * @see TypeProduit
 */
public class Produit {

	private int _id; 
	private String _nomProduit ;
	private double _prixHT; 
	private int _stockInventaire; 
	private int _stockMin;
	private int _stockObjectif;
	private float _tva; 
	private int _idTypeProduit;
	
	/**
	 * @return l'id du produit
	 * <p>si id=-1, produit créé mais non enregistré dans la bdd</p>
	 */
	public int get_id() {
		return _id;
	}
	/**
	 * @param _id
	 */
	public void set_id(int _id) {
		this._id = _id;
	}
	/**
	 * @return le nom du produit
	 */
	public String get_nomProduit() {
		return _nomProduit;
	}
	/**
	 * @param _nomProduit
	 */
	public void set_nomProduit(String _nomProduit) {
		this._nomProduit = _nomProduit;
	}
	/**
	 * @return le prix HT du produit
	 */
	public double get_prixHT() {
		return _prixHT;
	}
	/**
	 * @param _prixHT
	 */
	public void set_prixHT(double _prixHT) {
		this._prixHT = _prixHT;
	}
	/**
	 * @return le nombre d'exemplaire du produit en stock
	 */
	public int get_stockInventaire() {
		return _stockInventaire;
	}
	/**
	 * @param _stockInventaire
	 */
	public void set_stockInventaire(int _stockInventaire) {
		this._stockInventaire = _stockInventaire;
	}
	/**
	 * @return le nombre d'exemplaire minimum à atteindre avant recommande
	 */
	public int get_stockMin() {
		return _stockMin;
	}
	/**
	 * @param _stockMin
	 */
	public void set_stockMin(int _stockMin) {
		this._stockMin = _stockMin;
	}
	/**
	 * @return le nombre d'exemplaire du produit à avoir en stock après recommande
	 */
	public int get_stockObjectif() {
		return _stockObjectif;
	}
	/**
	 * @param _stockObjectif
	 */
	public void set_stockObjectif(int _stockObjectif) {
		this._stockObjectif = _stockObjectif;
	}
	/**
	 * @return taux de TVA du produit sous forme décimal
	 * <p>exemple : 0.1960 pour une TVA à 19.60%</p>
	 */
	public float get_tva() {
		return _tva;
	}
	/**
	 * @param _tva
	 */
	public void set_tva(float _tva) {
		this._tva = _tva;
	}

	public int get_idTypeProduit() {
        return _idTypeProduit;
    }
    public void set_idTypeProduit( int _idTypeProduit ) {
        this._idTypeProduit = _idTypeProduit;
    }
    
    //CONSTRUCTEUR
	public Produit()
	{
        _id=-1; 
        _nomProduit=null;
        _prixHT=0; 
        _stockInventaire=0; 
        _stockMin=0;
        _stockObjectif=0;
        _tva=0;
        _idTypeProduit = -1;
	}
	
	/**
	 * @param id_produit
	 * @param nom_produit
	 * @param prixht_produit
	 * @param stock_inventaire_produit
	 * @param stock_minimum
	 * @param stock_objectif
	 * @param tva_produit
	 * @param type_produit
	 */
	public Produit(	int id_produit, String nom_produit,double prixht_produit, 
					int stock_inventaire_produit, int stock_minimum, 
					int stock_objectif,float tva_produit, int idTypeProduit)
	{
		_id=id_produit; 
		_nomProduit=nom_produit;
		_prixHT=prixht_produit; 
		_stockInventaire=stock_inventaire_produit; 
		_stockMin=stock_minimum;
		_stockObjectif=stock_objectif;
		_tva=tva_produit; 
		_idTypeProduit=idTypeProduit;
	}
	
	/**
	 * @param nom_produit
	 * @param prixht_produit
	 * @param stock_inventaire_produit
	 * @param stock_minimum
	 * @param stock_objectif
	 * @param tva_produit
	 * @param type_produit
	 */
	public Produit(String nom_produit,double prixht_produit, 
			int stock_inventaire_produit, int stock_minimum, 
			int stock_objectif,float tva_produit, int idTypeProduit)
	{
		_id=-1; 
		_nomProduit=nom_produit;
		_prixHT=prixht_produit; 
		_stockInventaire=stock_inventaire_produit; 
		_stockMin=stock_minimum;
		_stockObjectif=stock_objectif;
		_tva=tva_produit; 
		_idTypeProduit=idTypeProduit;;
	}
	
	@Override
	public String toString()
	{
		return ("produit n°" + _id + " - " + _nomProduit);
	}
}
