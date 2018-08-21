package fr.afpa.ecom.modele.secondaire;

public class TypeInfoAnnexe {
	
	private int _id;
	private String _libelle;
	
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
	
	public TypeInfoAnnexe(int id, String libelle)
	{
		_id=id;
		_libelle=libelle;
	}
	
	public TypeInfoAnnexe(String libelle)
	{
		_id=-1;
		_libelle=libelle;
	}
}
