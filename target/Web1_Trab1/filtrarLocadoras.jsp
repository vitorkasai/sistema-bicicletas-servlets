<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:set var="minhaCidade" value="${param.cidadeSelecionada}" />

<% System.out.println("PASSEI POR: filtrarLocadoras.jsp"); %>

<fmt:bundle basename="messages">
<table id="locadorasTable" border="1">
    <tr>
        <th><fmt:message key="nome" /></th>
        <th><fmt:message key="cidade" /></th>
    </tr>
    <c:choose>
        <c:when test="${minhaCidade != 'vazio'}">
            <c:forEach var="locadora" items="${sessionScope.listaLocadoras}">
                <c:if test="${locadora.cidade eq minhaCidade}">
                    <tr>
                        <td>${locadora.nome}</td>
                        <td>${locadora.cidade}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <c:forEach var="locadora" items="${sessionScope.listaLocadoras}">
                <tr>
                    <td>${locadora.nome}</td>
                    <td>${locadora.cidade}</td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    
</table>
</fmt:bundle>
