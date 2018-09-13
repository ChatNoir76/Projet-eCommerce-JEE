package fr.afpa.ecom.controleur;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.afpa.ecom.controleur.service.ServClient;
import fr.afpa.ecom.controleur.service.ServPanier;
import fr.afpa.ecom.controleur.service.ServSession;
import fr.afpa.ecom.controleur.service.ServiceException;
import fr.afpa.ecom.forms.ClientForm;
import fr.afpa.ecom.forms.FormsException;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;
import fr.afpa.ecom.modele.dao.ServiceDAO;
import fr.afpa.ecom.modele.secondaire.CommandeProduit;

/**
 * Servlet implementation class Index
 */
@WebServlet( urlPatterns = {
        "/index",
        "/connexion",
        "/listeClient",
        "/deconnexion",
        "/produit",
        "/ajoutPanier",
        "/panier",
        "/inscription",
        "/modifierqty",
        "/refreshpanier",
        "/codebonus" } )
public class Controleur extends HttpServlet {
    private static final long          serialVersionUID       = 1L;
    private static HttpServletRequest  _request;
    private static HttpServletResponse _response;
    private static HttpSession         _session;

    // VUE : redirection vers la vue (req,resp)
    private static final String        VUE_INDEX              = "/WEB-INF/vue/index.jsp";
    private static final String        VUE_CONNEXION          = "/WEB-INF/vue/connexion.jsp";
    private static final String        VUE_LISTECLIENT        = "/WEB-INF/vue/listeClient.jsp";
    private static final String        VUE_PRODUIT            = "/WEB-INF/vue/produit.jsp";
    private static final String        VUE_PANIER             = "/WEB-INF/vue/panier.jsp";
    private static final String        VUE_INSCRIPTION        = "/WEB-INF/vue/inscription.jsp";

    // HREF : Lien vers une autre page via getServletPath()
    private static final String        HREF_CONNEXION         = "/connexion";
    private static final String        HREF_DECONNEXION       = "/deconnexion";
    private static final String        HREF_INDEX             = "/index";
    private static final String        HREF_LISTECLIENT       = "/listeClient";
    private static final String        HREF_PRODUIT           = "/produit";
    private static final String        HREF_AJOUTPANIER       = "/ajoutPanier";
    private static final String        HREF_PANIER            = "/panier";
    private static final String        HREF_INSCRIPTION       = "/inscription";
    private static final String        HREF_PRODUITQTY        = "/modifierqty";
    private static final String        HREF_REFRESHPANIER     = "/refreshpanier";
    private static final String        HREF_CODEBONUS         = "/codebonus";

    // ATT : attribut de la variable de session
    public static final String         ATT_CLIENT             = "client";
    public static final String         ATT_CLIENT_STT         = "clientStatut";
    public static final String         ATT_LASTPAGE           = "page";
    public static final String         ATT_LISTE_CLIENT       = "listclient";
    public static final String         ATT_LISTE_PRODUIT      = "listproduit";
    public static final String         ATT_PRODUIT            = "monproduit";
    public static final String         ATT_PANIER             = "panier";
    public static final String         ATT_ERROR              = "errjsp";

    // VALATT : Variable récupérées de la session
    private Client                     _VALATT_Client         = null;
    private int                        _VALATT_Client_STT     = -1;
    private String                     _VALATT_lastPage       = null;
    private ArrayList<Client>          _VALATT_Liste_Client   = null;
    private ArrayList<Produit>         _VALATT_Liste_Produit  = null;
    private Produit                    _VALATT_Produit        = null;
    private Panier                     _VALATT_Panier         = null;
    private ErrJsp                     _VALATT_Erreur         = null;

    // FORM : paramètre de formulaire via methode post (via traitement
    // formulaire())
    private static final String        _FORMULAIRE            = "formulaire";
    private static final String        FORM_CLIENTCONNEXION   = "form_clientconnexion";
    private static final String        FORM_CLIENTINSCRIPTION = "form_clientinscription";

    // CHAMP : paramètre venant d'un formulaire
    public static final String         CHAMP1_EMAIL           = "email";
    public static final String         CHAMP1_PASS            = "motdepasse";

    public static final String         CHAMP2_NOM             = "inputNom";
    public static final String         CHAMP2_PRENOM          = "inputPrenom";
    public static final String         CHAMP2_SEXE            = "inputSexe";
    public static final String         CHAMP2_MAIL            = "inputEmail";
    public static final String         CHAMP2_PWD             = "inputPassword";
    public static final String         CHAMP2_TEL             = "inputTel";
    public static final String         CHAMP2_NAISSANCE       = "inputNaissance";
    public static final String         CHAMP2_ADDRESSE        = "inputAddress";
    public static final String         CHAMP2_VILLE           = "inputCity";
    public static final String         CHAMP2_CODEPOSTAL      = "inputCP";
    public static final String         CHAMP2_PAYS            = "inputPays";
    public static final String         CHAMP2_COMMENTAIRE     = "Textarea";

