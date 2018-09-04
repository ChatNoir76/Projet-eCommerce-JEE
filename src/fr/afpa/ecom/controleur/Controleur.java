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
import fr.afpa.ecom.modele.Fournisseur;
import fr.afpa.ecom.modele.Produit;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;
import fr.afpa.ecom.modele.dao.mysql.DAOCP;
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
        "/produit" } )
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

    // ATT : attribut de la variable de session
    private static final String       ATT_CLIENT           = "client";
    private static final String       ATT_CLIENT_STT       = "clientStatut";
    private static final String       ATT_LASTPAGE         = "page";
    private static final String       ATT_LISTE_CLIENT     = "listclient";
    private static final String       ATT_LISTE_PRODUIT    = "listproduit";
    private static final String       ATT_PRODUIT          = "monproduit";

    // PARAM : paramètre de formulaire via methode post (via traitement
    // formulaire())
    private static final String       PARAM_FORMULAIRE     = "formulaire";
    private static final String       FORM_CLIENTCONNEXION = "form_clientconnexion";

    // CHAMP : paramètre venant d'un formulaire
    private static final String       CHAMP_EMAIL          = "email";
    private static final String       CHAMP_PASS           = "motdepasse";
    private static final String       CHAMP_PRODUIT        = "produit";

    // Initialisation de la factory
    private static AbstractDAOFactory daoFact;

    // détermination de la prochaine vue
    private String                    _NEXTVIEW;
    // récupération de la vue initiale
    private String                    _lastPage;
    private String                    _monURL;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controleur() {
        super();
    }

    public static AbstractDAOFactory getDao() {
        return daoFact;
    }

    public static String getATT_CLIENT() {
        return ATT_CLIENT;
    }

    public static String getATT_CLIENT_STT() {
        return ATT_CLIENT_STT;
    }

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
        daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
    }

    private void redirection() throws DaoException
    {
     // récupération de l'url appelée
        String _nextPage = _request.getServletPath();
        _monURL = _request.getRequestURI();
     // récupération de la page à afficher en fonction de l'url
        // si _nextview=null alors rediction avec l'uri
        switch ( _nextPage ) {
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
            String name = _request.getParameter("mProduit");
            _request.setAttribute("mProduit", name);
            // setProduitToView();
            break;
        default:
            _NEXTVIEW = VUE_INDEX;
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
        
            throws ServletException, IOException {
        try {
            initialize( request, response );
            traitementFormulaires();
        } catch ( connexionException e ) {
            _request.setAttribute( "erreur", e.getMessage() );
        } catch ( DaoException e ) {
            _request.setAttribute( "erreur", e.getMessage() );
        }
        navigateTo( VUE_INDEX );
    }

    private void setListProduit() throws DaoException {
        _request.setAttribute( ATT_LISTE_PRODUIT, daoFact.getProduit().getAll() );
    }

    private void setListClient() throws DaoException {
        _request.setAttribute( ATT_LISTE_CLIENT, daoFact.getClient().getAll() );
    }

    private void setProduitToView() throws DaoException {
        _request.setAttribute( ATT_PRODUIT, daoFact.getProduit().getById( 130 ) );
    }

    private void traitementFormulaires() throws connexionException, DaoException {
        switch ( _request.getParameter( PARAM_FORMULAIRE ) ) {
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

    // CONNEXION (DoPost)
    /*
     * int verif = 0; String email = request.getParameter( GET_CHAMP_EMAIL );
     * String pass = request.getParameter( GET_CHAMP_PASS );
     * 
     * try { daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL ); DaoClient
     * = daoFact.getClient(); verif = Service.verifConnexionClient(
     * DaoClient.getAll(), email, pass ); } catch ( DaoException e ) {
     * request.setAttribute( "erreur", e.getMessage() ); }
     * 
     * if ( verif == 0 ) { // this.getServletContext().getRequestDispatcher(
     * NEXT_VUE // ).forward( request, response ); response.sendRedirect(
     * REDIRECT_VUE ); } else { request.setAttribute( "erreur",
     * "L'identification de connexion à échouée !!!" );
     * this.getServletContext().getRequestDispatcher( VUE ).forward( request,
     * response ); }
     */

    /*
     * ListeClient (DoGet) try { daoFact = AbstractDAOFactory.getFactory(
     * EnumDAO.MySQL ); DaoClient = daoFact.getClient(); request.setAttribute(
     * "clients", DaoClient.getAll() ); } catch ( DaoException e ) {
     * request.setAttribute( "erreur", e.getMessage() ); }
     * 
     * this.getServletContext().getRequestDispatcher( VUE ).forward( request,
     * response );
     */

}
