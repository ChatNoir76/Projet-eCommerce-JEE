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
			<p>Bienvenu sur le site eCommerce</p>
			<c:forEach var="lc" items="${ listproduit }">
				<p>
					<c:out value="${ lc.toString() }" />
				</p>
			</c:forEach>
		</section>
	</section>
</body>
</html>