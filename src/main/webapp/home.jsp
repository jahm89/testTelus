<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/datatables.min.css"/>


</head>
<body>
<jsp:include page="parts/header.jsp"></jsp:include>
<div class="container">

  		<div class="row">
       		<div class="col-sm-4 col-sm-offset-8">
       			<div class="alert alert-success" role="alert">       			
       				<h2 class="text-right donate">VISITS TODAY ${counter}</h2>
       			</div>
       		</div>
       	</div>
       	
       	<div class="row">
       		<div class="col-sm-8">
       			<h3>This is your  donations records</h3>
       		</div>
       		<div class="col-sm-2 col-sm-offset-2">
       			<a href="${contextPath}/donate">
       				<button class="btn btn-success donate">Do new donate</button>
       			</a>
       		</div>
       	</div>
       	
       	<br>
       	
        
        <table class="table table-responsive table-hover" id="tableDonations">
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
					<td>$ <fmt:formatNumber value="${donation.amount}" type="currency" currencySymbol=""/></td>
					<td><c:out value="${donation.date}" /></td>
        		</tr>
        	</c:forEach>
        	</tbody>
        </table>
        

</div>
<jsp:include page="parts/footer.jsp"></jsp:include>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/datatables.min.js"></script>

<script>
$(document).ready( function () {
    $('#tableDonations').DataTable();
} );
</script>

</body>
</html>
