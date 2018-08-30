package fr.afpa.ecom.modele;

import java.time.LocalDateTime;

public class Client {

    private int           _id;
    private LocalDateTime _dateInscription;
    private String        _nom;
    private String        _prenom;
    private char          _sexe;
    private String        _mail;
    private String        _tel;
    private LocalDateTime _dateNaissance;
    private String        _adresse;
    private String        _codePostal;
    private String        _ville;
    private String        _pays;
    private String        _commentaire;
    private String        _motDePasse;

    /**
     * @return l'id du client
     *         <p>
     *         si id=-1, client créé mais non enregistré dans la bdd
     *         </p>
     */
    public int get_id() {
        return _id;
    }

    /**
     * @param _id
     */
    public void set_id( int _id ) {
        this._id = _id;
    }

    /**
     * @return le nom du client
     */
    public String get_nom() {
        return _nom;
    }

    /**
     * @param _nom
     */
    public void set_nom( String _nom ) {
        this._nom = _nom;
    }

    /**
     * @return le prénom du client
     */
    public String get_prenom() {
        return _prenom;
    }

    /**
     * @param _prenom
     */
    public void set_prenom( String _prenom ) {
        this._prenom = _prenom;
    }

    /**
     * @return le sexe du client
     */
    public char get_sexe() {
        return _sexe;
    }

    public String get_sexeToString() {
        String sexe = new String();
        sexe += _sexe;
        return sexe;
    }

    /**
     * @param _sexe
     */
    public void set_sexe( char _sexe ) {
        this._sexe = _sexe;
    }

    /**
     * @return l'adresse mail du client
     */
    public String get_mail() {
        return _mail;
    }

    /**
     * @param _mail
     */
    public void set_mail( String _mail ) {
        this._mail = _mail;
    }

    /**
     * @return le numéro de téléphone du client
     */
    public String get_tel() {
        return _tel;
    }

    /**
     * @param _tel
     */
    public void set_tel( String _tel ) {
        this._tel = _tel;
    }

    /**
     * @return l'adresse rue + numero du client
     */
    public String get_adresse() {
        return _adresse;
    }

    /**
     * @param _adresse
     */
    public void set_adresse( String _adresse ) {
        this._adresse = _adresse;
    }

    /**
     * @return le code postal du client
     */
    public String get_codePostal() {
        return _codePostal;
    }

    /**
     * @param _codePostal
     */
    public void set_codePostal( String _codePostal ) {
        this._codePostal = _codePostal;
    }

    /**
     * @return la ville du client
     */
    public String get_ville() {
        return _ville;
    }

    /**
     * @param _ville
     */
    public void set_ville( String _ville ) {
        this._ville = _ville;
    }

    /**
     * @return le pays du client
     */
    public String get_pays() {
        return _pays;
    }

    /**
     * @param _pays
     */
    public void set_pays( String _pays ) {
        this._pays = _pays;
    }

    /**
     * @return le commentaire du client
     */
    public String get_commentaire() {
        return _commentaire;
    }

    /**
     * @param _commentaire
     */
    public void set_commentaire( String _commentaire ) {
        this._commentaire = _commentaire;
    }

    /**
     * @return le mot de passe du client
     */
    public String get_motDePasse() {
        return _motDePasse;
    }

    /**
     * @param _motDePasse
     */
    public void set_motDePasse( String _motDePasse ) {
        this._motDePasse = _motDePasse;
    }

    public LocalDateTime get_dateInscription() {
        return _dateInscription;
    }

    public void set_dateInscription( LocalDateTime _dateInscription ) {
        this._dateInscription = _dateInscription;
    }

    public LocalDateTime get_dateNaissance() {
        return _dateNaissance;
    }

    public void set_dateNaissance( LocalDateTime _dateNaissance ) {
        this._dateNaissance = _dateNaissance;
    }
    // CONSTRUCTEUR

    /**
     * @param id_client
     * @param date_inscription_client
     * @param nom_client
     * @param prenom_client
     * @param sexe_client
     * @param mail_client
     * @param tel_client
     * @param date_naissance_client
     * @param adresse_client
     * @param code_postal_client
     * @param ville_client
     * @param pays_client
     * @param commentaire_client
     * @param mdp_client
     */
    public Client( int id_client,
            LocalDateTime date_inscription_client,
            String nom_client,
            String prenom_client,
            char sexe_client,
            String mail_client,
            String tel_client,
            LocalDateTime date_naissance_client,
            String adresse_client,
            String code_postal_client,
            String ville_client,
            String pays_client,
            String commentaire_client,
            String mdp_client ) {
        _id = id_client;
        _dateInscription = date_inscription_client;
        _nom = nom_client;
        _prenom = prenom_client;
        _sexe = sexe_client;
        _mail = mail_client;
        _tel = tel_client;
        _dateNaissance = date_naissance_client;
        _adresse = adresse_client;
        _codePostal = code_postal_client;
        _ville = ville_client;
        _pays = pays_client;
        _commentaire = commentaire_client;
        _motDePasse = mdp_client;
    }

    /**
     * @param date_inscription_client
     * @param nom_client
     * @param prenom_client
     * @param sexe_client
     * @param mail_client
     * @param tel_client
     * @param date_naissance_client
     * @param adresse_client
     * @param code_postal_client
     * @param ville_client
     * @param pays_client
     * @param commentaire_client
     * @param mdp_client
     */
    public Client( LocalDateTime date_inscription_client,
            String nom_client,
            String prenom_client,
            char sexe_client,
            String mail_client,
            String tel_client,
            LocalDateTime date_naissance_client,
            String adresse_client,
            String code_postal_client,
            String ville_client,
            String pays_client,
            String commentaire_client,
            String mdp_client ) {
        _id = -1;
        _dateInscription = date_inscription_client;
        _nom = nom_client;
        _prenom = prenom_client;
        _sexe = sexe_client;
        _mail = mail_client;
        _tel = tel_client;
        _dateNaissance = date_naissance_client;
        _adresse = adresse_client;
        _codePostal = code_postal_client;
        _ville = ville_client;
        _pays = pays_client;
        _commentaire = commentaire_client;
        _motDePasse = mdp_client;
    }

    /**
     * création d'un client guest
     */
    public Client() {
        /*
         * _id=-1; _dateInscription=null; _nom=null; _prenom=null; _sexe=' ';
         * _mail=null; _tel=null; _dateNaissance=null; _adresse=null;
         * _codePostal=null; _ville=null; _pays=null; _commentaire=null;
         * _motDePasse=null;
         */
    }

    @Override
    public String toString() {
        return "client n°" + _id + " (" + _nom + " - " + _prenom + ")";

    }
}
