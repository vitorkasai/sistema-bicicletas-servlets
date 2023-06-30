<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autenticação de Usuário</title>
        <link href="${pageContext.request.contextPath}/layout.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% System.out.println("PASSEI POR: login.jsp"); %> 
        <h1>Autenticação de Usuário</h1>
        <c:if test="${mensagens.existeErros}">
            <div id="erro">
                <ul>
                    <c:forEach var="erro" items="${mensagens.erros}">
                        <li> ${erro} </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <form method="post" action="index.jsp">
            <table>
                <tr>
                    <th>Login: </th>
                    <td><input type="text" name="login"
                               value="${param.login}"/></td>
                </tr>
                <tr>
                    <th>Senha: </th>
                    <td><input type="password" name="senha" /></td>
                </tr>
                <tr>
                    <td colspan="2"> 
                        <input type="submit" name="bOK" value="Entrar"/>
                    </td>
                </tr>
            </table>
        </form>
        <label for="selectCidade">Cidade: </label>
        <select name="selectCidade" id="selectCidade">
            <option value="vazio" selected style="background-color: gray;">Selecione uma cidade</option>
            <option value="São Carlos">São Carlos</option>
            <option value="Lins">Lins</option>
            <option value="Ribeirão Preto">Ribeirão Preto</option>
            <option value="São Paulo">São Paulo</option>
            <option value="Araras">Araras</option>
            <option value="Sorocaba">Sorocaba</option>
        </select>

        <div id="locadorasTableContainer" align="center">
            <table id="locadorasTable" border="1">
                <caption>Lista de Locadoras</caption>
                <tr>
                    <th>Nome</th>
                    <th>Cidade</th>
                </tr>
                <!-- Popule a tabela com todas as locadoras inicialmente -->
                <c:forEach var="locadora" items="${sessionScope.listaLocadoras}">
                    <tr>
                        <td>${locadora.nome}</td>
                        <td>${locadora.cidade}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var selectCidade = document.getElementById('selectCidade');
                
                selectCidade.addEventListener('change', function() {
                    var cidadeSelecionada = selectCidade.value;
                    var xhr = new XMLHttpRequest();
                    
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            var locadorasTableContainer = document.getElementById('locadorasTableContainer');
                            locadorasTableContainer.innerHTML = xhr.responseText;
                        }
                    };
                    
                    xhr.open('GET', 'filtrarLocadoras.jsp?cidadeSelecionada=' + cidadeSelecionada, true);
                    xhr.send();
                });
            });
        </script>
    </body>
</html>
