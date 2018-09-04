package fr.afpa.ecom.modele;

import java.time.LocalDateTime;

import fr.afpa.ecom.modele.dao.ServiceDAO;

public class Commande {
	
	private int _id;
	private double _remiseGlobale;
	private LocalDateTime _creationCommande;
	private int _idClient;
	
	public int get_id() {
		return _id;
	}


	public void set_id(int _id) {
		this._id = _id;
	}


	public double get_remiseGlobale() {
		return _remiseGlobale;
	}


	public void set_remiseGlobale(double _remiseGlobale) {
		this._remiseGlobale = _remiseGlobale;
	}


	public int get_idClient() {
		return _idClient;
	}


	public void set_idClient(int _idClient) {
		this._idClient = _idClient;
	}

	public LocalDateTime get_creationCommande() {
		return _creationCommande;
	}


	public void set_creationCommande(LocalDateTime _creationCommande) {
		this._creationCommande = _creationCommande;
	}

//	public Commande()
//	{
//	    _id=-1;
//        _remiseGlobale = 0.0000d;
//        _creationCommande = ServiceDAO.now();
//        _idClient = -1;
//	}
	
	public Commande(int id_client)
	{
		_id=-1;
		_remiseGlobale = 0.0000d;
		_creationCommande = ServiceDAO.now();
		_idClient = id_client;
	}
	
	public Commande(double remise_globale, int id_client)
	{
		_id=-1;
		_remiseGlobale = remise_globale;
		_creationCommande = ServiceDAO.now();
		_idClient = id_client;
	}
	
	public Commande(int id,double remise_globale,LocalDateTime creationCommande, int id_client)
	{
		_id=id;
		_remiseGlobale = remise_globale;
		_creationCommande = creationCommande;
		_idClient = id_client;
	}
	
	@Override
	public String toString()
	{
		return "Commande n°" + _id + " liée au client n°" + _idClient + " depuis le " + _creationCommande.toString();
	}
	
}
