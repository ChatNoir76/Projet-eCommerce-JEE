package fr.afpa.ecom.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.Commande;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;
import fr.afpa.ecom.service.Service;
import fr.afpa.ecom.service.connexionException;

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
    private static final long         serialVersionUID     = 1L;
    private HttpServletRequest        _request;
    private HttpServletResponse       _response;
    private HttpSession               _session;

    // VUE : redirection vers la vue (req,resp)
    private static final String       VUE_INDEX            = "/WEB-INF/vue/index.jsp";
    private static final String       VUE_CONNEXION        = "/WEB-INF/vue/connexion.jsp";
    private static final String       VUE_LISTECLIENT      = "/WEB-INF/vue/listeClient.jsp";
    private static final String       VUE_PRODUIT          = "/WEB-INF/vue/produit.jsp";

    // HREF : Lien vers une autre page via getServletPath()
    private static final String       HREF_CONNEXION       = "/connexion";
    private static final String       HREF_DECONNEXION     = "/deconnexion";
    private static final String       HREF_INDEX           = "/index";
    private static final String       HREF_LISTECLIENT     = "/listeClient";
    private static final String       HREF_PRODUIT         = "/produit";
    private static final String       HREF_AJOUTPANIER     = "/ajoutPanier";

    // ATT : attribut de la variable de session
    private static final String       ATT_CLIENT           = "client";
    private static final String       ATT_CLIENT_STT       = "clientStatut";
    private static final String       ATT_LASTPAGE         = "page";
    private static final String       ATT_LISTE_CLIENT     = "listclient";
    private static final String       ATT_LISTE_PRODUIT    = "listproduit";
    private static final String       ATT_PRODUIT          = "monproduit";

    // FORM : paramètre de formulaire via methode post (via traitement
    // formulaire())
    private static final String       _FORMULAIRE          = "formulaire";
    private static final String       FORM_CLIENTCONNEXION = "form_clientconnexion";

    // CHAMP : paramètre venant d'un formulaire
    private static final String       CHAMP_EMAIL          = "email";
    private static final String       CHAMP_PASS           = "motdepasse";

    // PARAM : Paramètre de l'url en méthode get
    private static final String       PARAM_IDPRODUIT      = "idProduit";

    // Initialisation de la factory
    private static AbstractDAOFactory _daoFact;

    // détermination de la prochaine vue
    private String                    _NEXTVIEW;
    // récupération de la vue initiale
    private String                    _lastPage;

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

    public static String getATT_CLIENT() {
        return ATT_CLIENT;
    }

    public static String getATT_CLIENT_STT() {
        return ATT_CLIENT_STT;
    }

    private String getFullPath() {
        return _request.getServerName()
                + ":"
                + _request.getServerPort()
                + _request.getContextPath();
    }

    // INITIALISATION
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
        _lastPage = (String) _session.getAttribute( ATT_LASTPAGE );

        // initialisation des dao
        _daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
    }

    private void redirection() throws DaoException {
        // récupération de l'url appelée
        String nextPage = _request.getServletPath();
        // récupération de la page à afficher en fonction de l'url
        switch ( nextPage ) {
        case HREF_CONNEXION:
            _NEXTVIEW = VUE_CONNEXION;
            break;
        case HREF_DECONNEXION:
            _NEXTVIEW = VUE_INDEX;
            Service.deconnexionClient( _session );
            break;
        case HREF_INDEX:
            _NEXTVIEW = VUE_INDEX;
            setListProduit();
            break;
        case HREF_LISTECLIENT:
            _NEXTVIEW = VUE_LISTECLIENT;
            setListClient();
            break;
        case HREF_PRODUIT:
            _NEXTVIEW = VUE_PRODUIT;
            setProduitToView();
            break;
        case HREF_AJOUTPANIER:
            _NEXTVIEW = VUE_INDEX;
            setProduitToPanier();
            break;
        default:
            _NEXTVIEW = VUE_INDEX;
        }
    }

    // DOGET - DOPOST
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
    private void setListProduit() throws DaoException {
        _request.setAttribute( ATT_LISTE_PRODUIT, _daoFact.getProduit().getAll() );
    }

    private void setListClient() throws DaoException {
        _request.setAttribute( ATT_LISTE_CLIENT, _daoFact.getClient().getAll() );
    }

    private void setProduitToView() throws DaoException {
        int id = Integer.parseInt( Service.getValeurChamp( _request, PARAM_IDPRODUIT ) );
        _request.setAttribute( "monid", id );
        _request.setAttribute( ATT_PRODUIT, Service.getProduitFromStrId( id ) );
    }

    private void setProduitToPanier() throws DaoException
    {
        // cas invité
        Client c = new Client();
        _daoFact.getClient().insert( c );
        Commande cmd = new Commande(c.get_id());
        
        
    }
    
    private void traitementFormulaires() throws connexionException, DaoException {
        switch ( _request.getParameter( _FORMULAIRE ) ) {
        case FORM_CLIENTCONNEXION:
            String mail = Service.getValeurChamp( _request, CHAMP_EMAIL );
            String mdp = Service.getValeurChamp( _request, CHAMP_PASS );
            Service.connexionClient( _session, mail, mdp );
            break;
        }
    }

    private void navigateTo( String maVue ) throws ServletException, IOException {
        _session.setAttribute( ATT_LASTPAGE, maVue );
        this.getServletContext().getRequestDispatcher( maVue ).forward( _request, _response );

    }

}
