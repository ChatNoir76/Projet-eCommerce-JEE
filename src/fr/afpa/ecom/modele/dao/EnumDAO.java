package fr.afpa.ecom.modele.dao;

/**
 * @author chatnoir
 * <p>Permet de choisir le language de génération des objets DAO</p>
 */
public enum EnumDAO {
	MySQL(1),
	MSSQL(2); //-->pour exemple

	private int _typeDAO;
	/**
	 * @return le type de language utilisé
	 */
	public int getTypeDAO(){return _typeDAO;}
	
	private EnumDAO(int type)
	{
		_typeDAO = type;
	}
}
