<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>New donation</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/home.css" rel="stylesheet">
<link href="${contextPath}/resources/css/chosen.min.css"
	rel="stylesheet">
</head>

<body>

	<div class="container">

		<jsp:include page="parts/header.jsp"></jsp:include>

		<div class="row">
			<p>We have grateful for your donations, we hope that this new
				donation will help us to help another people</p>
			<small>We remember that you can donate only once at month at
				the same institution</small>
		</div>

		<br>

		<div class="row">

			<div class="col-sm-6 col-sm-offset-3">
				<div class="panel panel-default">
					<div class="panel-body">
					
						<div class="form-group">
							<label>Institution</label> <select class="form-control"
								id="institution">
								<option value>Select...</option>
								<c:forEach items="${institutions}" var="institution">
									<option value="<c:out value="${institution.id}"/>"><c:out
											value="(${institution.idDepartment.idCountry.name})  ${institution.name}" /></option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label>Credit card to payment</label>
							<input readonly="readonly" class="form-control" id="credit_card" value="<c:out value="${card.number}"/>"/>
						</div>
						
						<div class="form-group">
							<label>Amount</label>
							<input class="form-control" id="amount" />
						</div>
						
						<div class="form-group">
							<button class="btn btn-success right">Send donation</button>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- /container -->
	<script src="${contextPath}/resources/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/chosen.jquery.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.mask.min.js"></script>
	
	<script>
		(function() {

			$('#institution').chosen();
			$('#credit_card').mask('0000-0000-0000-0000');
			$('#amount').mask('000.000.000.000.000.00', {reverse: true});


		})();
	</script>

</body>
</html>
