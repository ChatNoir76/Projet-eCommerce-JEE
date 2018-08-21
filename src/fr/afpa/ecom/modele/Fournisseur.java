package fr.afpa.ecom.modele;

/**
 * @author chatnoir
 * <p>Classe métier</p>
 */
public class Fournisseur {

	private int _id;
	private String _nom;
	private String _mail;
	private String _adresse;
	private String _codePostal;
	private String _ville;
	private String _pays;
	
	/**
	 * @return l'id du fournisseur
	 * <p>si id=-1, fournisseur créé mais non enregistré dans la bdd</p>
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
	 * @return le nom du fournisseur
	 */
	public String get_nom() {
		return _nom;
	}
	/**
	 * @param _nom
	 */
	public void set_nom(String _nom) {
		this._nom = _nom;
	}
	/**
	 * @return l'adresse mail du fournisseur
	 */
	public String get_mail() {
		return _mail;
	}
	/**
	 * @param _mail
	 */
	public void set_mail(String _mail) {
		this._mail = _mail;
	}
	/**
	 * @return l'adresse postale du fournisseur
	 * <p>ce champs contient le numéro et le nom de la rue</p>
	 */
	public String get_adresse() {
		return _adresse;
	}
	/**
	 * @param _adresse
	 */
	public void set_adresse(String _adresse) {
		this._adresse = _adresse;
	}
	/**
	 * @return le code postal du fournisseur
	 */
	public String get_codePostal() {
		return _codePostal;
	}
	/**
	 * @param _codePostal
	 */
	public void set_codePostal(String _codePostal) {
		this._codePostal = _codePostal;
	}
	/**
	 * @return la ville du fournisseur
	 */
	public String get_ville() {
		return _ville;
	}
	/**
	 * @param _ville
	 */
	public void set_ville(String _ville) {
		this._ville = _ville;
	}
	/**
	 * @return le pays du fournisseur
	 */
	public String get_pays() {
		return _pays;
	}
	/**
	 * @param _pays
	 */
	public void set_pays(String _pays) {
		this._pays = _pays;
	}

	
	//CONSTRUCTEUR
	/**
	 * @param id_fournisseur
	 * @param nom_fournisseur
	 * @param mail_fournisseur
	 * @param adresse_fournisseur
	 * @param code_postal_fournisseur
	 * @param ville_fournisseur
	 * @param pays_fournisseur
	 */
	public Fournisseur(	int id_fournisseur, String nom_fournisseur, String mail_fournisseur, 
						String adresse_fournisseur, String code_postal_fournisseur, 
						String ville_fournisseur, String pays_fournisseur)
	{
		_id=id_fournisseur;
		_nom=nom_fournisseur;
		_mail=mail_fournisseur;
		_adresse=adresse_fournisseur;
		_codePostal=code_postal_fournisseur;
		_ville=ville_fournisseur;
		_pays=pays_fournisseur;
	}

	/**
	 * @param nom_fournisseur
	 * @param mail_fournisseur
	 * @param adresse_fournisseur
	 * @param code_postal_fournisseur
	 * @param ville_fournisseur
	 * @param pays_fournisseur
	 */
	public Fournisseur(String nom_fournisseur, String mail_fournisseur, 
			String adresse_fournisseur, String code_postal_fournisseur, 
			String ville_fournisseur, String pays_fournisseur)
	{
		_id=-1;
		_nom=nom_fournisseur;
		_mail=mail_fournisseur;
		_adresse=adresse_fournisseur;
		_codePostal=code_postal_fournisseur;
		_ville=ville_fournisseur;
		_pays=pays_fournisseur;
	}

	@Override
	public String toString()
	{
		return "Fournisseur n°" + _id + " - " + _nom + "(" + _mail + ")";
	}

}
