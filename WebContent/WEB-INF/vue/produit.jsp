<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>PAGE PRODUIT n°</p><span><c:out value="${mProduit}">par défaut</c:out></span>
	<c:if test="${!empty monproduit}">
  	    <div>${monproduit}</div>
  	</c:if>
	<c:if test="${empty monproduit}">
  	    <div>il n'y a pas de produit dans la variable de session</div>
  	</c:if>
  	
</body>
</html>