<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: cadastroUsuario/locadora/campos.jsp"); %> 

<fmt:bundle basename="messages">
<table border="1">
	<caption>
		<fmt:message key="cadastro" />
	</caption>
   	<tr>
   		<td><label for="email"><fmt:message key="email" /></label></td>
   		<td>
			<input type="email" id="email" name="email" size="45"
   			required maxlength="256"/>
			<c:if test="${mensagemErro == 'O email já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_email" />
				</div>
			</c:if>
		</td>
   	</tr>
   	<tr>
   		<td><label for="senha"><fmt:message key="senha" /></label></td>
   		<td><input type="password" id="senha" name="senha" size="45" required maxlength="256" /></td>
   	</tr>
	<tr>
		<td><label for="nome"><fmt:message key="nome" /></label></td>
		<td><input type="text" id="nome" name="nome" size="45" required maxlength="256" /></td>
	</tr>
	<tr>
		<td><label for="cnpj"><fmt:message key="CNPJ" /></label></td>
		<td>
			<input type="text" id="cnpj" name="cnpj" size="45" required maxlength="14" />
			<c:if test="${mensagemErro == 'O CNPJ já está em uso.'}">
				<div class="error-message"><fmt:message key="erro_CNPJ" /></div>
			</c:if>
		</td>
	</tr>
	<tr>
		<td><label for="cidade"><fmt:message key="cidade" /></label></td>
		<td>
            <select id="cidade" name="cidade" required>
                <option value="" selected disabled><fmt:message key="selecionar_cidade" /></option>
            </select>
	
		</td>
	</tr>
	<script>
		window.addEventListener('DOMContentLoaded', function() {
			loadCidades();
		});
	
		function loadCidades() {
			var cidadeSelect = document.getElementById('cidade');		
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '${pageContext.request.contextPath}/documentos/cidades.txt', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					var cidades = xhr.responseText.split('\n');
                    for (var i = 0; i < cidades.length; i++) {
                        var option = document.createElement('option');
                        option.text = cidades[i];
                        cidadeSelect.add(option);
                    }
				}
			};
			xhr.send();
		}
	</script>
   	<tr>
   		<td colspan="2" align="center"><input type="submit" value=<fmt:message key="cadastrar" />></td>
   	</tr>
</table>
</fmt:bundle>
