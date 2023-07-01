<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menu do Sistema</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        p {
            text-align: center;
        }

        ul {
            margin-top: 20px;
            list-style-type: none;
            padding: 0;
            text-align: center;
        }

        li {
            display: inline-block;
            margin-right: 10px;
        }

        a {
            color: #333;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        a:hover {
            background-color: #eee;
        }

        .logout-button {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<% System.out.println("PASSEI POR: WEB-INF/logado/admin/index.jsp"); %>
<h1>Página do Administrador</h1>
<p>Olá ${sessionScope.usuarioLogado.nome}, você está logado como administrador e têm permissão operar os CRUDS abaixo:</p>
<ul>
    <li>
        <a href="locadoras">CRUD LOCADORAS</a>
    </li>
    <li>
        <a href="clientes">CRUD CLIENTES</a>
    </li>
</ul>
<div class="logout-button">
    <h2>Desconectar-se</h2>
    <a href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
</div>
</body>
</html>
