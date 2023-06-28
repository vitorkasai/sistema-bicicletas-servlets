<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
		<title>Gerenciamento de Locadoras</title>
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
				<th>Ações</th>
			</tr>
			<c:forEach var="locadora" items="${requestScope.listaLocadoras}">
				<tr>
					<td>${locadora.id}</td>
					<td>${locadora.email}</td>
					<td>${locadora.senha}</td>
					<td>${locadora.nome}</td>
					<td>${locadora.CNPJ}</td>
					<td>${locadora.cidade}</td>
					<td><a href="/<%= contextPath%>/locadoras/edicao?id=${locadora.id}">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="/<%= contextPath%>/locadoras/remocao?id=${locadora.id}"
						onclick="return confirmExclusion()">
						Remoção</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
