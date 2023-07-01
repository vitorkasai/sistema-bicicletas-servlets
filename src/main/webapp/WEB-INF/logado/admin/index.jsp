<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #282a36;
            margin: 0;
            padding: 20px;
            color: #f8f8f2;
        }

        h1 {
            color: #bd93f9;
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
            color: #f8f8f2;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #bd93f9;
            border-radius: 4px;
        }

        a:hover {
            background-color: #44475a;
        }

        .logout-button {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
    <title>Menu do Sistema</title>
    
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
