<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<fmt:bundle basename="messages">
<head>
		
		<title><fmt:message key="locacao_bicicletas" /></title>
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
	<% System.out.println("PASSEI POR: WEB-INF/cliente/lista.jsp"); %> 
	<%
		String contextPath = request.getContextPath().replace("/", "");
	%>
	<input type="hidden" id="removalConfirmMessage" value="<fmt:message key='confirmar_remocao' />">

	<div align="center">
		<h1><fmt:message key="gerenciamento_clientes" /></h1>
		<h2>
			<a href="/<%=contextPath%>"><fmt:message key="menu_principal" /></a> &nbsp;&nbsp;&nbsp; <a
				href="/<%=contextPath%>/clientes/cadastro"><fmt:message key="adicionar_cliente" /></a>
		</h2>
	</div>

	<div align="center">
		<table border="1">
			<caption><fmt:message key="lista_clientes" /></caption>
			<tr>
				<th><fmt:message key="ID" /></th>
				<th><fmt:message key="email" /></th>
				<th><fmt:message key="senha" /></th>
				<th><fmt:message key="nome" /></th>
				<th><fmt:message key="CPF" /></th>
				<th><fmt:message key="telefone" /></th>
				<th><fmt:message key="sexo" /></th>
				<th><fmt:message key="data_nascimento" /></th>
				<th><fmt:message key="adm" /></th>
				<th><fmt:message key="acoes" /></th>
			</tr>
			<c:forEach var="cliente" items="${requestScope.listaClientes}">
				<tr>
					<td>${cliente.id}</td>
					<td>${cliente.email}</td>
					<td>${cliente.senha}</td>
					<td>${cliente.nome}</td>
					<td>${cliente.CPF}</td>
					<td>${cliente.telefone}</td>
					<td>${cliente.sexo}</td>
					<td>${cliente.dataNascimento}</td>
					<c:choose>
						<c:when test="${cliente.getAdministrador() == '1'}">
							<td class="dado-icone"><i class="fas fa-check icon-certo"></i></td>
						</c:when>
						<c:otherwise>
							<td class="dado-icone"><i class="fas fa-times icon-errado"></i></td>
						</c:otherwise>
					</c:choose>
					<td><a href="/<%= contextPath%>/clientes/edicao?id=${cliente.id}"><i class="fas fa-pencil-alt"></i></a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="/<%= contextPath%>/clientes/remocao?id=${cliente.id}"
						onclick="return confirmExclusion();"><i class="fas fa-trash-alt"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</fmt:bundle>
</html>
