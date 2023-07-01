<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Autenticação de Usuário</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            color: #333;
            text-align: center;
        }

        #erro {
            background-color: #ffdddd;
            border: 1px solid #ff9999;
            color: #ff0000;
            padding: 10px;
            margin-bottom: 10px;
        }

        form {
            margin-top: 20px;
        }

        table {
            margin: 0 auto;
        }

        table th, table td {
            padding: 5px;
            text-align: left;
        }

        table th {
            background-color: #eee;
        }

        #selectCidade {
            margin-top: 20px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #locadorasTableContainer {
            margin-top: 20px;
            text-align: center;
        }

        #locadorasTable {
            width: 100%;
            border-collapse: collapse;
        }

        #locadorasTable caption {
            font-weight: bold;
            margin-bottom: 10px;
        }

        #locadorasTable th, #locadorasTable td {
            padding: 8px;
            border: 1px solid #ccc;
        }

        .login-container {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: fit-content;
            margin: 0 auto;
            text-align: left;
            margin-bottom: 20px;
        }

        .login-form {
            margin-bottom: 20px;
        }

        .login-form label {
            display: block;
            margin-bottom: 8px;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .login-form input[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 16px;
            cursor: pointer;
        }

        .login-form input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<% System.out.println("PASSEI POR: login.jsp"); %>
<h1>Bem vindo ao Sistema de Locação de Bicicletas!!</h1>
<h2>Login</h2>
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
    <form class="login-form" method="post" action="index.jsp">
        <label for="login">Login:</label>
        <input type="text" name="login" id="login" value="${param.login}"/>
        <label for="senha">Senha:</label>
        <input type="password" name="senha" id="senha"/>
        <input type="submit" name="bOK" value="Entrar"/>
    </form>
</div>
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

<div id="locadorasTableContainer">
    <table id="locadorasTable">
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
    document.addEventListener('DOMContentLoaded', function () {
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
</script>
</body>
</html>
