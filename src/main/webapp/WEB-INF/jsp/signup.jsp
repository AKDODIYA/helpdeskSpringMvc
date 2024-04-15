<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
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
				class="row d-flex justify-content-center align-items-center w-100">
				<div class="w-100 text-center">
					<form:form class="bg-dark text-white p-4 rounded-3"
						style="border-radius: 1rem;" method="post" modelAttribute="user">
						<div class="text-center mb-4">
							<h2 class="fw-bold mb-2 text-uppercase">Sign-up</h2>
							<p class="text-white-50 mb-2">Please enter your details!</p>
							<c:if test="${message eq 'agent'}">
								<p class="text-success mb-5">User registration Sucessfull</p>
							</c:if>
							<c:if test="${not empty message && message ne 'agent'}">
								<p class="text-danger mb-5">User registration fail</p>
							</c:if>
						</div>

						<div class="row">
							<div class="col-12 mb-3">
								<form:input type="text" path="login.username" id="username"
									class="form-control" required="true" />
								<label for="firstName" class="form-label">Username</label>
							</div>
							<form:hidden path="login.userType" value="agent"></form:hidden>
							<form:hidden path="userType" value="agent"></form:hidden>

							<div class="col-md-6 mb-3">
								<form:input type="text" path="firstName" id="firstName"
									class="form-control" required="true" />
								<label for="firstName" class="form-label">First Name</label>
							</div>
							<div class="col-md-6 mb-3">
								<form:input type="text" path="lastName" id="lastName"
									class="form-control" required="true" />
								<label for="lastName" class="form-label">Last Name</label>
							</div>
							<div class="col-md-6 mb-3">
								<form:input type="text" path="email" id="Email"
									class="form-control" required="true" />
								<label for="email" class="form-label">Email</label>
							</div>
							<div class="col-md-6 mb-3">
								<form:input type="number" path="phone" id="Phone"
									class="form-control" required="true" />
								<label for="phone" class="form-label">Phone</label>
							</div>
							<div class="col-md-6 mb-3">
								<form:input type="password" path="login.password" id="firstName"
									class="form-control" required="true" />
								<label for="password" class="form-label">Password</label>
							</div>

							<div class="col-6 mb-3">
								<form:input type="text" path="address.addressLine1"
									id="addressLine1" class="form-control" required="true" />
								<label for="addressLine1" class="form-label">Address
									Line 1</label>
							</div>
							<div class="col-6 mb-3">
								<form:input type="text" path="address.addressLine2"
									id="addressLine2" class="form-control" />
								<label for="addressLine2" class="form-label">Address
									Line 2</label>
							</div>
							<div class="col-md-6 mb-3">
								<form:input type="text" path="address.city" id="city"
									class="form-control" required="true" />
								<label for="city" class="form-label">City</label>
							</div>
							<div class="col-md-6 mb-3">
								<form:select path="address.state" id="userType"
									class="form-control" required="true">
									<form:options items="${usStates}" path="address.state" />
								</form:select>
								<label for="state" class="form-label">State</label>

							</div>
							<div class="col-md-6 mb-3">
								<form:input type="text" path="address.zip" id="zip"
									class="form-control" required="true" />
								<label for="zip" class="form-label">Zip Code</label>
							</div>
						</div>

						<div class="text-center mt-4 mb-5">
							<button class="btn btn-outline-light btn-lg px-5" type="submit">Sign
								Up</button>
						</div>

						<div class="text-center mt-3 mb-5">
							<p class="mb-0 text-white-50">
								Already have an account? <a href="/helpdesk/login"
									class="text-white fw-bold">Sign In</a>
							</p>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
