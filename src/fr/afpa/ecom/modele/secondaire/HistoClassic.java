package fr.afpa.ecom.modele.secondaire;

import java.sql.Date;

public class HistoClassic extends Historique {

	private static final long serialVersionUID = -8257493441665886218L;

	public HistoClassic(Date chg, int idStatut, int idObj) {
		super(chg, idStatut, idObj);
	}

}
