<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: cadastroUsuario/cliente/campos.jsp"); %> 

<fmt:bundle basename="messages">
<table border="1">
	<caption>
		<fmt:message key="cadastro" />
	</caption>
   	<tr>
   		<td><label for="email"><fmt:message key="email" /></label></td>
   		<td>
			<input type="email" id="email" name="email" size="45"
   			required maxlength="256" />
			<c:if test="${mensagemErro == 'O email já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_email" /></div>
			</c:if>
		</td>
   	</tr>
   	<tr>
   		<td><label for="senha"><fmt:message key="senha" /></label></td>
   		<td><input type="password" id="senha" name="senha" size="45" required maxlength="256" /></td>
   	</tr>
	
   	<tr>
   		<td><label for="nome"><fmt:message key="nome" /></label></td>
   		<td><input type="text" id="nome" name="nome" required /></td>
   	</tr>
   	<tr>
   		<td><label for="CPF"><fmt:message key="CPF" /></label></td>
   		<td>
			<input type="text" id="CPF" name="CPF" required maxlength="11" />
			<c:if test="${mensagemErro == 'O CPF já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_CPF" /></div>
			</c:if>
		</td>
   	</tr>
	<tr>
		
		<td> <label for="sexoContainer"><fmt:message key="sexo" /></label></td>
		<td>
			<div id="sexoContainer" style="display: flex;">
				<c:choose>
					<c:when test="${cliente.sexo == 'F'}">
						<input type="radio" id="masculino" name="sexo" value="M">
						<label for="masculino"><fmt:message key="masculino" /></label><br>
						<input type="radio" id="feminino" name="sexo" value="F" required checked>
						<label for="feminino"><fmt:message key="feminino" /></label><br>
					</c:when>
					<c:otherwise>
						<input type="radio" id="masculino" name="sexo" value="M" required checked>
						<label for="masculino"><fmt:message key="masculino" /></label><br>
						<input type="radio" id="feminino" name="sexo" value="F">
						<label for="feminino"><fmt:message key="feminino" /></label><br>
					</c:otherwise>
				</c:choose>
			</div>
		</td>
		
		
		<!--
		<td><label for="sexo">Sexo</label></td>
		<td><input type="text" id="sexo" name="sexo" required value="${cliente.sexo}" /></td>
		-->
	</tr>
	<tr>
		<td><label for="telefone"><fmt:message key="telefone" /></label></td>
		<td><input type="tel" id="telefone" name="telefone" required maxlength="20" /></td>
	</tr>
	<tr>
		<td><label for="dataNascimento"><fmt:message key="data_nascimento" /></label></td>
		<td><input type="date" id="dataNascimento" name="dataNascimento" required /></td>
	</tr>

   	<tr>
   		<td colspan="2" align="center"><input type="submit" value=<fmt:message key="cadastrar" />></td>
   	</tr>
</table>
</fmt:bundle>
