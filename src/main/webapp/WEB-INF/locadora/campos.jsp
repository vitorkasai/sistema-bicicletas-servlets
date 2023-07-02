<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: WEB-INF/locadora/campos.jsp"); %> 

<fmt:bundle basename="messages">
<table border="1">
	<caption>
   		<c:choose>
   			<c:when test="${locadora != null}">
				<fmt:message key="edicao" />
            </c:when>
   			<c:otherwise>
				<fmt:message key="cadastro" />
            </c:otherwise>
   		</c:choose>
	</caption>
 	<c:if test="${locadora != null}">
   		<input type="hidden" name="id" value="${locadora.id}" />
   	</c:if>
   	<tr>
   		<td><label for="email"><fmt:message key="email" /></label></td>
   		<td>
			<input type="email" id="email" name="email" size="45"
   			required value="${locadora.email}" maxlength="256"/>
			<c:if test="${mensagemErro == 'O email já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_email" /></div>
			</c:if>
		</td>
   	</tr>
   	<tr>
   		<td><label for="senha"><fmt:message key="senha" /></label></td>
   		<td><input type="text" id="senha" name="senha" size="45" required
   			value="${locadora.senha}" maxlength="256" /></td>
   	</tr>
	<tr>
		<td><label for="nome"><fmt:message key="nome" /></label></td>
		<td><input type="text" id="nome" name="nome" size="45" required
			value="${locadora.nome}" maxlength="256" /></td>
	</tr>
	<tr>
		<td><label for="cnpj"><fmt:message key="CNPJ" /></label></td>
		<td>
			<input type="text" id="cnpj" name="cnpj" size="45" required
			value="${locadora.CNPJ}" maxlength="14" />
			<c:if test="${mensagemErro == 'O CNPJ já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_CNPJ" /></div>
			</c:if>
		</td>
	</tr>
	<tr>
		<td><label for="cidade"><fmt:message key="cidade" /></label></td>
		<td>
			<c:choose>
				<c:when test="${locadora.cidade != null}">
					<input type="hidden" name="cidadeAtual" id="cidadeAtual" value="${locadora.cidade}">
					<select id="cidade" name="cidade" required></select>
				</c:when>
				<c:otherwise>
					<select id="cidade" name="cidade" required>
						<option value="" selected disabled><fmt:message key="selecionar_cidade" /></option>
					</select>
				</c:otherwise>
			</c:choose>
	
		</td>
	</tr>
	<tr>
		<td>
			<c:choose>
				<c:when test="${locadora.administrador == '1'}">
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
	<script>
		window.addEventListener('DOMContentLoaded', function() {
			loadCidades();
		});
	
		function loadCidades() {
			var cidadeSelect = document.getElementById('cidade');
			var cidadeAtualSelect = document.getElementById('cidadeAtual');
			if (cidadeAtualSelect != null) {
				var cidadeAtual = cidadeAtualSelect.value;
			}
			
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '${pageContext.request.contextPath}/documentos/cidades.txt', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					var cidades = xhr.responseText.split('\n');
					// Edição de uma locadora já existente (marca como selecionada a cidade correspondente)		
					if (cidadeAtualSelect != null) {
						for (var i = 0; i < cidades.length; i++) {
							var option = document.createElement('option');
							option.text = cidades[i];
							cidadeSelect.add(option);
							if (cidades[i] == cidadeAtual) {
								option.selected = true;
							}
						}
					}
					// Adicionando locadora nova (padrão "Selecione uma cidade" selecionado)
					else {
						for (var i = 0; i < cidades.length; i++) {
							var option = document.createElement('option');
							option.text = cidades[i];
							cidadeSelect.add(option);
						}
					}
					
				}
			};
			xhr.send();
		}
	</script>
   	<tr>
   		<td colspan="2" align="center"><input type="submit" value=<fmt:message key="salvar" />></td>
   	</tr>
</table>
</fmt:bundle>
