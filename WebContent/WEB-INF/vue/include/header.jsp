<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
	<!-- <div id="header_recherche"></div> -->
    <!-- <input type="search" id='search' name='search' value="rien" /> -->
    <nav class="navbar">
    	<div class="container-fluid">
    		<div class="navbar-collapse">
			    <ul class="nav navbar-nav">
				    <li>
				    	<a href="/eCommerce/index">Accueil</a>
				    </li>
			    	<li>
				    	<c:if test="${!empty sessionScope.client}">
					        <c:if test="${sessionScope.clientStatut >= 4}">
					    	    <a href="/eCommerce/listeClient">liste client</a>
				    	   	</c:if>
					    </c:if>
			    	</li>
			    </ul>
  			    <div class="navbar-right">
		    		<c:if test="${empty sessionScope.client}">
				        <a href="/eCommerce/connexion">Connexion</a>
				    </c:if>
			    	<c:if test="${!empty sessionScope.client}">
				        <a href="/eCommerce/deconnexion">
				        Déconnexion(<span class="succes">${sessionScope.client.get_mail()}</span>
				        )</a>
				    </c:if>
		    	</div>
		    </div>
	    </div>

	    
    </nav>
</header>