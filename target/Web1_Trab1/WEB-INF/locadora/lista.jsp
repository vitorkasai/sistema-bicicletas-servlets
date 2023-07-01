<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
		<title>Gerenciamento de Locadoras</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="<c:url value="/styles.css" />">


		<style>
			/* Estilo dos ícones de certo e errado */
			.icon-certo {
			  color: #50fa7b;
			}
		  
			.icon-errado {
			  color: #ff5555;
			}
			.dado-icone {
				text-align: center;
			}
		  </style>

	<script>
		function confirmExclusion() {
		  var message = document.getElementById("removalConfirmMessage").value;
		  return confirm(message);
		}
	</script>
</head>
<body>
	<% System.out.println("PASSEI POR: WEB-INF/locadora/lista.jsp"); %> 
	<input type="hidden" id="removalConfirmMessage" value="<fmt:message key='removal_confirm' />">
	<%
		String contextPath = request.getContextPath().replace("/", "");
	%>
	<div align="center">
		<h1>Gerenciamento de Locadoras</h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp; <a
				href="/<%=contextPath%>/locadoras/cadastro">Adicionar locadora</a>
		</h2>
	</div>

	<div align="center">
		<table border="1">
			<caption>Lista de Locadoras</caption>
			<tr>
				<th>ID</th>
				<th>Email</th>
				<th>Senha</th>
				<th>Nome</th>
				<th>CNPJ</th>
				<th>Cidade</th>
				<th>Administrador</th>
				<th>Ações</th>
			</tr>
			<c:forEach var="locadora" items="${sessionScope.listaLocadoras}">
				<tr>
					<td>${locadora.id}</td>
					<td>${locadora.email}</td>
					<td>${locadora.senha}</td>
					<td>${locadora.nome}</td>
					<td>${locadora.CNPJ}</td>
					<td>${locadora.cidade}</td>
					<c:choose>
						<c:when test="${locadora.getAdministrador() == '1'}">
							<td class="dado-icone"><i class="fas fa-check icon-certo"></i></td>
						</c:when>
						<c:otherwise>
							<td class="dado-icone"><i class="fas fa-times icon-errado"></i></td>
						</c:otherwise>
					</c:choose>
					<td><a href="/<%= contextPath%>/locadoras/edicao?id=${locadora.id}"><i class="fas fa-pencil-alt"></i></a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="/<%= contextPath%>/locadoras/remocao?id=${locadora.id}"
						onclick="return confirmExclusion()"><i class="fas fa-trash-alt"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
