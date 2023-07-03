<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
    <fmt:bundle basename="messages">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="autenticacao" /></title>

        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #282a36;
                color: #f8f8f2;
                margin: 0;
                padding: 20px;
            }

            h1 {
                color: #bd93f9;
                text-align: center;
            }

            #erro {
                background-color: #ff5555;
                border: 1px solid #ff5555;
                color: #f8f8f2;
                margin: 10px auto;
                padding: 10px;
                padding-inline-start: 0px;
                list-style-type: none;
            }

            #erro li {
                margin-bottom: 5px;
            }
        </style>

    </head>
    <body>
        <% System.out.println("PASSEI POR: noAuth.jsp"); %>
        <h1><fmt:message key="autenticacao" /></h1>
        <c:if test="${mensagens.existeErros}">
            <div id="erro">
                <ul>
                    <c:forEach var="erro" items="${mensagens.erros}">
                        <li> ${erro} </li>
                        </c:forEach>
                </ul>
            </div>
        </c:if>
    </body>
</fmt:bundle>
</html>