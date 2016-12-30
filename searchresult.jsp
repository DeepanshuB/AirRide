<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.lang.*,java.util.*,java.sql.*,com.cts.atrs.model.*,com.cts.atrs.dao.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<jsp:include page="header.html" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled CSS -->
<link rel="stylesheet" href="css/project.css">
<c:choose>
	<c:when test="${search_result == null}">
		<!-- Latest compiled CSS -->
		<link rel="stylesheet" href="css/warning.css">
	</c:when>
	<c:otherwise>
		<!-- Latest compiled CSS -->
		<link rel="stylesheet" href="css/back.css">
	</c:otherwise>
</c:choose>

<!-- jQuery library -->
<script src="js/jquery-1.4.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>

<!-- compiled JavaScript -->
<script src="js/project.js"></script>


</head>
<body>

	<section id="content">
		<c:choose>
			<c:when test="${search_result == null}">
				<div class="text-center">

					<h1>Sorry No Flight Available</h1>
				</div>

			</c:when>
			<c:otherwise>
				<div class="text-center">

					<h1>The Following Flights are Available</h1>
				</div>
				<div class="wrapper pad2">
					<div id="accordion">
						<div>
							<table class="table table-striped table-responsive">
								<thead>
									<tr>
										<th>Flight Number</th>
										<th class="center">Airline Name</th>
										<th class="right">Departure Date</th>
										<th class="right">Source</th>
										<th class="right">Destination</th>
										<th class="right">Departure Time</th>
										<th class="right">No Of Seats</th>
										<th class="right">Total Fare</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<FlightModel> search_result = (ArrayList<FlightModel>) session
														.getAttribute("search_result");
												for (FlightModel flight : search_result) {
									%>
									<tr>
										<td><%=flight.getFlightNo()%></td>
										<td><%=flight.getAirlineName()%></td>
										<td><%=flight.getDeptDate()%></td>
										<td><%=flight.getSrc()%></td>
										<td><%=flight.getDest()%></td>
										<td><%=flight.getDepartTime()%></td>
										<td><%=flight.getNoOfSeats()%></td>
										<td>&#8377; <%=flight.getFare()%></td>
										<td class="right"><a
											href="BookControllerServlet?action=temporaryBook&fno=<%=flight.getFlightNo()%>&seats=<%=flight.getNoOfSeats()%>&doj=<%=flight.getDeptDate()%>&airlineName=<%=flight.getAirlineName()%>&src=<%=flight.getSrc()%>&dest=<%=flight.getDest()%>&departTime=<%=flight.getDepartTime()%>&fare=<%=flight.getFare()%>"
											type="button" class="btn btn-success">Book</a></td>
									</tr>
									<%
										}
									%>
								</tbody>

							</table>

						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>