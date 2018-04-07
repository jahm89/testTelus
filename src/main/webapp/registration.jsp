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
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container">

		<form:form method="POST" modelAttribute="userForm" class="form-signin"
			id="formReg">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="form-signin-heading">Create your account</h4>
				</div>
				<div class="panel-body">
					<spring:bind path="username">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="username" class="form-control"
								placeholder="Username" autofocus="true" id="username"
								required="true"></form:input>
							<form:errors path="username"></form:errors>
						</div>
					</spring:bind>

					<spring:bind path="password">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="password" path="password" class="form-control"
								placeholder="Password" id="password" required="true"></form:input>
							<form:errors path="password"></form:errors>
						</div>
					</spring:bind>

					<spring:bind path="passwordConfirm">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="password" path="passwordConfirm"
								class="form-control" placeholder="Confirm your password"
								id="confirm" required="true"></form:input>
							<form:errors path="passwordConfirm"></form:errors>
						</div>
					</spring:bind>

					<spring:bind path="name">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="name" class="form-control"
								placeholder="Names" id="name" required="true"></form:input>

						</div>
					</spring:bind>

					<spring:bind path="surname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="surname" class="form-control"
								placeholder="Surnames" id="surname" required="true"></form:input>

						</div>
					</spring:bind>

					<spring:bind path="idDocument">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="idDocument" class="form-control"
								placeholder="ID document" id="document" required="true"></form:input>

						</div>
					</spring:bind>
					<div class="page-header">
						<h5>Enter your method to donate</h5>
						<small>You donation is only by credit card</small>
					</div>

					<spring:bind path="number">
						<div class="form-group">
							<label>Credit card number</label>
							<form:input type="text" class="form-control"
								placeholder="0000-0000-0000-0000" name="credit_card"
								id="credit_card" path="number"></form:input>
						</div>
					</spring:bind>

					<spring:bind path="date">
						<div class="form-group">
							<label>Date expiration</label> 
							<form:input path="date" type="text" class="form-control" placeholder="MM/YY" name="date" id="date"></form:input>
						</div>
					</spring:bind>

					<spring:bind path="pin">
						<div class="form-group">
							<label>Pin</label>
							<form:input type="text" class="form-control" placeholder="000" id="pin" path="pin"></form:input>
						</div>
					</spring:bind>
				</div>
			</div>



			<button type="submit" id="save" hidden></button>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				id="submit">Submit</button>
		</form:form>

	</div>
	<!-- /container -->
	<script src="${contextPath}/resources/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.mask.min.js"></script>

	<script>
		(function() {

			$('#credit_card').mask('0000-0000-0000-0000');
			$('#date').mask('00/00');
			$('#pin').mask('000');
			$('#document').mask('000000000');

			$('#submit')
					.click(
							function() {

								var flag = false;

								if ($("#password").val() !== $("#confirm")
										.val()) {
									alert("Las contraseņas no coinciden");
									return;
								}

								$('input').each(
										function(index, element) {

											if ($(element).val() == undefined
													|| $(element).val() == "") {
												flag = true;
											}

										});

								if (flag)
									alert("Debe llenar todos los campos son requeridos");
								else
									$("#save").click();

							});

		})();
	</script>

</body>
</html>
