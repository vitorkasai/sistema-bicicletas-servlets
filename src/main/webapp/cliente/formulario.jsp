<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<fmt:bundle basename="messages">
		<title><fmt:message key="v_bookstore" /></title>
	</fmt:bundle>
</head>

<body>
	<% System.out.println("PASSEI POR: WEB-INF/cliente/formulario.jsp"); %> 
	<fmt:bundle basename="messages">
	<div align="center">
		<h1><fmt:message key="book_management" /></h1>
		<h2>
			<a href="lista"><fmt:message key="booklist" /></a>
		</h2>
	</div>
	<div align="center">
		<c:choose>
			<c:when test="${cliente != null}">
				<form action="atualizacao" method="post">
					<%@include file="campos.jsp"%>
				</form>
			</c:when>
			<c:otherwise>
				<form action="insercao" method="post">
					<%@include file="campos.jsp"%>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<c:if test="${!empty requestScope.mensagens}">
		<ul class="erro">
			<c:forEach items="${requestScope.mensagens}" var="mensagem">
				<li>${mensagem}</li>
			</c:forEach>
		</ul>
	</c:if>
</fmt:bundle>
</body>
</html>
