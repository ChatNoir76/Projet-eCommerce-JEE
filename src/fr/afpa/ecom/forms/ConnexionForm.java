package fr.afpa.ecom.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import fr.afpa.ecom.controleur.service.ServSession;
import fr.afpa.ecom.modele.Client;

public class ConnexionForm {

    private static final String CHAMP_EMAIL = "email";
    private static final String CHAMP_PASS  = "motdepasse";
    private String              resultat;
    private Map<String, String> erreurs     = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }
    
    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Client connecterUtilisateur( HttpServletRequest request ) {

        /* Récupération des champs du formulaire */
        String email = ServSession.getValeurChamp(  CHAMP_EMAIL );
        String motDePasse = ServSession.getValeurChamp(  CHAMP_PASS );
        Client c = new Client();

        /* Validation du champ email. */
        try {
            validationEmail( email );
        } catch ( Exception e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }

        c.set_mail( email );

        /* Validation du champ mot de passe. */
        try {
            validationMotDePasse( motDePasse );
        } catch ( Exception e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
        }

        c.set_motDePasse( motDePasse );

        /* Initialisation du résultat global de la validation. */
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de la connexion.";
        } else {
            resultat = "Échec de la connexion.";
        }

        return c;

    }

    /**
     * 
     * Valide l'adresse email saisie.
     * 
     */
    private void validationEmail( String email ) throws Exception {
        if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Merci de saisir une adresse mail valide." );
        }
    }

    /**
     * 
     * Valide le mot de passe saisi.
     * 
     */
    private void validationMotDePasse( String motDePasse ) throws Exception {
        if ( motDePasse != null ) {
            if ( motDePasse.length() < 3 ) {
                throw new Exception( "Le mot de passe doit contenir au moins 3 caractères." );
            }
        } else {
            throw new Exception( "Merci de saisir votre mot de passe." );
        }
    }

    /*
     * 
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     * 
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }


}
