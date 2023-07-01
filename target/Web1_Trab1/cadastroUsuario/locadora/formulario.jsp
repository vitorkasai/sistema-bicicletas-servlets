<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
		<title>Cadastro Locadora</title>
		<style>
			body {
				background-color: #282a36;
				color: #f8f8f2;
				font-family: 'Courier New', Courier, monospace;
			}
	
			h1 {
				color: #bd93f9;
			}
	
			div.form-container {
				margin: 50px auto;
				max-width: 600px;
				padding: 20px;
				background-color: #44475a;
				border-radius: 5px;
			}
	
			table {
				width: 100%;
				border-collapse: collapse;
				background-color: #282a36;
				color: #f8f8f2;
				border: 1px solid #6272a4;
			}
	
			caption {
				font-size: 18px;
				font-weight: bold;
				padding: 10px;
			}
	
			th {
				background-color: #44475a;
				font-weight: bold;
				padding: 10px;
				text-align: left;
				border-bottom: 1px solid #6272a4;
			}
	
			td {
				padding: 10px;
				border-bottom: 1px solid #6272a4;
			}
	
			label {
				color: #f8f8f2;
				font-weight: bold;
			}
	
			input[type="text"],
			input[type="email"],
			input[type="password"],
			select {
				width: 100%;
				padding: 10px;
				margin-bottom: 10px;
				border: 1px solid #44475a;
				background-color: #282a36;
				color: #f8f8f2;
				border-radius: 5px;
			}
	
			input[type="submit"] {
				padding: 10px 20px;
				background-color: #50fa7b;
				color: #282a36;
				border: none;
				cursor: pointer;
				border-radius: 5px;
			}
	
			ul.erro {
				list-style-type: none;
				padding: 0;
				margin-top: 20px;
				background-color: #ff5555;
				color: #282a36;
				border-radius: 5px;
			}
	
			ul.erro li {
				padding: 10px;
			}
		</style>
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