    // PARAM : Paramètre de l'url en méthode get
    public static final String         PARAM_IDPRODUIT        = "idProduit";
    public static final String         PARAM_PRODUITQTY       = "produitQty";
    public static final String         PARAM_MONBONUS         = "monbonus";

    // Initialisation de la factory
    private static AbstractDAOFactory  _daoFact;

    // détermination de la prochaine vue
    private String                     _NEXTVIEW;
    private boolean                    isError                = false;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controleur() {
        super();
    }

    // GETTER / SETTER
    public static AbstractDAOFactory getDao() {
        return _daoFact;
    }

    public static HttpServletRequest getRequest() {
        return _request;
    }

    public static HttpServletResponse getResponse() {
        return _response;
    }

    public static HttpSession getSession() {
        return _session;
    }

    private String getFullPath() {
        return _request.getServerName()
                + ":"
                + _request.getServerPort()
                + _request.getContextPath();
    }

    private String getRedirectionIndex() {
        return _request.getContextPath()
                + HREF_INDEX;
    }

    // INITIALISATION et Redirection
    private void initialize( HttpServletRequest req, HttpServletResponse resp )
            throws DaoException, ServiceException, IOException {
        // _request.getContextPath() => /eCommerce
        // _request.getServletPath() => /index
        // _request.getRequestURI() => /eCommerce/index?variable=valeur
        _request = req;
        _response = resp;

        _session = _request.getSession();

        // récupération variables de fonctionnement
        _VALATT_Client = ServSession.getSessionClient();
        _VALATT_Client_STT = ServSession.getSessionInt( ATT_CLIENT_STT );
        _VALATT_lastPage = ServSession.getSessionString( ATT_LASTPAGE );
        _VALATT_Liste_Client = ServSession.getSessionListClient();
        _VALATT_Liste_Produit = ServSession.getSessionListProduit();
        _VALATT_Produit = ServSession.getSessionProduit();
        _VALATT_Panier = ServSession.getSessionPanier();
        _VALATT_Erreur = ServSession.getSessionErreur();

        // remise à zéro des erreurs
        generateErrorToJSP( -1, null, null );

        // initialisation des dao
        _daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
    }

    private void redirection() throws DaoException, ServiceException {
        // récupération de l'url appelée
        String nextPage = _request.getServletPath();
        // récupération de la page à afficher en fonction de l'url
        switch ( nextPage ) {
        case HREF_CONNEXION:
            _NEXTVIEW = VUE_CONNEXION;
            break;
        case HREF_DECONNEXION:
            _NEXTVIEW = null;
            ServClient.deconnexionClient();
            ServPanier.removePanier();
            break;
        case HREF_INDEX:
            _NEXTVIEW = VUE_INDEX;
            ServSession.setSessionListProduit();
            break;
        case HREF_LISTECLIENT:
            _NEXTVIEW = VUE_LISTECLIENT;
            ServSession.setSessionListClient();
            break;
        case HREF_PRODUIT:
            _NEXTVIEW = VUE_PRODUIT;
            ServSession.setSessionProduitToView();
            break;
        case HREF_AJOUTPANIER:
            _NEXTVIEW = null;
            panierAjouter();
            break;
        case HREF_PANIER:
            _NEXTVIEW = VUE_PANIER;
            break;
        case HREF_INSCRIPTION:
            _NEXTVIEW = VUE_INSCRIPTION;
            break;
        case HREF_PRODUITQTY:
            _NEXTVIEW = VUE_PANIER;
            modifQtyProduit();
            break;
        case HREF_REFRESHPANIER:
            _NEXTVIEW = VUE_PANIER;
            refreshPanier();
            break;
        case HREF_CODEBONUS:
            _NEXTVIEW = VUE_PANIER;
            setBonus();
            break;
        default:
            _NEXTVIEW = VUE_INDEX;
            generateErrorToJSP( 0, "fr.afpa.ecom.controleur", "erreur lors du chargement de la page " + nextPage );
        }
    }

