<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
		<title>Gerenciamento de clientes</title>
		<style>
		/* Cor de fundo para a página */
		body {
			background-color: #282a36;
			color: #f8f8f2;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		}

		/* Estilo dos títulos h1 e h2 */
		h1, h2 {
			color: #bd93f9;
			font-weight: normal;
			font-size: 24px;
		}

		/* Estilo dos links */
		a {
			color: #8be9fd;
			text-decoration: none;
		}

		/* Estilo dos links ao passar o mouse */
		a:hover {
			color: #50fa7b;
			text-decoration: none;
		}

		/* Estilo da tabela */
		table {
			width: 100%;
			border-collapse: collapse;
			background-color: #282a36;
			color: #f8f8f2;
		}

		/* Estilo das células do cabeçalho */
		th {
			background-color: #44475a;
			font-weight: bold;
			padding: 10px;
			text-align: left;
		}

		/* Estilo das células das linhas pares */
		tr:nth-child(even) {
			background-color: #44475a;
		}

		/* Estilo das células das linhas ímpares */
		tr:nth-child(odd) {
			background-color: #383a59;
		}

		/* Estilo das células das linhas ao passar o mouse */
		tr:hover {
			background-color: #6272a4;
		}

		/* Estilo das células de dados */
		td {
			padding: 10px;
		}

		/* Estilo do formulário */
		.form-container {
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		.form-container form {
			width: 500px;
			margin-top: 20px;
		}

		.form-container label {
			color: #f8f8f2;
			font-weight: bold;
		}

		.form-container input[type="email"],
		.form-container input[type="text"],
		.form-container input[type="tel"],
		.form-container input[type="date"] {
			width: 100%;
			padding: 10px;
			margin-bottom: 10px;
			border: 1px solid #44475a;
			background-color: #282a36;
			color: #f8f8f2;
		}

		.form-container input[type="email"]:focus,
		.form-container input[type="text"]:focus,
		.form-container input[type="tel"]:focus,
		.form-container input[type="date"]:focus {
			outline: none;
			border-color: #bd93f9;
		}
		.form-container input[type="submit"] {
			padding: 10px 20px;
			background-color: #50fa7b;
			color: #282a36;
			border: none;
			cursor: pointer;
		}
	
		.form-container input[type="submit"]:hover {
			background-color: #8be9fd;
		}
	</style>
</head>

	

<body>
	<% System.out.println("PASSEI POR: WEB-INF/cliente/formulario.jsp"); %> 
	<div align="center">
		<h1>Gerenciamento de clientes</h1>
		<h2>
			<a href="lista">Lista de Clientes</a>
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
</body>
</html>
