<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<form id="logoutForm" method="POST" action="${contextPath}/logout">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>

<div class="row">

	<div class="col-sm-8">
		<h2>Welcome ${donor.name} ${donor.surname}</h2>
	</div>

	<div class="col-sm-1 col-sm-offset-3">
		<button class="btn btn-primary logout"
			onclick="document.forms['logoutForm'].submit()">Logout</button>
	</div>
</div>

<br>
<br>