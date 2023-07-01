<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
    <head>
        <title>Gerenciamento de locações de um cliente</title>
        <style>
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
