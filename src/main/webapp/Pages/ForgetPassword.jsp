<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>ForgotPassword --PantriPick</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-color: #eee;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
}

.forgot {
	background-color: #fff;
	padding: 20px;
	border: 1px solid #dfdfdf;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.padding-bottom-3x {
	padding-bottom: 72px !important;
}

.card-footer {
	background-color: #fff;
	border-top: 1px solid #dfdfdf;
}

.btn {
	font-size: 14px;
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 4px rgba(0, 123, 255, 0.25);
}
</style>
</head>
<body oncontextmenu='return false'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8">
				<div class="forgot">
					<h2>Forgot your password?</h2>
					<p>Change your password in three easy steps. This will help you
						to secure your account!</p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium">1. </span>Enter
							your email address below.</li>
						<li><span class="text-primary text-medium">2. </span>Our
							system will send you an OTP to your email.</li>
						<li><span class="text-primary text-medium">3. </span>Enter
							the OTP on the next page.</li>
					</ol>
				</div>
				<form class="card mt-4" action="ForgotPassword" method="post">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">Enter your email address</label> <input
								class="form-control" type="email" name="email"
								id="email-for-pass" required> <small
								class="form-text text-muted">Enter your registered email
								address. We'll send an OTP to this address.</small>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-between">
						<button class="btn btn-success" type="submit">Get New
							Password</button>
						<a class="btn btn-danger" href="Login.jsp">Back to Login</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
</body>
</html>
