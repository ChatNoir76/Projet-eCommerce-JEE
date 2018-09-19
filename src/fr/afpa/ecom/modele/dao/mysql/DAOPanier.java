package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.ServiceDAO;
import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class DAOPanier {

    // REMARQUE
    // lors de la validation d'un panier fermé (expédié) nécessité de créer un
    // panier vierge pour le getIdCommande

    private final static String        StatutClient              = "client";
    private final static String        _PSdernierStatus          = "CALL ps_dernier_statut(?,?,?,?,?)";
    private final static String        _PSUpdatePanier           = "CALL ps_panier_update(?,?,?,?,?,?)";
    private final static String        _PSgetIdCommande          = "CALL ps_panier_getcommandefromclient(?,?,?)";
    private final static String        _PSgetListCommandeProduit = "CALL ps_panier_getlistcommandeproduit(?,?,?)";
    private final static String        _PSAjoutPanier            = "CALL ps_panier_ajoutproduit(?,?,?,?,?)";
    private final static String        _PSvalidationPanier       = "CALL ps_panier_validation(?,?,?)";
    private final static String        _PSGetAllPanier           = "CALL ps_panier_getall(?,?,?)";

    private Connection                 _con                      = null;
    private int                        _idClient                 = -1;
    private Commande                   _commande                 = null;
    private int                        _idStatutClient           = -1;
    private ArrayList<CommandeProduit> _lcp                      = new ArrayList<CommandeProduit>();
    private ArrayList<CommandeProduit> cplist                    = new ArrayList<CommandeProduit>();

    // CONSTRUCTEUR
    public DAOPanier( Connection con, int idClient ) throws DaoException {
        _con = con;
        _idClient = idClient;
        // récupère le statut du client et vérifie par la meme occasion
        // l'existence du client
        getStatusClient();
        // récupération de la derniere commande
        getIdCommande();
        getCommandeProduit();
    }

    // METHODES PUBLIQUES
    public Panier getPanier() {
        return new Panier( _commande, _idClient, _lcp );
    }

    public void ajoutPanier( int idProduit, int quantity ) throws DaoException {
        int errcode;
        String errmsg;
        if ( _commande.get_id() == -1 ) {
            throw new DaoException( 99999, "le numéro de commande est corrompue" );
        }
        try {
            CallableStatement cs = _con.prepareCall( _PSAjoutPanier );
            // IN
            cs.setInt( 1, _commande.get_id() );
            cs.setInt( 2, idProduit );
            cs.setInt( 3, quantity );

            // OUT
            cs.registerOutParameter( 4, java.sql.Types.INTEGER );
            cs.registerOutParameter( 5, java.sql.Types.VARCHAR );
            cs.execute();

            // Récupération des OUT
            errcode = cs.getInt( 4 );
            errmsg = cs.getString( 5 );

            if ( errcode != 0 ) {
                throw new DaoException( errcode, errmsg );
            }
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
    }

    public void updatePanier( Panier p ) throws DaoException {

        int errcode;
        String errmsg;

        for ( CommandeProduit cp : p.getArticles() ) {

            try {
                CallableStatement cs = _con.prepareCall( _PSUpdatePanier );
                // IN
                cs.setInt( 1, p.get_idCommande() );
                cs.setInt( 2, cp.get_produit().get_id() );
                cs.setInt( 3, cp.get_quantite() );
                cs.setDouble( 4, cp.get_remise() );

                // OUT
                cs.registerOutParameter( 5, java.sql.Types.INTEGER );
                cs.registerOutParameter( 6, java.sql.Types.VARCHAR );
                cs.execute();

                // Récupération des OUT
                errcode = cs.getInt( 5 );
                errmsg = cs.getString( 6 );

                if ( errcode != 0 ) {
                    throw new DaoException( errcode, errmsg );
                }
            } catch ( SQLException e ) {
                throw new DaoException( e.getErrorCode(), e.getMessage() );
            }
        }
    }

    public ArrayList<Panier> getAll() throws DaoException
    {
        ArrayList<Panier> listPanier = new ArrayList<Panier>();
        Panier p = null;
        int idRSCommande = -1;
        ResultSet rs = null;
        int errcode;
        String errmsg;
        if ( _idClient < 1 ) {
            throw new DaoException( 99999, "le numéro de client est corrompue" );
        }
        try {
            CallableStatement cs = _con.prepareCall( _PSGetAllPanier );
            // IN
            cs.setInt( 1, _idClient );

            // OUT
            cs.registerOutParameter( 2, java.sql.Types.INTEGER );
            cs.registerOutParameter( 3, java.sql.Types.VARCHAR );
            cs.execute();
            rs = cs.getResultSet();

            // Récupération des OUT
            errcode = cs.getInt( 2 );
            errmsg = cs.getString( 3 );

            if ( errcode != 0 ) {
                throw new DaoException( errcode, errmsg );
            }
            
            if ( rs != null ) {
                while ( rs.next() ) {                    
                    if (rs.getInt( 1 ) == idRSCommande)
                    { // changement / création de panier
                        if (idRSCommande != -1)
                        { // mise en araylist du panier lors du changement
                            listPanier.add( p );
                        }
                        
                        idRSCommande = rs.getInt( 2 );
                        Commande cmd = new Commande(rs.getInt( 2 ),rs.getDouble( 3 ),ServiceDAO.getDateTime( rs.getDate( 4 ), rs.getTime( 4 )),rs.getInt( 1 ));
                        p = new Panier(cmd,_idClient);
                    }
                        p.addArticle( setArticleToPanier(rs) );
                }
            }
            
            
            
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
        
        
        
        return listPanier;
    }
    
    /**
     * 
     * @param idCommande
     * @return des lignes CommandeProduit problématique avec la quantitée revu
     *         et corrigée
     * @throws DaoException
     * @throws SQLException
     */
    public Map<Integer, Integer> validationPanier( int idCommande ) throws DaoException, SQLException {
        int errcode;
        String errmsg;
        ResultSet rs = null;

        Map<Integer, Integer> ListProd = new HashMap<Integer, Integer>();

        CallableStatement cs = _con.prepareCall( _PSvalidationPanier );
        // IN
        cs.setInt( 1, idCommande );

        // OUT
        cs.registerOutParameter( 2, java.sql.Types.INTEGER );
        cs.registerOutParameter( 3, java.sql.Types.VARCHAR );
        cs.execute();
        rs = cs.getResultSet();

        // Récupération des OUT
        errcode = cs.getInt( 2 );
        errmsg = cs.getString( 3 );

        if ( rs != null ) {
            while ( rs.next() ) {
                ListProd.put( rs.getInt( 1 ), rs.getInt( 2 ) );
            }
        }

        rs.close();

        // Traitement des informations (id+erreurs)
        if ( errcode != 0 ) {
            throw new DaoException( errcode, errmsg );
        }

        return ListProd;

    }

    // METHODES PRIVEES
    private void getStatusClient() throws DaoException {
        int errcode;
        String errmsg;

        try {
            CallableStatement cs = _con.prepareCall( _PSdernierStatus );
            // IN
            cs.setString( 1, StatutClient );
            cs.setInt( 2, _idClient );

            // OUT
            cs.registerOutParameter( 3, java.sql.Types.INTEGER );
            cs.registerOutParameter( 4, java.sql.Types.VARCHAR );
            cs.registerOutParameter( 5, java.sql.Types.INTEGER );
            cs.execute();

            // Récupération des OUT
            errcode = cs.getInt( 3 );
            errmsg = cs.getString( 4 );
            _idStatutClient = cs.getInt( 5 );

            // Traitement des informations (id+erreurs)
            if ( errcode != 0 ) {
                throw new DaoException( errcode, errmsg );
            }
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
    }

    private void getIdCommande() throws DaoException {
        int errcode;
        String errmsg;
        ResultSet rs = null;

        try {
            CallableStatement cs = _con.prepareCall( _PSgetIdCommande );
            // IN
            cs.setInt( 1, _idClient );

            // OUT
            cs.registerOutParameter( 2, java.sql.Types.INTEGER );
            cs.registerOutParameter( 3, java.sql.Types.VARCHAR );
            cs.execute();
            rs = cs.getResultSet();

            // Récupération des OUT
            errcode = cs.getInt( 2 );
            errmsg = cs.getString( 3 );

            while ( rs.next() ) {
                _commande = new Commande( rs.getInt( 1 ), rs.getDouble( 2 ),
                        ServiceDAO.getDateTime( rs.getDate( 3 ), rs.getTime( 3 ) ), rs.getInt( 4 ) );
            }
            rs.close();

            // Traitement des informations (id+erreurs)
            if ( errcode != 0 || _commande.get_id() == -1 ) {
                throw new DaoException( errcode, errmsg );
            }
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
    }

    private void getCommandeProduit() throws DaoException {
        ResultSet rs = null;
        int errcode;
        String errmsg;
        try {
            CallableStatement cs = _con.prepareCall( _PSgetListCommandeProduit );
            // IN
            cs.setInt( 1, _commande.get_id() );

            // OUT
            cs.registerOutParameter( 2, java.sql.Types.INTEGER );
            cs.registerOutParameter( 3, java.sql.Types.VARCHAR );
            cs.execute();
            rs = cs.getResultSet();

            // Récupération des OUT
            errcode = cs.getInt( 2 );
            errmsg = cs.getString( 3 );

            // quantite_produit, prix_HT_unitaire_debut, remise_appliquee,
            // tva_appliquee, prix_TTC_unitaire_final,
            // id_produit, nom_produit, prixht_produit,
            // stock_inventaire_produit, stock_minimum, stock_objectif,
            // tva_produit, id_type_produit

            while ( rs.next() ) {
                Produit p = new Produit( rs.getInt( 6 ), rs.getString( 7 ), rs.getDouble( 8 ), rs.getInt( 9 ),
                        rs.getInt( 10 ), rs.getInt( 11 ), rs.getFloat( 12 ), rs.getInt( 13 ) );
                _lcp.add( new CommandeProduit( rs.getInt( 1 ), rs.getDouble( 2 ), rs.getFloat( 3 ), rs.getFloat( 4 ),
                        rs.getDouble( 5 ), p ) );
            }
            rs.close();
            if ( errcode != 0 ) {
                throw new DaoException( errcode, errmsg );
            }
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
    }
    

    private CommandeProduit setArticleToPanier(ResultSet rs) throws SQLException
    {
        Produit p = new Produit(rs.getInt( 12 ), rs.getString( 13 ), rs.getDouble( 14 ), rs.getInt( 15 ),
                rs.getInt( 16 ), rs.getInt( 17 ), rs.getFloat( 18 ), rs.getInt( 19 ));
        CommandeProduit cp = new CommandeProduit(rs.getInt( 7 ), rs.getDouble( 8 ), rs.getFloat( 9 ), rs.getFloat( 10 ),
                rs.getDouble( 11 ), p );
        return cp;
    }
}
