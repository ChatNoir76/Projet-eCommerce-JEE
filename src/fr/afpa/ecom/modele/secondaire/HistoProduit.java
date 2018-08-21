package fr.afpa.ecom.modele.secondaire;

import java.sql.Date;

public class HistoProduit extends Historique {

	private static final long serialVersionUID = 4504805230485837595L;

	public HistoProduit(Date chg, int idStatut, int idObj, float remise, Date dateSortie) {
		super(chg, idStatut, idObj);
		this._remise = remise;
		this._dateSortie = dateSortie;
	}
	
	public float get_remise() {
		return _remise;
	}
	public void set_remise(float remise) {
		this._remise = remise;
	}
	public Date get_dateSortie() {
		return _dateSortie;
	}
	public void set_dateSortie(Date dateSortie) {
		this._dateSortie = dateSortie;
	}

}
