<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EnterOTPPage --PantriPick</title>

<!-- Bootstrap CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Bootstrap and jQuery JS -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
.form-gap {
	padding-top: 70px;
}
</style>
</head>
<body>
	<div class="form-gap"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<!-- Lock Icon -->
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<!-- Page Title -->
							<h2 class="text-center">Enter OTP</h2>

							<!-- Error Message -->
							<%
							if (request.getAttribute("message") != null) {
								out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
							}
							%>

							<!-- OTP Form -->
							<div class="panel-body">
								<form id="register-form" action="ValidateOtp" role="form"
									autocomplete="off" class="form" method="post">
									<!-- OTP Input -->
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-envelope color-blue"></i>
											</span> <input id="otp" name="otp" placeholder="Enter OTP"
												class="form-control" type="text" required>
										</div>
									</div>

									<!-- Submit Button -->
									<div class="form-group">
										<input name="recover-submit"
											class="btn btn-lg btn-primary btn-block"
											value="Reset Password" type="submit">
									</div>

									<!-- Hidden Token Field -->
									<input type="hidden" name="token" id="token" value="">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
