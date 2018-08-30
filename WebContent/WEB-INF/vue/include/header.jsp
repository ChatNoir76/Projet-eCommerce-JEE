<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
	<!-- <div id="header_recherche"></div> -->
    <!-- <input type="search" id='search' name='search' value="rien" /> -->
    
    <ul class="nav navbar-nav">
	    <li>
	    	<a href="/eCommerce/index">Accueil</a>
	    </li>
    	<li>
	    	<c:if test="${!empty sessionScope.client}">
		        <%-- Si l'utilisateur existe en session, alors on affiche son adresse email. --%>
		        <p class="succes">${sessionScope.client.get_mail()}</p>
		        <p>Déconnexion</p>
		    </c:if>
    	</li>
    	<li>
    	    <c:if test="${empty sessionScope.client}">
		        <a href="/eCommerce/connexion">Connexion</a>
		    </c:if>
    	</li>
    	<li></li>
    	<li></li>
    </ul>
    

</header>