package fr.afpa.ecom.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.afpa.ecom.forms.ConnexionForm;
import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;
import fr.afpa.ecom.modele.dao.mysql.DAOCP;
import fr.afpa.ecom.service.Service;
import fr.afpa.ecom.service.connexionException;

/**
 * Servlet implementation class Index
 */
@WebServlet( urlPatterns = { "/index", "/connexion", "/listeClient", "/deconnexion" } )
public class Controleur extends HttpServlet {
    private static final long   serialVersionUID = 1L;
    private HttpServletRequest  _request;
    private HttpServletResponse _response;
    private HttpSession         _session;

    private static final String VUE_INDEX        = "/WEB-INF/vue/index.jsp";
    private static final String VUE_CONNEXION    = "/WEB-INF/vue/connexion.jsp";
    private static final String VUE_LISTECLIENT  = "/WEB-INF/vue/listeClient.jsp";

    private static final String HREF_CONNEXION   = "/eCommerce/connexion";
    private static final String HREF_DECONNEXION = "/eCommerce/deconnexion";
    private static final String HREF_INDEX       = "/eCommerce/index";
    private static final String HREF_LISTECLIENT = "/eCommerce/listeClient";

    private static final String ATT_CLIENT       = "client";
    private static final String ATT_CLIENT_STT   = "clientStatut";

    // ATT : attribut variable de session
    private static final String ATT_LASTPAGE     = "page";

    // PARAM : paramètre de formulaire via methode post
    private static final String PARAM_FORMULAIRE = "formulaire";

    private static final String CHAMP_EMAIL      = "email";
    private static final String CHAMP_PASS       = "motdepasse";

    private AbstractDAOFactory daoFact;
    private DAOCP<Client> daoClient;
    
    private String              _NEXTVIEW;
    private String              _lastPage;
    private Client              _c;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controleur() {
        super();
    }

    public static String getATT_CLIENT() {
        return ATT_CLIENT;
    }

    public static String getATT_CLIENT_STT() {
        return ATT_CLIENT_STT;
    }

    private void initialize( HttpServletRequest req, HttpServletResponse resp ) throws DaoException, connexionException {
        // _request.getContextPath() => /eCommerce
        // _request.getServletPath() => /index
        // _request.getRequestURI() => /eCommerce/index
        _request = req;
        _response = resp;

        // récupération de l'url appelée
        String _nextPage = _request.getRequestURI();

        // activation ou récupération variables de session
        _session = _request.getSession();

        // récupération variables de fonctionnement
        String viaFormulaire = _request.getParameter( PARAM_FORMULAIRE );

        _lastPage = (String) _session.getAttribute( ATT_LASTPAGE );

        // vérification via formulaire
        if ( viaFormulaire != null ) {
            traitementFormulaires();
        }

        // récupération de la page à afficher en fonction de l'url
        switch ( _nextPage ) {
        case HREF_CONNEXION:
            _NEXTVIEW = VUE_CONNEXION;
            break;
        case HREF_DECONNEXION:
            _NEXTVIEW = VUE_INDEX;
            // deconnexion();
            break;
        case HREF_INDEX:
            _NEXTVIEW = VUE_INDEX;
            break;
        case HREF_LISTECLIENT:
            _NEXTVIEW = VUE_LISTECLIENT;
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
        } catch ( DaoException | connexionException e ) {
            _request.setAttribute( "erreur", e.getMessage());
        }

        // _response.getWriter().append("getContextPath() => ").append(
        // _request.getContextPath() );
        // _response.getWriter().append(" || getServletPath() => ").append(
        // _request.getServletPath() );

        // _request.setAttribute( "erreur", "L'identification de connexion à
        // échouée !!!" );

        navigateTo( _NEXTVIEW );
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        doGet( request, response );
    }

    private void traitementFormulaires() throws DaoException, connexionException {
        switch ( _request.getParameter( "formulaire" ) ) {
        case "form_clientconnexion":
            daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
            daoClient = daoFact.getClient();
            String mail = Service.getValeurChamp( _request, CHAMP_EMAIL );
            String mdp = Service.getValeurChamp( _request, CHAMP_PASS );
            Service.connexionClient( _session, daoClient, mail, mdp );
            break;
        }
    }

    private void navigateTo( String maVue ) {
        try {
            _session.setAttribute( ATT_LASTPAGE, maVue );
            this.getServletContext().getRequestDispatcher( maVue ).forward( _request, _response );
        } catch ( ServletException e ) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch ( IOException e ) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
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
