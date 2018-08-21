package fr.afpa.ecom.modele.secondaire;

import fr.afpa.ecom.modele.dao.EnumObject;

/**
 * @author chatnoir
 * <p>Classe pouvant gérer toutes les tables statut de la BDD</p>
 * @see EnumObject
 */
public class Statut {

	private int _id;
	private String _libelle;
	private EnumObject _s;
	
	/**
	 * @return le numéro id du statut
	 */
	public int get_id() {
		return _id;
	}
	/**
	 * @return le libellé du statut
	 */
	public String get_libelle() {
		return _libelle;
	}
	/**
	 * @return le nom de la table du statut
	 */
	public String get_nameTableStatut()
	{
		return "statut_" + _s.getNomTable();
	}
	/**
	 * 
	 * @return le nom de la table historique liée à celle de la table statut
	 */
	public String get_nameTableHistorique()
	{
		return "histo_" + _s.getNomTable();
	}
	/**
	 * @return l'id du type liée au nom de la table
	 * @see EnumObject
	 */
	public int get_type()
	{
		return _s.getType();
	}

	/**
	 * @param idStatut
	 * @param libelle
	 * @param s
	 */
	public Statut(int idStatut, String libelle, EnumObject s)
	{
		_id = idStatut;
		_libelle=libelle;
		_s=s;
	}
	
	@Override
	public String toString()
	{
		return "Statut " + _s.getNomTable() + " n°" + _id + " => " + _libelle;
	}
	
	
}
