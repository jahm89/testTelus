<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="JAHM">

    <title>Welcome to donate</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/home.css" rel="stylesheet">

</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
       
        <div class="row">
       		
       		<div class="col-sm-8">
       			<h2>Welcome ${donor.name} ${donor.surname} </h2>
       		</div>
       		
       		<div class="col-sm-1 col-sm-offset-3">
				<button class="btn btn-primary logout" onclick="document.forms['logoutForm'].submit()">Logout</button>	
			</div>
       	</div>
       	
       	<br>
       	<br>
       	
       	<div class="row">
       		<div class="col-sm-3">
       			<h5>This is your history donations</h5>
       		</div>
       		<div class="col-sm-2 col-sm-offset-7">
       			<a href="${contextPath}/donate">
       				<button class="btn btn-success donate">Do new donate</button>
       			</a>
       		</div>
       	</div>
        
        <table class="table table-responsive table-hover">
        	<thead>
        		<tr>
        			<th>Institution</th>
        			<th>Country</th>
        			<th>Amount</th>
        			<th>Date</th>
        		</tr>
        	</thead>
        	<tbody>
        	<c:forEach items="${list}" var="donation">
        		<tr>
					<td><c:out value="${donation.idInstitution.name}" /></td>
					<td><c:out value="${donation.idInstitution.idDepartment.idCountry.name}" /></td>
					<td><c:out value="${donation.amount}" /></td>
					<td><c:out value="${donation.date}" /></td>
        		</tr>
        	</c:forEach>
        	</tbody>
        </table>
        
		
    </c:if>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
