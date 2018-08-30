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

public class Restriction implements Filter {

    public static final String ATT_SESSION_USER = "client";
    
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
        

        if ( session.getAttribute( ATT_SESSION_USER ) == null ) {
            response.getWriter().append( "PAS POSSIBLE id=" );
            //response.sendRedirect( request.getContextPath() + ACCES_PUBLIC );
        } else {
            response.getWriter().append( "ok, continu..." );
            //chain.doFilter( request, response );
        }
    }

    @Override
    public void init( FilterConfig arg0 ) throws ServletException {
        // TODO Auto-generated method stub

    }

}
