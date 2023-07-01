<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: cadastroUsuario/cliente/campos.jsp"); %> 

<table border="1">
	<caption>
   		Cadastro
	</caption>
   	<tr>
   		<td><label for="email">Email</label></td>
   		<td><input type="email" id="email" name="email" size="45"
   			required maxlength="256" /></td>
   	</tr>
   	<tr>
   		<td><label for="senha">Senha</label></td>
   		<td><input type="password" id="senha" name="senha" size="45" required maxlength="256" /></td>
   	</tr>
	
   	<tr>
   		<td><label for="nome">Nome</label></td>
   		<td><input type="text" id="nome" name="nome" required /></td>
   	</tr>
   	<tr>
   		<td><label for="CPF">CPF</label></td>
   		<td><input type="text" id="CPF" name="CPF" required maxlength="11" /></td>
   	</tr>
	<tr>
		
		<td> <label for="sexoContainer">Sexo</label></td>
		<td>
			<div id="sexoContainer" style="display: flex;">
				<c:choose>
					<c:when test="${cliente.sexo == 'F'}">
						<input type="radio" id="masculino" name="sexo" value="M">
						<label for="masculino">Masculino</label><br>
						<input type="radio" id="feminino" name="sexo" value="F" required checked>
						<label for="feminino">Feminino</label><br>
					</c:when>
					<c:otherwise>
						<input type="radio" id="masculino" name="sexo" value="M" required checked>
						<label for="masculino">Masculino</label><br>
						<input type="radio" id="feminino" name="sexo" value="F">
						<label for="feminino">Feminino</label><br>
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
		<td><label for="telefone">Telefone</label></td>
		<td><input type="tel" id="telefone" name="telefone" required maxlength="20" /></td>
	</tr>
	<tr>
		<td><label for="dataNascimento">Data de nascimento</label></td>
		<td><input type="date" id="dataNascimento" name="dataNascimento" required /></td>
	</tr>

   	<tr>
		<!-- Substituir o value depois por <fmt:message key="save" /> /> -->
   		<td colspan="2" align="center"><input type="submit" value="Enviar"></td>
   	</tr>
</table>

