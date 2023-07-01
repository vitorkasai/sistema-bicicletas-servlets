<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: cadastroUsuario/locadora/campos.jsp"); %> 

<table border="1">
	<caption>
   		Cadastro
	</caption>
   	<tr>
   		<td><label for="email">Email</label></td>
   		<td><input type="email" id="email" name="email" size="45"
   			required maxlength="256"/></td>
   	</tr>
   	<tr>
   		<td><label for="senha">Senha</label></td>
   		<td><input type="password" id="senha" name="senha" size="45" required maxlength="256" /></td>
   	</tr>
	<tr>
		<td><label for="nome">Nome</label></td>
		<td><input type="text" id="nome" name="nome" size="45" required maxlength="256" /></td>
	</tr>
	<tr>
		<td><label for="cnpj">CNPJ</label></td>
		<td><input type="text" id="cnpj" name="cnpj" size="45" required maxlength="14" /></td>
	</tr>
	<tr>
		<td><label for="cidade">Cidade</label></td>
		<td>
            <select id="cidade" name="cidade" required>
                <option value="" selected disabled>Selecione uma cidade</option>
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
		<!-- Substituir value depois por <fmt:message key="save" /> / -->
   		<td colspan="2" align="center"><input type="submit" value="Cadastrar"></td>
   	</tr>
</table>

