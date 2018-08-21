package fr.afpa.ecom.modele.dao;

/**
 * @author chatnoir
 * <p>Enumération des objets métiers POJO du site eCommerce</p>
 * <p>Un objet de type énumération renvoi le nom de la table ainsi qu'un numéro id utilisé en interne</p>
 * <ul>
 * 	<li>Fournisseur id=1</li>
 * 	<li>Commande id=2</li>
 * 	<li>Produit id=3</li>
 * 	<li>Client id=4</li>
 * </ul>
 */
public enum EnumObject {
	Fournisseur("fournisseur",1),
	Commande("commande",2),
	Produit("produit",3),
	Client("client",4);
	
	private String _table;
	private int _type;
	
	private EnumObject(String table, int type)
	{
		_table = table;
		_type = type;
	}
	
	/**
	 * @return le nom de la table SQL associée à l'objet
	 */
	public String getNomTable()
	{
		return _table;
	}
	
	/**
	 * @return retourne l'id de la table associée à l'objet
	 */
	public int getType()
	{
		return _type;
	}
}
