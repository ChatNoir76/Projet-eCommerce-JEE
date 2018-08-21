package fr.afpa.ecom.modele.secondaire;

import java.io.Serializable;
import java.sql.Date;

public abstract class Historique implements Serializable{

	private static final long serialVersionUID = 755909488044844752L;
	//Commun
	private int _idObj;
	private int _idStatut;
	private Date _dateChg;
	//Spécifique histo prix fournisseur
	protected double _prixAchat;
	//Spécifique produit
	protected float _remise;
	protected Date _dateSortie;
	
	public int get_idObj() {
		return _idObj;
	}
	public void set_idObj(int _idObj) {
		this._idObj = _idObj;
	}
	public int get_idStatut() {
		return _idStatut;
	}
	public void set_idStatut(int _idStatut) {
		this._idStatut = _idStatut;
	}
	public Date get_datechg() {
		return _dateChg;
	}
	public void set_datechg(Date _datechg) {
		this._dateChg = _datechg;
	}

	public Historique(Date chg, int idStatut, int idObj)
	{
		_idObj=idObj;
		_idStatut=idStatut;
		_dateChg=chg;
	}
	
	@Override
	public String toString()
	{
		return "Historique " + " : Type n°" + _idObj + " --> Statut n°" + _idStatut + " du " + _dateChg.toString();
	}
	
	
}
