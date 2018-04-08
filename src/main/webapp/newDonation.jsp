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

<link href="${contextPath}/resources/css/bootstrap.min.css"	rel="stylesheet">
<link href="${contextPath}/resources/css/home.css" rel="stylesheet">
<link href="${contextPath}/resources/css/chosen.min.css" rel="stylesheet">
</head>

<body>
	
	<jsp:include page="parts/header.jsp"></jsp:include>
	
	<div class="container">

		

		<div class="row">
			<div class="col-sm-8">
				<p>We have grateful for your donations, we hope that this new donation will help us to help another people</p>
				<small>We remember that you can donate only once at month at the institutions from the same country</small> 
			</div>
			<div class="col-sm-1 col-sm-offset-3">
       			<a href="${contextPath}/home">
       				<button class="btn btn-info left-padding">Go back</button>
       			</a>
       		</div>
		</div>

		<br>
		<br>
		<br>

		<div class="row">

			
				<div class="col-sm-6 col-sm-offset-3">
					<div class="panel panel-default">
						<div class="panel-body">

							<div class="form-group">
								<label>Institution</label> 
								<select class="form-control"	id="institution">
									<option value="0">Select...</option>
									<c:forEach items="${institutions}" var="institution">
										<option value="<c:out value="${institution.id}"/>"><c:out
												value="(${institution.idDepartment.idCountry.name})  ${institution.name}" /></option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group">
								<input type="hidden" id="idDonor" value="<c:out value="${donor.id}"/>">
								
								<label>Credit card to payment</label> <input readonly="readonly" class="form-control" id="credit_card"	value="<c:out value="${card.number}"/>" />
							</div>

							<div class="form-group">
								<label>Amount</label> <input class="form-control" name="amount" id="amount" />
							</div>
							
							<div class="alert alert-danger" role="alert" id="responseD" style="display: none;">
								
							</div>
							
							<div class="alert alert-success" role="alert" id="responseE" style="display: none;">
								
							</div>
							
							
							<div class="form-group">
								<button class="btn btn-success right" id="saveDonation">Send donation</button>
							</div>
						</div>
					</div>
				</div>
			

		</div>

	</div>
	
	<jsp:include page="parts/header.jsp"></jsp:include>
	<!-- /container -->
	<script src="${contextPath}/resources/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/chosen.jquery.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.mask.min.js"></script>

	<script>
		(function() {
			
			
			$.ajaxSetup({
			    async: true,
			    beforeSend: function (xhr) {
			        var token = $("input[name='_csrf']").val();
			        var header = $("input[name='_csrf_header']").val();
			        xhr.setRequestHeader(header, token);
			    }
			});
			
			$('#institution').chosen();
			$('#credit_card').mask('0000-0000-0000-0000');
			$('#amount').mask('000.000.000.000.000.00', {reverse : true});

			$('#saveDonation').click(
					function() {

						var flag = false;

						if ($('#institution').val() == 0) {
							alert("Select institution");
							return false;
						}

						$('input:not(.chosen-search-input)').each(
								function(index, element) {

									if ($(element).val() == undefined
											|| $(element).val() == "") {
										flag = true;
										console.warn($(element));
									}

								});

						if (flag)
							alert("Fill all fields");
						else {
							
							var data = {};
							data['amount'] = $('#amount').val() * 1;
							data['idDonor'] = $('#idDonor').val() * 1;
							data['idInstitution'] = $('#institution').val() * 1;
							var  url = "${contextPath}"+"/savedonate";
							
							$.ajax({	
								
									url: url,
									type: "POST",
									dataType: "json",
									data: data
								
							})
							.done(function(response){
								
								if(response.status == "ERROR"){
									
									
									$('#responseD').html(response.message);
									$('#responseD').fadeIn("slow" );
									
									setTimeout(function(){
										$('#responseD').fadeOut();
									}, 5000);
									
								}
								else{
									$('#responseE').html(response.message);
									$('#responseE').fadeIn("slow" );
									
									setTimeout(function(){
										$('#responseE').fadeOut();
									}, 5000);
								}
								
							});

						}

					});

		})();
	</script>

</body>
</html>
