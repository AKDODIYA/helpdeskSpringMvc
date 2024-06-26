<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>

<body class="body">
	<jsp:include page="inc/navbar.jsp"></jsp:include>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<form:form class="mb-md-5 mt-md-4 pb-5" action="login"
								method="post" modelAttribute="Login">

								<h2 class="fw-bold mb-2 text-uppercase">Login</h2>
								<p class="text-white-50 mb-2">Please enter your login id and
									password!</p>
								<p class="text-danger mb-5">${message}</p>

								<div class="form-outline form-white mb-4">
									<form:input type="text" id="username" path="username"
										class="form-control form-control-lg" />
									<label class="form-label" for="username">Username</label>
								</div>

								<div class="form-outline form-white mb-4">
									<form:input type="password" id="password" path="password"
										class="form-control form-control-lg" />
									<label class="form-label" for="typePassword">Password</label>
								</div>


								<p class="small mb-5 pb-lg-2">
									<a class="text-white-50" href="/helpdesk/forgotpassword">Forgot
										password?</a>
								</p>

								<button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>

							</form:form>

							<div>
								<p class="mb-0">
									Don't have an account? <a href="/helpdesk/signup"
										class="text-white-50 fw-bold">Sign Up</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</body>


</html>