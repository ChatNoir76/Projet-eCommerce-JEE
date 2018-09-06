package fr.afpa.ecom.controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.afpa.ecom.controleur.service.ServClient;
import fr.afpa.ecom.controleur.service.ServProduit;
import fr.afpa.ecom.controleur.service.ServSession;
import fr.afpa.ecom.controleur.service.connexionException;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.Panier;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;

/**
 * Servlet implementation class Index
 */
@WebServlet( urlPatterns = {
        "/index",
        "/connexion",
        "/listeClient",
        "/deconnexion",
        "/produit",
        "/ajoutPanier" } )
public class Controleur extends HttpServlet {
    private static final long          serialVersionUID      = 1L;
    private static HttpServletRequest  _request;
    private static HttpServletResponse _response;
    private static HttpSession         _session;

    // VUE : redirection vers la vue (req,resp)
    private static final String        VUE_INDEX             = "/WEB-INF/vue/index.jsp";
    private static final String        VUE_CONNEXION         = "/WEB-INF/vue/connexion.jsp";
    private static final String        VUE_LISTECLIENT       = "/WEB-INF/vue/listeClient.jsp";
    private static final String        VUE_PRODUIT           = "/WEB-INF/vue/produit.jsp";

    // HREF : Lien vers une autre page via getServletPath()
    private static final String        HREF_CONNEXION        = "/connexion";
    private static final String        HREF_DECONNEXION      = "/deconnexion";
    private static final String        HREF_INDEX            = "/index";
    private static final String        HREF_LISTECLIENT      = "/listeClient";
    private static final String        HREF_PRODUIT          = "/produit";
    private static final String        HREF_AJOUTPANIER      = "/ajoutPanier";

    // ATT : attribut de la variable de session
    public static final String         ATT_CLIENT            = "client";
    public static final String         ATT_CLIENT_STT        = "clientStatut";
    public static final String         ATT_LASTPAGE          = "page";
    public static final String         ATT_LISTE_CLIENT      = "listclient";
    public static final String         ATT_LISTE_PRODUIT     = "listproduit";
    public static final String         ATT_PRODUIT           = "monproduit";
    public static final String         ATT_PANIER            = "panier";

    // VALATT : Variable récupérées de la session
    private Client                     _VALATT_Client        = null;
    private int                        _VALATT_Client_STT    = -1;
    private String                     _VALATT_lastPage      = null;
    private ArrayList<Client>          _VALATT_Liste_Client  = null;
    private ArrayList<Produit>         _VALATT_Liste_Produit = null;
    private Produit                    _VALATT_Produit       = null;
    private Panier                     _VALATT_Panier        = null;

    // FORM : paramètre de formulaire via methode post (via traitement
    // formulaire())
    private static final String        _FORMULAIRE           = "formulaire";
    private static final String        FORM_CLIENTCONNEXION  = "form_clientconnexion";

    // CHAMP : paramètre venant d'un formulaire
    private static final String        CHAMP_EMAIL           = "email";
    private static final String        CHAMP_PASS            = "motdepasse";

    // PARAM : Paramètre de l'url en méthode get
    public static final String         PARAM_IDPRODUIT       = "idProduit";

    // Initialisation de la factory
    private static AbstractDAOFactory  _daoFact;
    // détermination de la prochaine vue
    private String                     _NEXTVIEW;

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
            throws DaoException, connexionException, IOException {
        // _request.getContextPath() => /eCommerce
        // _request.getServletPath() => /index
        // _request.getRequestURI() => /eCommerce/index?variable=valeur
        _request = req;
        _response = resp;

        // activation ou récupération variables de session
        _session = _request.getSession();

        // récupération variables de fonctionnement
        _VALATT_Client = ServSession.getSessionClient();
        _VALATT_Client_STT = ServSession.getSessionInt( ATT_CLIENT_STT );
        _VALATT_lastPage = ServSession.getSessionString( ATT_LASTPAGE );
        _VALATT_Liste_Client = ServSession.getSessionListClient();
        _VALATT_Liste_Produit = ServSession.getSessionListProduit();
        _VALATT_Produit = ServSession.getSessionProduit();

        // initialisation des dao
        _daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
    }

    private void redirection() throws DaoException, connexionException {
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
            ajoutPanier();
            break;
        default:
            _NEXTVIEW = VUE_INDEX;
        }
    }

    private void navigateTo( String maVue ) throws ServletException, IOException {
        if ( maVue == null ) {
            _session.setAttribute( ATT_LASTPAGE, VUE_INDEX );
            _response.sendRedirect( getRedirectionIndex() );
        } else {
            _session.setAttribute( ATT_LASTPAGE, maVue );
            this.getServletContext().getRequestDispatcher( maVue ).forward( _request, _response );

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
            navigateTo( _NEXTVIEW );
        } catch ( DaoException | connexionException e ) {
            _request.setAttribute( "erreur", e.getMessage() );
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
        } catch ( connexionException e ) {
            _request.setAttribute( "erreur", e.getMessage() );
        } catch ( DaoException e ) {
            _request.setAttribute( "erreur", e.getMessage() );
        }
        navigateTo( VUE_INDEX );
    }

    // METHODE ANNEXE

    private void ajoutPanier() throws DaoException, connexionException {
        int idProduitToPanier = Integer.parseInt( ServSession.getValeurChamp( PARAM_IDPRODUIT ) );
        if ( _VALATT_Client == null ) {
            creationPanier();
        } else {

        }

    }

    private void traitementFormulaires() throws connexionException, DaoException {
        switch ( _request.getParameter( _FORMULAIRE ) ) {
        case FORM_CLIENTCONNEXION:
            String mail = ServSession.getValeurChamp( CHAMP_EMAIL );
            String mdp = ServSession.getValeurChamp( CHAMP_PASS );
            ServClient.connexionClient( mail, mdp );
            break;
        }
    }

    private void creationPanier() throws DaoException, connexionException {
        // Création et connexion du client
        Client c = new Client();
        _daoFact.getClient().insert( c );
        ServClient.connexionClient( c.get_mail(), c.get_motDePasse() );
        // Création de la commande
        Commande com = new Commande( c.get_id() );
        _daoFact.getCommande().insert( com );
        // création du panier et enregistrement en session
        Panier p = new Panier( com, c );

    }

}
