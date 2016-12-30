<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<jsp:include page="header.html" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">window.history.forward();function noBack(){window.history.forward();}</script>
<title>Welcome to AirTicket Reservation System</title>

<!-- Latest compiled CSS -->
<link rel="stylesheet" href="css/back.css">

</head>
<body>
	<div class="col-md-8 col-md-offset-2">
		<div class="text-center">
			<h1>Invoice Details of Cancellation</h1>
		</div>
		<table class="table table-striped table-responsive">
			<thead>
				<tr>
					<th class="center">Details :</th>
					<th class="center">Amount :</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="center"><label>Booking Id :</label></td>
					<td class="center"><c:out
							value="${sessionScope.cancelCharge.bookingId}"></c:out></td>
				</tr>
				<tr>
					<td class="center"><label>Total Amount Paid :</label></td>
					<td class="center"><c:out
							value="${sessionScope.cancelCharge.totalCost}"><</c:out></td>
				</tr>
				<tr>
					<td class="center"><label>Cancellation Charge :</label></td>
					<td class="center"><c:out
							value="${sessionScope.cancelCharge.charge}"></c:out></td>
				</tr>
				<tr>
					<td class="center"><label>Cancellation Tax :</label></td>
					<td class="center"><c:out
							value="${sessionScope.cancelCharge.cancelTax}"></c:out></td>
				</tr>
				<tr>
					<td class="center"><label>Refundable Amount :</label></td>
					<td class="center"><c:out
							value="${sessionScope.cancelCharge.refund}"></c:out></td>
				</tr>
			</tbody>
		</table>
		<div class="row-centre">

			<div class="col-lg-4 col-lg-offset-4 col-sm-5 col-sm-offset-2 recap">
				<a href="./CancelControllerServlet?action=ConfirmCancellation"
					type="button" class="btn btn-success">Proceed</a> <a
					href="./CancelControllerServlet?action=CancelFlightShow"
					type="button" class="btn btn-default" data-dismiss="modal">Cancel</a>
			</div>
			<!--/col-->

		</div>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>