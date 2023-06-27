<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: WEB-INF/locadora/campos.jsp"); %> 
<fmt:bundle basename="messages">
<table border="1">
	<caption>
   		<c:choose>
   			<c:when test="${locadora != null}">
				<fmt:message key="edit" />
                           </c:when>
   			<c:otherwise>
				<fmt:message key="registration" />
                           </c:otherwise>
   		</c:choose>
	</caption>
 	<c:if test="${locadora != null}">
   		<input type="hidden" name="id" value="${locadora.id}" />
   	</c:if>
   	<tr>
   		<td><label for="cnpj">CNPJ</label></td>
   		<td><input type="text" id="cnpj" name="cnpj" size="45"
   			required value="${locadora.CNPJ}" maxlength="18"/></td>
   	</tr>
   	<tr>
   		<td><label for="nome"><fmt:message key="name" /></label></td>
   		<td><input type="text" id="nome" name="nome" size="45" required
   			value="${locadora.nome}" maxlength="256" /></td>
   	</tr>
   	<tr>
   		<td colspan="2" align="center"><input type="submit" value=<fmt:message key="save" /> /></td>
   	</tr>
</table>
</fmt:bundle>
