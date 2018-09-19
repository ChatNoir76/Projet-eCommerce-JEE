package fr.afpa.ecom.forms;

import java.time.LocalDateTime;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.controleur.service.ServClient;
import fr.afpa.ecom.controleur.service.ServPanier;
import fr.afpa.ecom.controleur.service.ServSession;
import fr.afpa.ecom.controleur.service.ServiceException;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.dao.DaoException;

public class ClientForm {

    public Client connexionClient() throws FormsException, ServiceException, DaoException {

        String email = ServSession.getValeurChamp( Controleur.CHAMP1_EMAIL );
        String motDePasse = ServSession.getValeurChamp( Controleur.CHAMP1_PASS );

        /* Validation du champ email. */
        try {
            validationEmail( email );
        } catch ( Exception e ) {
            throw new FormsException( e.getMessage() );
        }

        /* Validation du champ mot de passe. */
        try {
            validationMotDePasse( motDePasse );
        } catch ( Exception e ) {
            throw new FormsException( e.getMessage() );
        }

        return ServClient.connexionClient( email, motDePasse );

    }

    public Client inscriptionClient() throws FormsException, ServiceException {
        // FORMULAIRE DE D'INSCRIPTION
        String nom;
        String prenom;
        char sexe;
        String mail;
        String mdp;
        String tel;
        LocalDateTime naissance = null;
        String addresse;
        String ville;
        String cp;
        String pays;
        String commentaire;
        
        try {
            nom = ServSession.getValeurChamp( Controleur.CHAMP2_NOM );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_NOM );
        }
        try {
            prenom = ServSession.getValeurChamp( Controleur.CHAMP2_PRENOM );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_PRENOM );
        }
        try {
            sexe  = validationSexe( ServSession.getValeurChamp( Controleur.CHAMP2_SEXE ));
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_SEXE );
        }
        try {
            mail = ServSession.getValeurChamp( Controleur.CHAMP2_MAIL );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_MAIL );
        }
        try {
            mdp = ServSession.getValeurChamp( Controleur.CHAMP2_PWD );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_PWD );
        }
        try {
            tel = ServSession.getValeurChamp( Controleur.CHAMP2_TEL );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_TEL );
        }
        try {
            naissance = ServSession.getChampDate( Controleur.CHAMP2_NAISSANCE );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_NAISSANCE);
        }
        try {
            addresse = ServSession.getValeurChamp( Controleur.CHAMP2_ADDRESSE );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_ADDRESSE );
        }
        try {
            ville = ServSession.getValeurChamp( Controleur.CHAMP2_VILLE );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_VILLE );
        }
        try {
            cp = ServSession.getValeurChamp( Controleur.CHAMP2_CODEPOSTAL );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_CODEPOSTAL );
        }
        try {
            pays = ServSession.getValeurChamp( Controleur.CHAMP2_PAYS );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_PAYS );
        }
        try {
            commentaire = ServSession.getValeurChamp( Controleur.CHAMP2_COMMENTAIRE );
        } catch (Exception e) {
            throw new FormsException("problème lors de l'initialisation de la variable POST : " + Controleur.CHAMP2_COMMENTAIRE );
        }

        /* Validation du champ email. */
        try {
            validationEmail( mail );
        } catch ( Exception e ) {
            throw new FormsException( e.getMessage() );
        }

        /* Validation du champ mot de passe. */
        try {
            validationMotDePasse( mdp );
        } catch ( Exception e ) {
            throw new FormsException( e.getMessage() );
        }


        Client c = new Client( nom, prenom, sexe, mail, tel, naissance, addresse, cp, ville, pays,
                commentaire, mdp );
        
        try {
            Controleur.getDao().getClient().insert( c );
            ServPanier.initialisationPanier( c );
            return ServClient.connexionClient(c.get_mail(),c.get_motDePasse());
        } catch ( DaoException e ) {
            throw new FormsException("problème lors de la création du client : " + e.getMessage());
        }



        
    }

    private char validationSexe( String sexeStr ) {
        char sexe = 'O';
        if ( sexe == 'M' || sexe == 'F' ) {
            return sexe;
        } else {
            return 'I';
        }
    }

    private void validationEmail( String email ) throws Exception {
        if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Merci de saisir une adresse mail valide." );
        }
    }

    private void validationMotDePasse( String motDePasse ) throws Exception {
        if ( motDePasse != null ) {
            if ( motDePasse.length() < 1 ) {
                throw new Exception( "Le mot de passe doit contenir au moins 1 caractères." );
            }
        } else {
            throw new Exception( "Merci de saisir votre mot de passe." );
        }
    }

}
