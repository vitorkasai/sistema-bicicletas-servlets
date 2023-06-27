<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
		<title>Locação Bicicletas</title>
</head>
<body>
	<% System.out.println("PASSEI POR: WEB-INF/cliente/lista.jsp"); %> 
	<%
		String contextPath = request.getContextPath().replace("/", "");
	%>
	<div align="center">
		<h1>Gerenciamento de clientes</h1>
		<h2>
			<a href="/<%=contextPath%>">Menu principal</a> &nbsp;&nbsp;&nbsp; <a
				href="/<%=contextPath%>/clientes/cadastro">Adicionar cliente</a>
		</h2>
	</div>

	<div align="center">
		<table border="1">
			<caption>Lista de Clientes</caption>
			<tr>
				<th>ID</th>
				<th>Email</th>
				<th>Senha</th>
				<th>Nome</th>
				<th>CPF</th>
				<th>Telefone</th>
				<th>Sexo</th>
				<th>Data de Nascimento</th>
				<th>Ações</th>
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
					<td><a href="/<%= contextPath%>/clientes/edicao?id=${cliente.id}">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="/<%= contextPath%>/clientes/remocao?id=${cliente.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este item?');">
						Remoção</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
