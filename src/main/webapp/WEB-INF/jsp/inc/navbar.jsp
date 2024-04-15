<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav
	class="navbar  navbar-expand-lg navbar-dark bg-dark  text-left-md text-left-sm"
	id="navbar">
	<div class="container">
		<div class="container-fluid">
			<a class="navbar-brand " href="/helpdesk/dashboard"> 
			<img
				src="<c:url value='/resources/icon/logo.svg'/>" alt="Logo" height=100   class="d-inline-block align-text-top color-white">
			</a>
		</div>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ms-auto">
				<c:if
					test="${not empty userType and (userType eq 'admin' or userType eq 'agent')}">
					<li class="nav-item btn"><a class="nav-link active"
						aria-current="page" href="/helpdesk/dashboard">Dashboard</a></li>
					<li class="nav-item btn"><a class="nav-link"
						aria-current="page" href="/helpdesk/dashboard/ticket">Ticket</a></li>
					<c:if test="${not empty userType and userType eq 'admin'}">
						<li class="nav-item btn"><a class="nav-link" href="#">Department</a></li>
						<li class="nav-item btn"><a class="nav-link" href="#">Users</a></li>
					</c:if>
				</c:if>
				<li class="nav-item btn"><a class="nav-link"
					href="/helpdesk/about">About</a></li>
				<c:if
					test="${not empty userType and (userType eq 'admin' or userType eq 'agent')}">
					<li class="nav-item btn "><a class="btn btn-outline-danger"
						href="/helpdesk/logout">Logout</a></li>

				</c:if>


			</ul>
		</div>
	</div>
</nav>