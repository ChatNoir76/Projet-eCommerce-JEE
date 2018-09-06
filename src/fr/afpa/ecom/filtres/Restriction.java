package fr.afpa.ecom.filtres;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.afpa.ecom.controleur.Controleur;
import fr.afpa.ecom.controleur.service.ServSession;
import fr.afpa.ecom.modele.Client;

public class Restriction implements Filter {

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter( ServletRequest req, ServletResponse res, FilterChain chain )
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();

        if ( session.getAttribute( Controleur.ATT_CLIENT ) == null ) {
            response.getWriter().append( "le compte est en invité" );
        } else {
            Client c = ServSession.getSessionClient();
            int lvl = ServSession.getSessionInt( Controleur.ATT_CLIENT_STT );
            response.getWriter().append( "client id=" + c.get_id() + " de niveau : " + lvl );
        }
    }

    @Override
    public void init( FilterConfig arg0 ) throws ServletException {
        // TODO Auto-generated method stub

    }

}
