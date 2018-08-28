package fr.afpa.ecom.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;
import fr.afpa.ecom.modele.dao.mysql.DAOCP;
import fr.afpa.ecom.service.Service;

/**
 * Servlet implementation class Index
 */
@WebServlet( urlPatterns = { "/index", "/connexion", "/listeClient" } )
public class Controleur extends HttpServlet {
    private static final long   serialVersionUID = 1L;

    private static final String VUE_INDEX        = "/WEB-INF/vue/index.jsp";
    private static final String VUE_CONNEXION    = "/WEB-INF/vue/connexion.jsp";
    private static final String VUE_LISTECLIENT  = "/WEB-INF/vue/listeClient.jsp";

    private static final String GET_FORMULAIRE   = "formulaire";
    private static final String GET_CHAMP_EMAIL  = "email";
    private static final String GET_CHAMP_PASS   = "motdepasse";
    private static final String GET_CLIENT       = "client";

    private static final String REDIRECT_VUE     = "index";

    private static final String ATT_ERREURS      = "erreur";

    private String              VUE              = "/WEB-INF/vue/index.jsp";

    private Client              _c;
    private HttpServletRequest  _request;
    private HttpServletResponse _response;
    private HttpSession         _session;
    private String              _page;
    private AbstractDAOFactory  _daoFact;
    private DAOCP<Client>       _DaoClient;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controleur() {
        super();
    }

    private void initialize( HttpServletRequest req, HttpServletResponse resp ) {
        _request = req;
        _response = resp;

        // activation ou récupération variables de session
        _session = _request.getSession();

        // récupération du client
        _c = (Client) _session.getAttribute( GET_CLIENT );
        
        // récupération de la page
        _page = _request.getParameter( "pageEnCours" );
        if ( _page == null )
            VUE = VUE_CONNEXION;
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        initialize( request, response );

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        initialize( request, response );

        if ( _request.getParameter( GET_FORMULAIRE ) != null )
            traitementFormulaire();

        // doGet( request, response );
    }

    private void traitementFormulaire() {

        try {
            navigateTo( VUE );
        } catch ( ServletException e ) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch ( IOException e ) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void navigateTo( String maVue ) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher( maVue ).forward( _request, _response );
    }

    private void recup() {

        // CONNEXION (DoPost)
        /*
         * int verif = 0; String email = request.getParameter( GET_CHAMP_EMAIL
         * ); String pass = request.getParameter( GET_CHAMP_PASS );
         * 
         * try { daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
         * DaoClient = daoFact.getClient(); verif =
         * Service.verifConnexionClient( DaoClient.getAll(), email, pass ); }
         * catch ( DaoException e ) { request.setAttribute( "erreur",
         * e.getMessage() ); }
         * 
         * if ( verif == 0 ) { // this.getServletContext().getRequestDispatcher(
         * NEXT_VUE // ).forward( request, response ); response.sendRedirect(
         * REDIRECT_VUE ); } else { request.setAttribute( "erreur",
         * "L'identification de connexion à échouée !!!" );
         * this.getServletContext().getRequestDispatcher( VUE ).forward(
         * request, response ); }
         */

        /*
         * ListeClient (DoGet) try { daoFact = AbstractDAOFactory.getFactory(
         * EnumDAO.MySQL ); DaoClient = daoFact.getClient();
         * request.setAttribute( "clients", DaoClient.getAll() ); } catch (
         * DaoException e ) { request.setAttribute( "erreur", e.getMessage() );
         * }
         * 
         * this.getServletContext().getRequestDispatcher( VUE ).forward(
         * request, response );
         */

    }

}
