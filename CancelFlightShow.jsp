<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<jsp:include page="header.html" />
<html>
<head>
<c:choose>
	<c:when test="${sessionScope.CancelFlightLen == 0}">
		<!-- Latest compiled CSS -->
		<link rel="stylesheet" href="css/warning.css">
	</c:when>
	<c:otherwise>
		<!-- Latest compiled CSS -->
		<link rel="stylesheet" href="css/back.css">
	</c:otherwise>
</c:choose>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to AirTicket Reservation System</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.CancelFlightLen == 0}">
			<div class="text-center">
				<h1>Sorry You have not booked any flight</h1>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<div class="text-center">

					<h1>Booked Ticket List</h1>
				</div>
				<table class="table table-striped table-responsive">
					<thead>
						<tr>
							<th class="center">#</th>
							<th>BookingId</th>
							<th class="center">Airline Name</th>
							<th class="right">Departure Date</th>
							<th class="right">Departure Time</th>
							<th class="right">Source</th>
							<th class="right">Destination</th>
							<th class="right">No Of Seats</th>
							<th class="right">Total Fare</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="0"
							end="${sessionScope.CancelFlightLen - 1}">
							<tr>
								<td class="center"><c:out value="${i+1}"></c:out>
								</td>
								<td class="left"><c:out
										value="${sessionScope.CancelShowList[i].bookingid}"></c:out>
								</td>
								<td class="center"><c:out
										value="${sessionScope.CancelShowList[i].aname}"></c:out>
								</td>
								<td class="right"><c:out
										value="${sessionScope.CancelShowList[i].deptdate}"></c:out>
								</td>
								<td class="right"><c:out
										value="${sessionScope.CancelShowList[i].departtime}"></c:out>
								</td>
								<td class="right"><c:out
										value="${sessionScope.CancelShowList[i].src}"></c:out>
								</td>
								<td class="right"><c:out
										value="${sessionScope.CancelShowList[i].dest}"></c:out>
								</td>
								<td class="right"><c:out
										value="${sessionScope.CancelShowList[i].noOfSeats}"></c:out>
								</td>
								<td class="right"><c:out
										value="${sessionScope.CancelShowList[i].fare}"></c:out>
								</td>
								<td class="right"><a
									href="./CancelControllerServlet?action=tempCancelShow&bookingId=${sessionScope.CancelShowList[i].bookingid}"
									type="button" class="btn btn-success">Proceed</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					----------------------------------------------------------------------
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp" />
</body>
</html>