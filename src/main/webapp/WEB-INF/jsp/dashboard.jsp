<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Helpdesk</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/resources/font-awesome-4.7.0/css/font-awesome.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources//richtexteditor/rte_theme_default.css"/>">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<style type="text/css">
.form-bg {
	border-radius: 12px;
	background: #212529;
	box-shadow: inset 38px 38px 27px #1e2125, inset -38px -38px 27px #24292d;
}
</style>

</head>

<body class="body">
	<jsp:include page="inc/navbar.jsp"></jsp:include>
	<section class="h-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center w-100">
				<div class="w-100  ">
					<div
						class="bg-dark justify-content-center align-items-center w-100 "
						style="border-radius: 1rem; width: 100%;">
						<div class=" p-5 text-center">
							<div class="col-12 position-relative text-center">
								<button type="button"
									class="btn btn-outline-light position-absolute z-index-1"
									style="right: 0%;" id="refresh-data-btn" onclick="refresh()">Refresh-data</button>
								<h2 class="fw-bold text-white mb-2 text-uppercase">Tickets</h2>
								<p class="text-white-50 mb-5">Tickets data!</p>
							</div>

							<div class="col-12">
								<div class="mb-md-5 mt-md-4 pb-5 row">
									<div class="row col-12">
										<div
											class="col-4 d-flex align-items-center justify-content-center vw-70">
											<div
												class="card card-body bg-transparent text-success border-success mb-3 "
												style="border-radius: 50px">
												<p>
													<i class="fa fa-check-circle fa-5x" aria-hidden="true"></i>
												</p>
												<h3 id="approvedCount">11+</h3>
												<p>Approved</p>
											</div>
										</div>

										<div
											class="col-4 d-flex align-items-center justify-content-center vw-70">
											<div
												class="card card-body bg-transparent text-primary border-primary mb-3 "
												style="border-radius: 50px">
												<p>
													<i class="fa fa-eye-slash fa-5x" aria-hidden="true"></i>
												</p>
												<h3 id="pandingCount">11+</h3>
												<p>Pending</p>
											</div>
										</div>

										<div
											class="col-4 d-flex align-items-center justify-content-center">
											<div
												class="card card-body bg-transparent text-danger border-danger mb-3 "
												style="border-radius: 50px">
												<p>
													<i class="fa fa-minus-circle fa-5x" aria-hidden="true"></i>
												</p>
												<h3 id="rejectedCount">11+</h3>
												<p>Rejected</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="h-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center w-100">
				<div class="w-100">
					<div class="bg-dark text-white "
						style="border-radius: 1rem; width: 100%;" method="post">
						<div class="bg-dark text-white"
							style="border-radius: 1rem; width: 100%;">
							<div class=" p-5 text-center">
								<div class="col-12 position-relative text-center">
									<button type="button"
										class="btn btn-outline-light position-absolute z-index-1"
										style="right: 0%;" id="refresh-data-btn" onclick="refresh()">Refresh-data</button>
									<h2 class="fw-bold text-white mb-2 text-uppercase">Tickets</h2>
									<p class="text-white-50 mb-5">Tickets List!</p>
								</div>
								<div
									class="col-12 d-flex align-items-center justify-content-center  ">
									<div id="updateTicket"
										class="col-4 d-flex align-items-center justify-content-center d-none form-bg  ">
										<div>
											<div class=text-center>
												<h3 class="text-white my-5">Update Ticket!</h3>
											</div>
											<form method="post" class="mb-5 text-center ">
												<div class="form-outline form-white mb-4">
													<input class="form-control form-control-lg" type="text"
														id="ticketId" value="1" disabled> <label
														class="text-white text-center">ticketId </label>
												</div>
												<div class="form-outline form-white mb-4">
													<textarea name="comments" id="ticketComment"
														class="form-control form-control-lg" rows="3"
														placeholder="Enter your comments"></textarea>
													<label class="text-white text-center">comment </label>
												</div>
												<button class="btn btn-outline-success btn-lg px-5"
													type="button" name="action" value="approve"
													onclick="approveTicket()">Approve</button>
												<button class="btn btn-outline-danger btn-lg px-5"
													type="button" name="action" value="reject"
													onclick="rejectTicket()">Reject</button>
											</form>
										</div>
									</div>
								</div>

								<div id="table-wrapper" class="col-12 ">
									<div id="table-scroll" class="mb-md-5 mt-md-4 pb-5 row ">
										<table id="listTickets"
											class="table table-bordered table-striped text-white ">
											<thead>
												<tr>
													<th class="text">S/N</th>
													<th class="text">Ticket ID</th>
													<th class="text">Department</th>
													<th class="text">Issue</th>
													<th class="text">Description</th>
													<th class="text">Created By</th>
													<th class="text">Status</th>
													<th class="text">Comment</th>
													<th class="text"></th>
												</tr>
											</thead>
											<tbody id="ticketData">
												<!-- Add your ticket data dynamically here -->
											</tbody>
										</table>
									</div>
								</div>
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

	<script type="text/javascript"
		src="<c:url value="/resources/richtexteditor/rte.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/richtexteditor/plugins/all_plugins.js" />"></script>
	<script src="<c:url value="/resources/js/dashboard.js" />"></script>
</body>

</html>