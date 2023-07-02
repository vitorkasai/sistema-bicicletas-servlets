<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<fmt:bundle basename="messages">
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
    <title><fmt:message key="menu_sistema" /></title>
    
</head>
<body>
<% System.out.println("PASSEI POR: WEB-INF/logado/admin/index.jsp"); %>
<h1><fmt:message key="pagina_administrador" /></h1>
<p><fmt:message key="ola" /> ${sessionScope.usuarioLogado.nome}, <fmt:message key="frase_permissao" />:</p>
<ul>
    <li>
        <a href="locadoras"><fmt:message key="crud_locadoras" /></a>
    </li>
    <li>
        <a href="clientes"><fmt:message key="crud_clientes" /></a>
    </li>
</ul>
<div class="logout-button">
    <h2><fmt:message key="desconectar" /></h2>
    <a href="${pageContext.request.contextPath}/logout.jsp"><fmt:message key="sair" /></a>
</div>
</body>
</fmt:bundle>
</html>
