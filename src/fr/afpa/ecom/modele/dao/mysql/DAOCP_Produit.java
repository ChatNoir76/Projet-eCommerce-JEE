package fr.afpa.ecom.modele.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumObject;
import fr.afpa.ecom.service.Service;

class DAOCP_Produit extends DAOCP<Produit> {

    private final String _PSinsert = "CALL ps_produit_insertion(?,?,?,?,?,?,?,?,?,?,?)";
    private final String _PSupdate = "CALL ps_produit_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String _PSdelete = "CALL ps_produit_delete(?,?,?)";

    // CONSTRUCTEUR
    public DAOCP_Produit( Connection con ) {
        super( con, EnumObject.Produit );
    }

    // METHODES
    @Override
    public ArrayList<Produit> getAll() throws DaoException {
        ArrayList<Produit> al = new ArrayList<Produit>();
        ResultSet rs = null;
        try {
            rs = con().createStatement().executeQuery( "SELECT * FROM " + getClasse() );

            while ( rs.next() ) {
                al.add( new Produit( rs.getInt( 1 ), rs.getString( 2 ), rs.getDouble( 3 ), rs.getInt( 4 ),
                        rs.getInt( 5 ), rs.getInt( 6 ), rs.getFloat( 7 ) ) );
            }

            rs.close();
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
        return al;
    }

    @Override
    public void insert( Produit obj ) throws DaoException {
        int errcode;
        String errmsg;
        int id;

        try {
            CallableStatement cs = con().prepareCall( _PSinsert );
            // IN
            cs.setString( 1, obj.get_nomProduit() );
            cs.setDouble( 2, obj.get_prixHT() );
            cs.setInt( 3, obj.get_stockInventaire() );
            cs.setInt( 4, obj.get_stockMin() );
            cs.setInt( 5, obj.get_stockObjectif() );
            cs.setFloat( 6, obj.get_tva() );
            cs.setInt( 7, obj.get_typeProduit().get_id() );
            cs.setDate( 8, null );

            // OUT
            cs.registerOutParameter( 9, java.sql.Types.INTEGER );
            cs.registerOutParameter( 10, java.sql.Types.VARCHAR );
            cs.registerOutParameter( 11, java.sql.Types.INTEGER );
            cs.execute();

            // Récupération des OUT
            errcode = cs.getInt( 9 );
            errmsg = cs.getString( 10 );
            id = cs.getInt( 11 );

            // Traitement des informations (id+erreurs)
            switch ( errcode ) {
            case 0: // pas d'erreur : récupération de l'id
                obj.set_id( id );
                Service.mdInformation( "Création du produit n°" + id + " effectué" );
                break;
            default:
                throw new DaoException( errcode, errmsg );
            }
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }

    }

    @Override
    public void update( Produit obj ) throws DaoException {
        // TODO Auto-generated method stub

    }

    @Override
    public void delete( Produit obj ) throws DaoException {
        // TODO Auto-generated method stub

    }

    @Override
    public Produit getById( int id ) throws DaoException {
        Produit p = null;
        ResultSet rs = null;
        try {
            rs = con().createStatement().executeQuery( "SELECT * FROM " + getClasse() + " where id_client=" + id );

            if ( rs.first() ) {
                p = new Produit( rs.getInt( 1 ), rs.getString( 2 ), rs.getDouble( 3 ), rs.getInt( 4 ),
                        rs.getInt( 5 ), rs.getInt( 6 ), rs.getFloat( 7 ) );
            }

            rs.close();
        } catch ( SQLException e ) {
            throw new DaoException( e.getErrorCode(), e.getMessage() );
        }
        return p;
    }

}
