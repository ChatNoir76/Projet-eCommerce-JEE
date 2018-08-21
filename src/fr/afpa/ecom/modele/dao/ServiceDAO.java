package fr.afpa.ecom.modele.dao;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

/**
 * @author chatnoir
 *         <p>
 *         Classe de service avec méthodes partagées (static)
 *         </p>
 */
public class ServiceDAO {

    final public static String Statut     = "statut_";
    final public static String Historique = "histo_";

    /**
     * remplace un object string 'null' par un autre string défini
     * 
     * @param obj
     *            String à vérifier
     * @param remplacement
     *            String de remplacement
     * @return si obj=null renvoie remplacement
     */
    public static String RemplaceStringNull( String obj, String remplacement ) {
        // utile pour DAOClient avec rs.getString(5).CharAt(0)
        return obj == null ? remplacement : obj;
    }

    public static LocalDateTime now() {
        return LocalDateTime.now();
    }

    public static LocalDateTime getDateTime( Date d, Time t ) {
        return ( d == null ? null : LocalDateTime.of( d.toLocalDate(), t.toLocalTime() ) );
    }

    public static Date setDateTime( LocalDateTime d ) {
        return ( d == null ? null : Date.valueOf( d.toLocalDate() ) );
    }

}
