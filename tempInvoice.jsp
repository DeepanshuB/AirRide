<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--  <jsp:useBean id="bookFlightModel" class="com.cts.atrs.model.BookFlightModel" scope="session"></jsp:useBean> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<jsp:include page="header.html" />
<html>
<head>
<!-- compiled JavaScript -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:choose>
	<c:when test="${sessionScope.bookFlightModel == null}">
		<!-- Latest compiled CSS -->
		<link rel="stylesheet" href="css/warning.css">
	</c:when>
	<c:otherwise>
		<!-- Latest compiled CSS -->
		<link rel="stylesheet" href="css/back.css">
	</c:otherwise>
</c:choose>
<title>Welcome to AirTicket Reservation System</title>

</head>
<body bgcolor="white">
	<c:choose>
		<c:when test="${sessionScope.bookFlightModel == null}">

			<div class="text-center">
				<h1>Sorry Search For a Flight First</h1>
			</div>

		</c:when>

		<c:otherwise>
			<div class="col-md-8 col-md-offset-2">
				<div class="row header">

					<div class="col-sm-4">
						<div class="well">
							<h4>From :</h4>
							<p>
								<strong><c:out
										value="${sessionScope.bookFlightModel.leavingFrom}"></c:out> </strong>
							</p>
						</div>
					</div>
					<!--/col-->

					<div class="col-sm-4">
						<div class="well">
							<h4>To :</h4>
							<p>
								<strong><c:out
										value="${sessionScope.bookFlightModel.goingTo}"></c:out> </strong>
							</p>

						</div>
					</div>
					<!--/col-->

					<div class="col-sm-4">
						<div class="well">
							<h2>Details</h2>
							<p>
								Name :
								<c:out value="${sessionScope.bookFlightModel.customerName}"></c:out>
							</p>
							<p>
								Airline Name :
								<c:out value="${sessionScope.bookFlightModel.airlineName}"></c:out>
							</p>
							<p>
								Date of Journey :
								<c:out value="${sessionScope.bookFlightModel.dateOfJourney}"></c:out>
							</p>
							<p>
								Departure Time :
								<c:out value="${sessionScope.bookFlightModel.departureTime}"></c:out>
							</p>
							<p>
								Booking Date :
								<c:out value="${sessionScope.bookFlightModel.bookingDate}"></c:out>
							</p>
							<p>
								No of Passengers :
								<c:out value="${sessionScope.bookFlightModel.numberOfPassenger}"></c:out>
							</p>
						</div>
					</div>
					<!--/col-->

				</div>
				<!--/row-->

				<br>
				<div class="row-centre">

					<div
						class="col-lg-4 col-lg-offset-4 col-sm-5 col-sm-offset-2 recap">
						<button type="button" class="btn btn-success" data-toggle="modal"
							data-target="#myModal">Proceed</button>
						<a href="./BookControllerServlet?action=cancel"
							class="btn btn-danger"><i class="fa fa-usd"></i> Cancel</a>
					</div>
					<!--/col-->

				</div>
				<!--/row-->

				<!-- Model for adding Passenger Details -->
				<div class="modal fade" id="myModal" tabindex="-1">
					<form class="form-horizontal" action="./BookControllerServlet"
						method="post">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span>&times;</span>
									</button>
									<h4 class="modal-title">Add Passengers Details</h4>
								</div>
								<div class="modal-body">
									<table class="table table-striped table-responsive">
										<thead>
											<tr>
												<th class="center">#</th>
												<th>Name</th>
												<th class="center">Age</th>
												<th class="right">Gender</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" begin="1"
												end="${sessionScope.bookFlightModel.numberOfPassenger}">
												<tr>
													<td class="center"><c:out value="${i}"></c:out></td>
													<td class="left"><input id="name" type="text"
														placeholder="Enter only alphabets" name="cname"
														pattern="^[a-zA-Z ]{1,50}$" required></td>
													<td class="center"><input type="text" name="cage"  
														placeholder="Enter only number" pattern="^(0?[1-9]|[1-9][0-9]|[1][0-2][0-9]|[1][3][0])$" required></td>
													<td class="right"><select class="form-control"
														name="gender">
															<option>Male</option>
															<option>Female</option>
													</select>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<input type="hidden" name="action" value="confirmTicket">
									<button id="btn-submit" type="submit" class="btn btn-primary">Confirm
										Ticket</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</form>
				</div>
				<!-- /.modal -->
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp" />
</body>
</html>