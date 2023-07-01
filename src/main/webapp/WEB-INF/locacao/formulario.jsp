<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
    <head>
        <title>Gerenciamento de locações de um cliente</title>
        
        <style>
            body {
                background-color: #282a36;
                color: #f8f8f2;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
    
            h1 {
                color: #bd93f9;
            }
    
            h2 a {
                color: #8be9fd;
                text-decoration: none;
            }
    
            h2 a:hover {
                color: #50fa7b;
            }
    
            div.form-container {
                margin: 50px auto;
                max-width: 600px;
                padding: 20px;
                background-color: #44475a;
                border-radius: 5px;
            }
    
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #282a36;
                color: #f8f8f2;
                border: 1px solid #6272a4;
            }
    
            caption {
                font-size: 18px;
                font-weight: bold;
                padding: 10px;
            }
    
            th {
                background-color: #44475a;
                font-weight: bold;
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #6272a4;
            }
    
            td {
                padding: 10px;
                border-bottom: 1px solid #6272a4;
            }
    
            label {
                color: #f8f8f2;
                font-weight: bold;
            }
    
            input[type="date"],
            input[type="time"],
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #44475a;
                background-color: #282a36;
                color: #f8f8f2;
                border-radius: 5px;
            }
    
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #50fa7b;
                color: #282a36;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }
    
            ul.erro {
                list-style-type: none;
                padding: 0;
                margin-top: 20px;
                background-color: #ff5555;
                color: #282a36;
                border-radius: 5px;
            }
    
            ul.erro li {
                padding: 10px;
            }
    
            
            .horarioUsado {
                border: 1px solid red;
            }
            
            .horarioUsado::after {
                content: "Horário indisponível!"
            }
        </style>
        
    </head>

    <body>
        <% System.out.println("PASSEI POR: WEB-INF/locacao/formulario.jsp"); %> 
        <div align="center">
            <h1>Nova locação</h1>
            <h2>
                <a href="lista">Minha lista de Locações</a>
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
                        <c:choose>
                            <c:when test="${erroLocacao != 'Horário indisponível'}">
                                <td><label for="hora">Hora</label></td>
                                <td><input type="time" id="horario" name="horario" step="3600" required /></td>
                                <c:set var="erroLocacao" value="" scope="request" />
                            </c:when>
                            <c:otherwise>
                                <td><label for="hora">Hora</label></td>
                                <td><input type="time" id="horario" class="horarioUsado" name="horario" step="3600" required /></td>
                            </c:otherwise>
                        </c:choose>
                        
                        
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
            // Armazena os valores dos campos em variáveis
            var locadoraSelectValue = document.getElementById('locadoraSelect').value;
            var dataLocacaoValue = document.getElementById('dataLocacao').value;
            var horarioValue = document.getElementById('horario').value;
          // Verifica se eu já escolhi uma locadora para retirar a opção inválida  
          document.getElementById('locadoraSelect').addEventListener('change', function() {
            var locadoraSelect = document.getElementById('locadoraSelect');
            
            // Remover a opção "Escolha uma locadora" quando uma opção válida for selecionada
            if (locadoraSelect.value !== '') {
              var escolhaOption = document.querySelector('#locadoraSelect option[value=""]');
              escolhaOption.style.display = 'none';
            }
          });
            // Recoloca os valores nos campos do formulário após submissão mal sucedida
            document.addEventListener('DOMContentLoaded', function() {
                document.getElementById('locadoraSelect').value = locadoraSelectValue;
                document.getElementById('dataLocacao').value = dataLocacaoValue;
                document.getElementById('horario').value = horarioValue;
            });

        </script>
        
    </body>
</html>
