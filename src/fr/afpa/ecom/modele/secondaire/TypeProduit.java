package fr.afpa.ecom.modele.secondaire;

public class TypeProduit {
	private int _id;
	private String _libelle;
	private float _tvaGlobale;
	
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String get_libelle() {
		return _libelle;
	}
	public void set_libelle(String _libelle) {
		this._libelle = _libelle;
	}
	public float get_tvaGlobale() {
		return _tvaGlobale;
	}
	public void set_tvaGlobale(float _tvaGlobale) {
		this._tvaGlobale = _tvaGlobale;
	}
	
	public TypeProduit(int id, String libelle, float tvaGlobale)
	{
		_id=id;
		_libelle = libelle;
		_tvaGlobale=tvaGlobale;
	}
	
	public TypeProduit(String libelle, float tvaGlobale)
	{
		_id=-1;
		_libelle = libelle;
		_tvaGlobale=tvaGlobale;
	}
	
	
}
