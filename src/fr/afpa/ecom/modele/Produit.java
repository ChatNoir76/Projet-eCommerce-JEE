package fr.afpa.ecom.modele;

import java.util.ArrayList;

import fr.afpa.ecom.modele.secondaire.GenreProduit;
import fr.afpa.ecom.modele.secondaire.TypeInfoAnnexe;
import fr.afpa.ecom.modele.secondaire.TypeProduit;

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
	private TypeProduit _typeProduit;
	private ArrayList<GenreProduit> _listGenreProduit;
	private ArrayList<TypeInfoAnnexe> _listInfoAnnexe;
	
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
	/**
	 * @return l'objet typeProduit liée au produit
	 */
	public TypeProduit get_typeProduit() {
		return _typeProduit;
	}
	/**
	 * @param _typeProduit
	 */
	public void set_typeProduit(TypeProduit _typeProduit) {
		this._typeProduit = _typeProduit;
	}
	/**
	 * @return la liste d'objet GenreProduit liée au produit
	 */
	public ArrayList<GenreProduit> get_ListGenreProduit() {
		return _listGenreProduit;
	}
	/**
	 * @param _ListGenreProduit
	 */
	public void set_ListGenreProduit(ArrayList<GenreProduit> _listGenreProduit) {
		this._listGenreProduit = _listGenreProduit;
	}
	/**
	 * @return la liste des infos annexes liée au produit
	 */
	public ArrayList<TypeInfoAnnexe> get_listInfoAnnexe() {
		return _listInfoAnnexe;
	}
	/**
	 * @param _listInfoAnnexe
	 */
	public void set_listInfoAnnexe(ArrayList<TypeInfoAnnexe> _listInfoAnnexe) {
		this._listInfoAnnexe = _listInfoAnnexe;
	}
	

	//CONSTRUCTEUR
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
					int stock_objectif,float tva_produit)
	{
		_id=id_produit; 
		_nomProduit=nom_produit;
		_prixHT=prixht_produit; 
		_stockInventaire=stock_inventaire_produit; 
		_stockMin=stock_minimum;
		_stockObjectif=stock_objectif;
		_tva=tva_produit; 
		//_typeProduit=type_produit;
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
			int stock_objectif,float tva_produit)
	{
		_id=-1; 
		_nomProduit=nom_produit;
		_prixHT=prixht_produit; 
		_stockInventaire=stock_inventaire_produit; 
		_stockMin=stock_minimum;
		_stockObjectif=stock_objectif;
		_tva=tva_produit; 
		//_typeProduit=type_produit;
	}
	
	@Override
	public String toString()
	{
		return ("produit n°" + _id + " - " + _nomProduit);
	}
}
