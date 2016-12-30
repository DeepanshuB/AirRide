<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="io" class="com.cts.atrs.model.ListFromDbModel"
	scope="request"></jsp:useBean>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<jsp:include page="header.html" />
<html>
<head>

<!-- Latest compiled CSS -->

<link rel="stylesheet" href="css/datepick.css">
<link rel="stylesheet" href="css/register.css" type="text/css"
	media="all">
	<link rel="stylesheet" href="css/back.css">



<!--Date Picker -->
<%!String uname;%>
<%
	uname = (String) session.getAttribute("usermodel");
	if (uname == null && session.isNew()) {
		response.sendRedirect("index.jsp");
	}
%>



<!-- //validations here-->


</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to AirTicket Reservation System</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="margin-top:-35px">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="text-center">
							<span><b>MY PROFILE</b> </span>
						</div>
					</div>

					<div class="panel-body">
						<form class="form-horizontal" action="./BaseControllerServlet1"
							method="post">
							<table class="table table-striped table-responsive">
								<tbody>
									<c:forEach items="${requestScope.ulist}" var="l">
										<tr>
											<td colspan="2"><label for="name"
												class="col-sm-3 control-label"> Name</label></td>
											<td><c:out value="${l.name}"></c:out></td>
										</tr>

										<tr>
											<td colspan="2"><label for="email"
												class="col-sm-3 control-label"> Email</label></td>
											<td><c:out value="${l.email}"></c:out></td>
										</tr>

										<tr>
											<td colspan="2"><label for="dob"
												class="col-sm-3 control-label"> D.O.B</label></td>
											<td><c:out value="${l.dob}"></c:out></td>
										</tr>


										<tr>
											<td colspan="2"><label for="address"
												class="col-sm-3 control-label"> Address</label></td>
											<td><c:out value="${l.address}"></c:out></td>
										</tr>

										<tr>
											<td colspan="2"><label for="phone"
												class="col-sm-3 control-label"> Phone</label></td>
											<td><c:out value="${l.phone}"></c:out></td>
										</tr>

										<tr>
											<td colspan="2"><label for=""
												class="col-sm-3 control-label"> Gender</label></td>
											<td><c:out value="${l.gender}"></c:out></td>
										</tr>

										<tr>
											<td colspan="2"><label for="ssn_type"
												class="col-sm-3 control-label">SSN_Type</label></td>
											<td><c:out value="${l.ssnType}"></c:out></td>
										</tr>

										<tr>
											<td colspan="2"><label for="ssn_no"
												class="col-sm-3 control-label"> SSN_No.</label></td>
											<td><c:out value="${l.ssnNumber}"></c:out></td>
										</tr>


										<input type="hidden" name="action" value="viewdetails">
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="center-block" style="width: 100px;">
									<a class="btn btn-success"
										href="./BaseControllerServlet1?action=edit">Edit Profile</a>
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