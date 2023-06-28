<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: WEB-INF/cliente/campos.jsp"); %> 

<table border="1">
	<caption>
   		<c:choose>
   			<c:when test="${cliente != null}">
				Edição
                           </c:when>
   			<c:otherwise>
				Cadastro
                           </c:otherwise>
   		</c:choose>
	</caption>
 	<c:if test="${cliente != null}">
   		<input type="hidden" name="id" value="${cliente.id}" />
   	</c:if>
   	<tr>
   		<td><label for="email">Email</label></td>
   		<td><input type="text" id="email" name="email" size="45"
   			required value="${cliente.email}" maxlength="256" /></td>
   	</tr>
   	<tr>
   		<td><label for="senha">Senha</label></td>
   		<td><input type="text" id="senha" name="senha" size="45" required
   			value="${cliente.senha}" maxlength="256" /></td>
   	</tr>
	
   	<tr>
   		<td><label for="nome">Nome</label></td>
   		<td><input type="text" id="nome" name="nome" required value="${cliente.nome}" /></td>
   	</tr>
   	<tr>
   		<td><label for="CPF">CPF</label></td>
   		<td><input type="text" id="CPF" name="CPF" required value="${cliente.CPF}" /></td>
   	</tr>
	<tr>
		<td><label for="sexo">Sexo</label></td>
		<td><input type="text" id="sexo" name="sexo" required value="${cliente.sexo}" /></td>
	</tr>
	<tr>
		<td><label for="telefone">Telefone</label></td>
		<td><input type="text" id="telefone" name="telefone" required value="${cliente.telefone}" /></td>
	</tr>
	<tr>
		<td><label for="dataNascimento">dataNascimento</label></td>
		<td><input type="text" id="dataNascimento" name="dataNascimento" required value="${cliente.dataNascimento}" /></td>
	</tr>
   	<tr>
		<!-- Substituir o value depois por <fmt:message key="save" /> /> -->
   		<td colspan="2" align="center"><input type="submit" value="Enviar"></td>
   	</tr>
</table>

