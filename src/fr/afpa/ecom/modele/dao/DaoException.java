package fr.afpa.ecom.modele.dao;

/**
 * @author chatnoir
 * <t1>Classe gérant les problèmes liées à la base de données</t1>
 * <p>Cette classe va notamment gérer tous les messages d'erreurs personnalisés de la BDD dont
 * dont le code est égal ou supérieur à 60000 </p>
 */
public class DaoException extends Exception {

	private static final long serialVersionUID = -3570259698172167731L;
	private int _errCode;
	
	/**
	 * @return le numéro de l'erreur
	 */
	public int get_errCode() {
		return _errCode;
	}

	/**
	 * @param errorCode le numéro d'erreur renvoyé par la BDD
	 * @param message le message d'erreur renvoyé par la BDD
	 */
	public DaoException(int errorCode, String message) {
		super(message);
		_errCode = errorCode;
	}
	
	public DaoException(String message) {
		super(message);
		_errCode = 62000;
	}

}
