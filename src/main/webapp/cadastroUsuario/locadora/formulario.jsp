<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
		<title>Cadastro Locadora</title>
</head>

<body>
	<% System.out.println("PASSEI POR: cadastroUsuario/locadora/formulario.jsp"); %> 
	<div align="center">
		<h1>Cadastro Locadora</h1>
	</div>
	<div align="center">
		<form action="${pageContext.request.contextPath}/registrar-locadora/insercao" method="post">
			<%@include file="campos.jsp"%>
		</form>
	</div>
	<c:if test="${!empty requestScope.mensagens}">
		<ul class="erro">
			<c:forEach items="${requestScope.mensagens}" var="mensagem">
				<li>${mensagem}</li>
			</c:forEach>
		</ul>
	</c:if>
</body>
</html>
