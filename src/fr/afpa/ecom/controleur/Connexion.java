package fr.afpa.ecom.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.afpa.ecom.modele.Client;
import fr.afpa.ecom.modele.dao.AbstractDAOFactory;
import fr.afpa.ecom.modele.dao.DaoException;
import fr.afpa.ecom.modele.dao.EnumDAO;
import fr.afpa.ecom.modele.dao.mysql.DAOCP;
import fr.afpa.ecom.service.Service;

/**
 * Servlet implementation class Connexion
 */
@WebServlet( "/connexion" )
public class Connexion extends HttpServlet {
    private static final long   serialVersionUID = 1L;
    private static final String VUE              = "/WEB-INF/vue/connexion.jsp";
    private static final String REDIRECT_VUE     = "index";
    private static final String GET_CHAMP_EMAIL  = "email";
    private static final String GET_CHAMP_PASS   = "motdepasse";
    private static final String ATT_ERREURS      = "erreur";
    private AbstractDAOFactory  daoFact;
    private DAOCP<Client>       DaoClient;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connexion() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        int verif = 0;
        String email = request.getParameter( GET_CHAMP_EMAIL );
        String pass = request.getParameter( GET_CHAMP_PASS );

        try {
            daoFact = AbstractDAOFactory.getFactory( EnumDAO.MySQL );
            DaoClient = daoFact.getClient();
            verif = Service.verifConnexionClient( DaoClient.getAll(), email, pass );
        } catch ( DaoException e ) {
            request.setAttribute( "erreur", e.getMessage() );
        }

        if ( verif == 0 ) {
            // this.getServletContext().getRequestDispatcher( NEXT_VUE
            // ).forward( request, response );
            response.sendRedirect( REDIRECT_VUE );
        } else {
            request.setAttribute( "erreur", "L'identification de connexion à échouée !!!" );
            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
        }

    }

}
