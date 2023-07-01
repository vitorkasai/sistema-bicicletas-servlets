<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value="/login.css" />">

    <title>Autenticação de Usuário</title>
    
</head>
<body>
<% System.out.println("PASSEI POR: login.jsp"); %>
<h1>Bem vindo(a) ao Sistema de Locação de Bicicletas!</h1>

<c:if test="${mensagens.existeErros}">
    <div id="erro">
        <ul>
            <c:forEach var="erro" items="${mensagens.erros}">
                <li> ${erro} </li>
            </c:forEach>
        </ul>
    </div>
</c:if>

<div class="login-container">
    <i class="fas fa-user fa-3x"></i>
    <h2>Entrar</h2>
    <form class="login-form" method="post" action="index.jsp">
        <label for="login"></label>
        <input type="text" name="login" id="login" value="${param.login}" placeholder="Email"/>
        <label for="senha"></label>
        <input type="password" name="senha" id="senha" placeholder="Senha"/>
        <input type="submit" name="bOK" value="Login" id="logar"/>
    </form>
    <div id="linksCadastroContainer">
        <!--Mudar o acesso para passar primeiro pelo controlador de cadastro de novos clientes/locadoras-->
        <a href="${pageContext.request.contextPath}/registrar-cliente">Cadastre-se como cliente</a>
        <a href="${pageContext.request.contextPath}/registrar-locadora">Cadastre-se como locadora</a>

    </div>
</div>

<h2 id="listaLocadorasTitulo">Lista de locadoras</h2>
<select name="selectCidade" id="selectCidade">
    <option value="vazio" selected style="background-color: gray;">Selecione uma cidade</option>
</select>
<div id="locadorasTableContainer">
    <table id="locadorasTable">
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
    document.addEventListener('DOMContentLoaded', function () {
            loadCidades();

        var selectCidade = document.getElementById('selectCidade');

        selectCidade.addEventListener('change', function () {
            var cidadeSelecionada = selectCidade.value;
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var locadorasTableContainer = document.getElementById('locadorasTableContainer');
                    locadorasTableContainer.innerHTML = xhr.responseText;
                }
            };

            xhr.open('GET', 'filtrarLocadoras.jsp?cidadeSelecionada=' + cidadeSelecionada, true);
            xhr.send();
        });
    });

    function loadCidades() {
        var cidadeSelect = document.getElementById('selectCidade');
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '${pageContext.request.contextPath}/documentos/cidades.txt', true); // Substitua 'cidades.txt' pelo caminho correto do seu arquivo .txt de cidades
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
</body>
</html>
