<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: WEB-INF/cliente/campos.jsp"); %> 

<fmt:bundle basename="messages">
<table border="1">
	<caption>
   		<c:choose>
   			<c:when test="${cliente != null}">
				<fmt:message key="edicao" />
                           </c:when>
   			<c:otherwise>
				<fmt:message key="cadastro" />
                           </c:otherwise>
   		</c:choose>
	</caption>
 	<c:if test="${cliente != null}">
   		<input type="hidden" name="id" value="${cliente.id}" />
   	</c:if>
   	<tr>
   		<td><label for="email"><fmt:message key="email" /></label></td>
   		<td>
			<input type="email" id="email" name="email" size="45"
   			required value="${cliente.email}" maxlength="256" />
			<c:if test="${mensagemErro == 'O email já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_email" /></div>
			</c:if>
		</td>
		
   	</tr>
   	<tr>
   		<td><label for="senha"><fmt:message key="senha" /></label></td>
   		<td><input type="text" id="senha" name="senha" size="45" required
   			value="${cliente.senha}" maxlength="256" /></td>
   	</tr>
	
   	<tr>
   		<td><label for="nome"><fmt:message key="nome" /></label></td>
   		<td><input type="text" id="nome" name="nome" required value="${cliente.nome}" /></td>
   	</tr>
   	<tr>
   		<td><label for="CPF"><fmt:message key="CPF" /></label></td>
   		<td>
			<input type="text" id="CPF" name="CPF" required value="${cliente.CPF}" maxlength="11" />
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
		<td><input type="tel" id="telefone" name="telefone" required value="${cliente.telefone}" maxlength="20" /></td>
	</tr>
	<tr>
		<td><label for="dataNascimento"><fmt:message key="data_nascimento" /></label></td>
		<td><input type="date" id="dataNascimento" name="dataNascimento" required value="${cliente.dataNascimento}" /></td>
	</tr>

	<tr>
		<td>
			<c:choose>
				<c:when test="${cliente.administrador == '1'}">
					<input type="checkbox" name="administrador" id="administrador" value="1" checked>
					<label for="administrador"><fmt:message key="adm" /></label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="administrador" id="administrador" value="1">
					<label for="administrador"><fmt:message key="adm" /></label>
				</c:otherwise>
			</c:choose>		
		</td>
	</tr>


   	<tr>
   		<td colspan="2" align="center"><input type="submit" value=<fmt:message key="salvar" />></td>
   	</tr>
</table>
</fmt:bundle>
