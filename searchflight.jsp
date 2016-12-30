<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.*,java.util.*,java.sql.*,com.cts.atrs.model.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="ob" class="com.cts.atrs.dao.SearchLoc" scope="request" />
<!DOCTYPE>
<jsp:include page="header.html" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled CSS -->

<link rel="stylesheet" href="css/searchflight.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/back.css">
<script src="js/jquery-ui.js"></script>



<script>
	$(
		function() 
		{    $( "#datepicker" ).datepicker(
				{changeMonth:true,changeYear:true,dateFormat:"dd/M/yy", minDate: 0, maxDate:"+6M"});
		}
	 );
</script>

<script type="text/javascript">
    $( document ).ready(function(){
    $('#btn-submit').click(function() {  
	$(".error").hide();
	var hasError = false;
	
	var from= $("#from").val();
	var to= $("#to").val();
	var timePattern = /^2[0-3]:[0-5][0-9]$|^[0-1][0-9]:[0-5][0-9]$/;
	var time= $("#time").val();
	
	if(from=="Select Source"){
		$("#from").after('<span class="error" style="color:red">Select Flight Source</span>');
		hasError=true;
	}
	if(to=="Select Destination"){
		$("#to").after('<span class="error" style="color:red">Select Flight Destination</span>');
		hasError=true;
	}
	if(from==to){
		$("#to").after('<span class="error" style="color:red">Source and Destination locations cannot be same</span>');
		hasError=true;
	}
	if(!timePattern.test(time)){
		$("#time").after('<span class="error" style="color:red">Time should be in 24 hr format(HH:MM)</span>');
		hasError=true;
	}
	
	if(hasError == true) 
		{ 
			return false; 
		}
	else
		{
		return true;
		}
		
	});	
  });
</script>

</head>

<title>Welcome to AirTicket Reservation System</title>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="margin-top: -30px">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="text-center">
							<span><b>Search</b> </span>
						</div>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" method="post"
							action="./SearchControllerServlet">
							<div class="form-group">
								<label for="searchFlight" class="col-sm-3 control-label">
									Flight From</label>
								<div class="col-sm-9">
									<select class="form-control" id="from" name="from"
										>
										<option>Select Source</option>
										<c:forEach items="${ob.searchLocation}" var="lo">
											<option value="${lo.loc}">${lo.loc}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="searchFlight" class="col-sm-3 control-label">
									Flight To</label>
								<div class="col-sm-9">
									<select class="form-control" id="to" name="to"
										>
										<option>Select Destination</option>
										<c:forEach items="${ob.searchLocation}" var="lo">
											<option value="${lo.loc}">${lo.loc}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="searchFlight" class="col-sm-3 control-label">
									Date Of Journey</label>
								<div class="col-sm-9">
									<input id="datepicker" autocomplete="off" name="doj"
										type="text" class="form-control"
										placeholder="Enter Departure Date" required>
								</div>
								<span class="error" style="color:red">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${requestScope.errorMessageFlight}"></c:out></span>
							</div>
							
							
							
							<div class="form-group">
								<label for="searchFlight" class="col-sm-3 control-label">
									Time Of Journey</label>
								<div class="col-sm-9">
									<input id="time" type="text" autocomplete="off"
										class="form-control" placeholder="Enter Departure Time"
										name="depart_time" required>
								</div>
							</div>
							<div class="form-group">
								<label for="searchFlight" class="col-sm-3 control-label">
									Number Of Passenger</label>
								<div class="col-sm-9">
									<select class="form-control" id="seat" name="nop">
										<% 
															for(int i=1;i<=20;i++)
															{
															%>
										<option value="<%=i%>"><%=i%>
										</option>

										<%} %>
									</select>
								</div>
							</div>
							<div class="form-group last">
								<div class="col-sm-offset-3 col-sm-9">
									<!-- <input type="hidden" name="action" value="searchflight">-->
									<button type="submit" class="btn btn-success btn-sm"
										id="btn-submit">Search</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>