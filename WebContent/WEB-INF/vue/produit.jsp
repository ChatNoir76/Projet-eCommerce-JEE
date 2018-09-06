<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Détail produit n°<c:out value="${monproduit._id}">?</c:out></p>
	<c:if test="${!empty monproduit}">
		<div>${monproduit.toString()}</div>
	</c:if>
	<c:if test="${empty monproduit}">
		<div>OUPS!!!! ce produit n'est pas référencé...</div>
	</c:if>

</body>
</html>