    private void navigateTo( String maVue ) throws ServletException, IOException {
        _response.getWriter().append( "navigateTo : " + maVue + " - error? : " + isError );
        if ( maVue != "write" ) {
            if ( !isError ) {
                if ( maVue == null ) {
                    _response.sendRedirect( getRedirectionIndex() );
                } else {
                    this.getServletContext().getRequestDispatcher( maVue ).forward( _request, _response );
                }
            } else {
                // en cas d'erreur
                if ( _NEXTVIEW == null ) {
                    this.getServletContext().getRequestDispatcher( VUE_INDEX ).forward( _request, _response );
                } else {
                    this.getServletContext().getRequestDispatcher( _NEXTVIEW ).forward( _request, _response );
                }
            }
        } else {
            _response.getWriter().append( "\nnavigateTo : " + maVue );
        }

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        try {
            initialize( request, response );
            redirection();
        } catch ( ServiceException e ) {
            generateErrorToJSP( 0, e.getClass().getName(), e.getMessage() );
        } catch ( DaoException e ) {
            generateErrorToJSP( e.get_errCode(), e.getClass().getName(), e.getMessage() );
        } catch ( Exception e ) {
            generateErrorToJSP( 0, e.getClass().getName(), e.getMessage() );
        } finally {
            navigateTo( _NEXTVIEW );
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            // traitement des formulaires
            throws ServletException, IOException {
        try {
            initialize( request, response );
            traitementFormulaires();
            redirection();
        } catch ( ServiceException e ) {
            generateErrorToJSP( 0, e.getClass().getName(), e.getMessage() );
        } catch ( DaoException e ) {
            generateErrorToJSP( e.get_errCode(), e.getClass().getName(), e.getMessage() );
        } catch ( Exception e ) {
            generateErrorToJSP( 0, e.getClass().getName(), e.getMessage() );
        } finally {
            navigateTo( null );
        }

    }

    // METHODE ANNEXE
    private void setBonus() throws DaoException
    {
        String monCode = ServSession.getValeurChamp( PARAM_MONBONUS );
        switch (monCode)
        {
        case "global10":
            _VALATT_Panier.get_commande().set_remiseGlobale( 0.10 );
            _daoFact.getCommande().update( _VALATT_Panier.get_commande() );
            ServSession.setSessionPanier( _VALATT_Panier );
            break;
        case "rocky15":
            for (CommandeProduit cp : _VALATT_Panier.getArticles())
            {
                if (cp.get_produit().get_id() == 12)
                {
                    cp.set_remise( 0.15f );
                }
            }
            refreshPanier();
            break;
        }
    }
    
    private void refreshPanier() throws DaoException {
        _daoFact.getPanier( _VALATT_Client.get_id() ).updatePanier( _VALATT_Panier );

        // rechargement du panier en cas de delete suite à qty = 0
        _VALATT_Panier = _daoFact.getPanier( _VALATT_Client.get_id() ).getPanier();
        ServSession.setSessionPanier( _VALATT_Panier );
    }

    private void modifQtyProduit() {
        int maQty = Integer.parseInt( ServSession.getValeurChamp( PARAM_PRODUITQTY ) );
        int idP = Integer.parseInt( ServSession.getValeurChamp( PARAM_IDPRODUIT ) );

        for ( CommandeProduit cp : _VALATT_Panier.getArticles() ) {
            if ( cp.get_produit().get_id() == idP ) {
                cp.set_quantite( maQty );
            }
        }
        ServSession.setSessionPanier( _VALATT_Panier );
    }

    private void panierAjouter() throws DaoException, ServiceException {
        // récupération de l'id produit
        int idProduitToPanier = Integer.parseInt( ServSession.getValeurChamp( PARAM_IDPRODUIT ) );

        // création panier si non loggé
        if ( _VALATT_Client == null ) {
            // creation commande-client
            Client guest = ServPanier.initialisationClientGuest();
            ServPanier.initialisationPanier( guest );
            // mise à jour session
            _VALATT_Client = ServSession.getSessionClient();
        }
        // ajout du produit dans le panier
        _daoFact.getPanier( _VALATT_Client.get_id() ).ajoutPanier( idProduitToPanier, 1 );

        // ajout du panier à la session
        Panier p = _daoFact.getPanier( _VALATT_Client.get_id() ).getPanier();
        ServSession.setSessionPanier( p );
    }

    private void traitementFormulaires() throws ServiceException, DaoException, FormsException {
        switch ( _request.getParameter( _FORMULAIRE ) ) {
        case FORM_CLIENTCONNEXION:
            // Connexion du client
            ClientForm cf1 = new ClientForm();
            Client loginC = cf1.connexionClient();

            // vérif et récupération panier
            fusionRecuperationPanier( loginC.get_id() );
            break;

        case FORM_CLIENTINSCRIPTION:
            // inscription et connexion du client
            ClientForm cf2 = new ClientForm();
            Client ic = cf2.inscriptionClient();

            // vérif et récupération panier
            fusionRecuperationPanier( ic.get_id() );
            break;
        }
    }

    private void fusionRecuperationPanier( int idClient ) throws DaoException {
        if ( _VALATT_Client != null ) {
            for ( CommandeProduit cp : _VALATT_Panier.getArticles() ) {
                _daoFact.getPanier( idClient ).ajoutPanier( cp.get_produit().get_id(), cp.get_quantite() );

            }
        }

        Panier p = _daoFact.getPanier( idClient ).getPanier();
        ServSession.setSessionPanier( p );
    }

    private void generateErrorToJSP( int errcode, String errtype, String errmsg ) {
        isError = ( errcode == -1 ? false : true );
        if ( isError ) {
            ErrJsp er = new ErrJsp( errcode, errtype, errmsg );
            _session.setAttribute( ATT_ERROR, er );
        } else {
            _session.setAttribute( ATT_ERROR, null );

        }

    }

}
