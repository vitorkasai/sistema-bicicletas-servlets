<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% System.out.println("PASSEI POR: WEB-INF/cliente/campos.jsp"); %> 
<fmt:bundle basename="messages">
<table border="1">
	<caption>
   		<c:choose>
   			<c:when test="${cliente != null}">
				<fmt:message key="edit" />
                           </c:when>
   			<c:otherwise>
				<fmt:message key="registration" />
                           </c:otherwise>
   		</c:choose>
	</caption>
 	<c:if test="${cliente != null}">
   		<input type="hidden" name="id" value="${cliente.id}" />
   	</c:if>
   	<tr>
   		<td><label for="email"><fmt:message key="title" /></label></td>
   		<td><input type="text" id="email" name="email" size="45"
   			required value="${cliente.email}" maxlength="256" /></td>
   	</tr>
   	<tr>
   		<td><label for="senha"><fmt:message key="author" /></label></td>
   		<td><input type="text" id="senha" name="senha" size="45" required
   			value="${cliente.senha}" maxlength="256" /></td>
   	</tr>
	<!--
	<tr>
		<td><label for="nome"><fmt:message key="publisher" /></label></td>
   		<td><select id="nome" name="nome">
   				<c:forEach items="${}" var="editora">
   					<option value="${editora.key}"
   						${livro.editora.nome==editora.value ? 'selected' : '' }>
   						${editora.value}</option>
   				</c:forEach>
   		</select></td>
	</tr>
	-->
 
   	<tr>
   		<td><label for="nome"><fmt:message key="year" /></label></td>
   		<td><input type="text" id="nome" name="nome" required value="${cliente.nome}" /></td>
   	</tr>
   	<tr>
   		<td><label for="CPF"><fmt:message key="price" /></label></td>
   		<td><input type="text" id="CPF" name="CPF" required value="${cliente.CPF}" /></td>
   	</tr>
   	<tr>
   		<td colspan="2" align="center"><input type="submit" value=<fmt:message key="save" /> /></td>
   	</tr>
</table>
</fmt:bundle>
