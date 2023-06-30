<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
    <head>
        <title>Gerenciamento de locações de um cliente</title>
    </head>

    <body>
        <% System.out.println("PASSEI POR: WEB-INF/locacao/formulario.jsp"); %> 
        <div align="center">
            <h1>Gerenciamento de clientes</h1>
            <h2>
                <a href="lista">Lista de Clientes</a>
            </h2>
        </div>
        <div align="center">
            <form action="insercao" method="post" id="formulario">
                <table border="1">
                    <caption>Cadastro</caption>
                    <tr>
                        <td><label for="locadora">Locadora:</label></td>
                        <td>
                            <c:set var="listaLocadoras" value="${sessionScope.listaLocadoras}" />
                            <select id="locadoraSelect" name="locadoraId" required>
                                <option value="" selected disabled>Selecione uma locadora</option>
                                <c:forEach items="${listaLocadoras}" var="locadora">
                                    <option value="${locadora.id}">${locadora.nome}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="dataLocacao">Data</label></td>
                        <td><input type="date" id="dataLocacao" name="dataLocacao" required value="${locacao.dia}" /></td>
                    </tr>
                    
                    <tr>
                        <td><label for="hora">Hora</label></td>
                        <td><input type="time" id="horario" name="horario" step="3600" required /></td>
                    </tr>
                    
                    <tr>
                        <!-- Substituir o value depois por <fmt:message key="save" /> /> -->
                        <td colspan="2" align="center"><input type="submit" value="Enviar"></td>
                    </tr>
                </table>
            </form>
        </div>

        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>

        <script>
          document.getElementById('locadoraSelect').addEventListener('change', function() {
            var locadoraSelect = document.getElementById('locadoraSelect');
            
            // Remover a opção "Escolha uma locadora" quando uma opção válida for selecionada
            if (locadoraSelect.value !== '') {
              var escolhaOption = document.querySelector('#locadoraSelect option[value=""]');
              escolhaOption.disabled = true;
              escolhaOption.style.display = 'none';
            }
          });
        </script>
        
    </body>
</html>
