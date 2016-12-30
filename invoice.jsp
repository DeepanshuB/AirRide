<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<jsp:include page="header.html"/> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to AirTicket Reservation System</title>
	<!-- Latest compiled CSS -->
	<link rel="stylesheet" href="css/back.css">
	<script type="text/javascript">window.history.forward();function noBack(){window.history.forward();}</script>
</head>
<body bgcolor = "white">
		
		<div class="col-md-8 col-md-offset-2" style="margin-top:-20px">
			<div class="row header">
	
				<div class="col-sm-4">
					<div class="well">
					<h4>From :</h4>
					<p><strong><c:out value="${sessionScope.finalBookFlightModel.leavingFrom}"></c:out></strong></p>
					</div>
				</div><!--/col-->
	
				<div class="col-sm-4">
					<div class="well">
					<h4>To :</h4>
					<p><strong><c:out value="${sessionScope.finalBookFlightModel.goingTo}"></c:out></strong></p>
					</div>
				</div><!--/col-->
	
				<div class="col-sm-4">
					<div class="well">
					<h2>Details</h2>
					<p>Invoice #<c:out value="${sessionScope.finalBookFlightModel.bookingId}"></c:out></p>
					<p>Name : <c:out value="${sessionScope.finalBookFlightModel.customerName}"></c:out></p>
					<p>Airline Name : <c:out value="${sessionScope.finalBookFlightModel.airlineName}"></c:out></p>
					<p>Date of Journey : <c:out value="${sessionScope.finalBookFlightModel.dateOfJourney}"></c:out></p>
					<p>Departure Time : <c:out value="${sessionScope.finalBookFlightModel.departureTime}"></c:out></p>
					<p>Booking Date : <c:out value="${sessionScope.finalBookFlightModel.bookingDate}"></c:out></p>
					<p>No of Passengers : <c:out value="${sessionScope.finalBookFlightModel.numberOfPassenger}"></c:out></p>
					</div>
				</div><!--/col-->		
	
			</div><!--/row-->
			<table class="table table-striped table-responsive">
				<thead>
					<tr>
						<th class="center">#</th>
						<th>Name</th>
						<th class="center">Age</th>
						<th class="right">Gender</th>
						<th class="right">Price</th>                                          
					</tr>
				</thead>   
				<tbody>
					<c:forEach var="i" begin="0" end="${sessionScope.finalBookFlightModel.numberOfPassenger - 1}">
						<tr>
							<td class="center"><c:out value="${i+1}"></c:out></td>
							<td class="left"><c:out value="${sessionScope.passengerList[i].passengerName}"></c:out></td>
							<td class="center"><c:out value="${sessionScope.passengerList[i].passengerAge}"></c:out></td>
							<td class="right"><c:out value="${sessionScope.passengerList[i].passengerGender}"></c:out></td>
							<td class="right">&#8377; <c:out value="${sessionScope.finalBookFlightModel.price}"></c:out></td>                                        
						</tr> 
					</c:forEach>                   
				</tbody>
			</table>
	
			<div class="row">
	
				<div class="col-lg-4 col-sm-5 notice">
					<div class="well">
						Your Invoice Details
					</div>	
				</div><!--/col-->
	
				<div class="col-lg-4 col-lg-offset-4 col-sm-5 col-sm-offset-2 recap">
					<table class="table table-clear">
						<tbody>
							<tr>
								<td class="left"><strong>Subtotal</strong></td>
								<td class="right">&#8377; <c:out value="${sessionScope.finalBookFlightModel.subTotalPrice}"></c:out></td>                                        
							</tr>
							<tr>
								<td class="left"><strong>Discount </strong></td>
								<td class="right">&#8377; <c:out value="${sessionScope.finalBookFlightModel.discount}"></c:out></td>                                        
							</tr>
							<tr>
								<td class="left"><strong>Total</strong></td>
								<td class="right"><strong>&#8377; <c:out value="${sessionScope.finalBookFlightModel.totalPrice}"></c:out></strong></td>                                        
							</tr>  
							<tr>
							<td><a href="#" class="btn btn-info" onclick="javascript:window.print();"><i class="fa fa-print"></i> Print</a></td>
							<td><a href="thankyou.jsp" class="btn btn-success"><i class="fa fa-usd"></i> Proceed to Payment</a></td>
							</tr>                               
						</tbody>
						
					</table>
					 <div class="text-center">
					 	----------------------------------------------------------------------
					 </div>
				</div><!--/col-->
	
			</div><!--/row-->
			<jsp:include page="footer.jsp" /> 
		</div>
	 	
</body>
</html>