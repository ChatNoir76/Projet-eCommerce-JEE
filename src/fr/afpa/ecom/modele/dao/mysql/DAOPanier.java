package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.secondaire.CommandeProduit;

public class DAOPanier {

    // REMARQUE
    // lors de la validation d'un panier fermé (expédié) nécessité de créer un
    // panier vierge pour le getIdCommande

    private final static String        StatutClient              = "client";
    private final static String        _PSdernierStatus          = "CALL ps_dernier_statut(?,?,?,?,?)";
    private final static String        _PSgetIdCommande          = "CALL ps_panier_getcommandefromclient(?,?,?,?)";
    private final static String        _PSgetListCommandeProduit = "CALL ps_panier_getlistcommandeproduit(?,?,?)";
    private final static String        _PSAjoutPanier            = "CALL ps_panier_ajoutproduit(?,?,?,?,?)";

    private Connection                 _con                      = null;
    private int                        _idClient                 = -1;
    private int                        _idCommande               = -1;
    private int                        _idStatutClient           = -1;
    private ArrayList<CommandeProduit> _lcp                      = new ArrayList<CommandeProduit>();

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
        return new Panier( _idCommande, _idClient, _lcp );
    }

    public void ajoutPanier( int idProduit, int quantity ) throws DaoException {
        int errcode;
        String errmsg;
        try {
            CallableStatement cs = _con.prepareCall( _PSAjoutPanier );
            // IN
            cs.setInt( 1, _idCommande );
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

        try {
            CallableStatement cs = _con.prepareCall( _PSgetIdCommande );
            // IN
            cs.setInt( 1, _idClient );

            // OUT
            cs.registerOutParameter( 2, java.sql.Types.INTEGER );
            cs.registerOutParameter( 3, java.sql.Types.VARCHAR );
            cs.registerOutParameter( 4, java.sql.Types.INTEGER );
            cs.execute();

            // Récupération des OUT
            errcode = cs.getInt( 2 );
            errmsg = cs.getString( 3 );
            _idCommande = cs.getInt( 4 );

            // Traitement des informations (id+erreurs)
            if ( errcode != 0 ) {
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
            cs.setInt( 1, _idCommande );

            // OUT
            cs.registerOutParameter( 2, java.sql.Types.INTEGER );
            cs.registerOutParameter( 3, java.sql.Types.VARCHAR );
            cs.execute();
            rs = cs.getResultSet();

            // Récupération des OUT
            errcode = cs.getInt( 2 );
            errmsg = cs.getString( 3 );

            while ( rs.next() ) {
                _lcp.add( new CommandeProduit( rs.getInt( 7 ), rs.getInt( 1 ), rs.getDouble( 2 ),
                        rs.getFloat( 3 ), rs.getFloat( 4 ), rs.getDouble( 5 ) ) );
            }
            rs.close();
            if ( errcode != 0 ) {
                throw new DaoException( errcode, errmsg );
            }
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
    }

}
