<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu do Sistema</title>
    </head>
    <body>
        <% System.out.println("PASSEI POR: WEB-INF/logado/admin/index.jsp"); %>
        <h1>Página do Administrador</h1>
        <p>Olá ${sessionScope.usuarioLogado.nome}</p>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
            </li>
            <li>
                <a href="locadoras">CRUD LOCADORAS </a>
            </li>
            <li>
                <a href="clientes">CRUD CLIENTES </a>
            </li>
        </ul>
    </body>
</html>
