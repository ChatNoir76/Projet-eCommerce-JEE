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
		<nav></nav>
		<section id='cadreBlanc' class='cadreBlanc'>
			<aside>
				<c:if test="${ !empty erreur }">
					<p style="color: red;">
						<c:out value="${ erreur }" />
					</p>
				</c:if>
			</aside>

			<p>INDEX</p>
		</section>
	</section>
</body>
</html>