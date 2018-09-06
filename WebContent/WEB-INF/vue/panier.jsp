<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTRO - Liste des Clients</title>
</head>
<body>
	<section id='contenu' class='contenu'>
		<section id='cadreBlanc' class='cadreBlanc'>
			<p>ceci est le test du listing du paniers</p>
			<c:forEach var="lc" items="${ panier.articles }">
				<p>
					<c:out value="${ lc.toString() }" />
				</p>
			</c:forEach>
		</section>
	</section>
</body>
</html>