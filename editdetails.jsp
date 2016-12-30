<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--  <jsp:useBean id="io" class="com.cts.atrs.model.ListFromDbModel" scope="request"></jsp:useBean> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<jsp:include page="header.html" />
<html>
<head>

<!-- Latest compiled CSS -->
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/register.css" type="text/css"
	media="all">
<link rel="stylesheet" href="css/back.css">

<!-- jQuery library -->
<script src="js/jquery-ui.js"></script>


<!-- <script src="jquery-ui.min.js"></script> -->
<script src="jquery.validate.min.js"></script>

<!-- <!-- compiled JavaScript -->
<!-- <script src="js/project.js"></script> -->

<!--Date Picker -->
<%-- <%!String uname; %>
	<%
	uname=(String)session.getAttribute("usermodel");
	if(uname==null && session.isNew()){
		response.sendRedirect("index.jsp");
	}
	%> --%>
<script>

	$(
		function() 
		{   console.log("m in datepicker"); 
			$( "#datepicker" ).datepicker(
				{changeMonth:true,changeYear:true,dateFormat:"dd/mm/yy",minDate:"-130Y", maxDate: 0});
		}
	 );
</script>

<script type="text/javascript">
    $( document ).ready(function(){
    $('#btn-submit').click(function() {  
	
		$(".error").hide();
		var hasError = false;
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		var emailblockReg =  /^([\w-\.]+@(?!gmail.com)(?!yahoo.com)(?!hotmail.com)(?!aol.com)([\w-]+\.)+[\w-]{2,4})?$/;
		var numericReg = /^[a-zA-Z ]*$/;
		var passReg = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&]).{8,25})$/;
		var phonereg=/^([0]|\+91)?[789]\d{9}$/;
		var inputVal = $("#name").val();
		var pass=$("#password").val();
		var phone=$("#phone").val();
		var address=$("#address").val();
		//var gender=$("#gender").val();
	    if(inputVal==''){
	    	$("#name").after('<span class="error" style="color:red">Name is mandatory</span>'); 
			hasError=true;
	    }else if(inputVal.length<6){
	    	$("#name").after('<span class="error" style="color:red">Name should be more than 6 characters</span>'); 
			hasError=true;
	    }else if(!numericReg.test(inputVal)) {
			$("#name").after('<span class="error" style="color:red">Name contains alphabets only</span>'); 
			hasError=true;	
		}
		
	    if(pass == '') {
	    	$("#password").after('<span class="error" style="color:red">Please enter password.</span>');
	    	hasError = true;
	    	} else if(!passReg.test(pass)) { 
	    	$("#password").after('<span class="error" style="color:red">Password should contains atleast one capital letter,one small letter,one numeric and one special character in sequence</span>');
	    	hasError = true;
	    	} else if(pass.length<8 || pass.length>25) { 
	    	$("#password").after('<span class="error" style="color:red">Password length must be minimum 8 and maximum 25</span>');
	    	hasError = true;
	    	}  
	    
	    if(phone == ''){
	    	$("#phone").after('<span class="error" style="color:red">enter phone number</span>'); 
	    	hasError=true; 
	    	}
	    	else if(!phonereg.test(phone))
	    	{
	    	$("#phone").after('<span class="error" style="color:red">Invalid phone number and phone number should be 10 digit number</span>'); 
	    	hasError=true; 
	    	}
	    
	    if(address == ''){
	    	$("#address").after('<span class="error" style="color:red">Address should not be empty</span>');hasError=true;
	    	hasError=true;
	    	}
	    else if(address.length<5 || address.length>100 ){
	    	$("#address").after('<span class="error" style="color:red">Address should be greater than 5 and less than 100 characters</span>');
	    	hasError = true;
	    }
	
	    

		if(hasError == true) { return false; }
		
});	
  });
  </script>

<!-- //validations here-->




<title>Welcome to AirTicket Reservation System</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="margin-top:-35px">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="text-center">
							<span><b>EDIT PROFILE</b>
							</span>
						</div>
					</div>

					<div class="panel-body">
						<form class="form-horizontal" action="./BaseControllerServlet1"
							method="post">
							<c:forEach items="${requestScope.ulist}" var="l">
								<div class="form-group">
									<label for="name" class="col-sm-3 control-label"> Name</label>

									<div class="col-sm-9">
										<input type="text" name="cname" value="${l.name}"
											autocomplete="off" class="form-control" id="name"
											placeholder="Enter Name">
									</div>

								</div>



								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">
										Email</label>

									<div class="col-sm-9">
										<c:out value="${l.email}"></c:out>
										<input type="hidden" name="email" value="${l.email}">
									</div>
								</div>

								<div class="form-group">
									<label for="password" class="col-sm-3 control-label">
										New Password</label>
									<div class="col-sm-9">
										<input type="password" name="password" value="${l.password}"
											class="form-control" autocomplete="off" id="password"
											placeholder="eg: ABbc123@">
									</div>
								</div>



								<div class="form-group">
									<label for="dob" class="col-sm-3 control-label"> D.O.B</label>
									<div class="col-sm-9">
										<input id="datepicker" name="dob" value="${l.dob}"
											autocomplete="off" type="text" class="form-control"
											placeholder="mm-dd-yyyy" required>
									</div>
								</div>





								<div class="form-group">
									<label for="address" class="col-sm-3 control-label">
										Address</label>
									<div class="col-sm-9">
										<input type="text" name="address" value="${l.address}"
											autocomplete="off" height="100px" width="100px"
											maxlength="100" class="form-control" id="address"
											placeholder="Address">
									</div>
								</div>



								<div class="form-group">
									<label for="phone" class="col-sm-3 control-label">
										Phone</label>
									<div class="col-sm-9">
										<input type="text" name="phone" value="${l.phone}"
											autocomplete="off" class="form-control" id="phone"
											placeholder="Phone - 10 digits">
									</div>
								</div>



								<%-- <div class="form-group">
	                        <label for="" class="col-sm-3 control-label">
	                            Gender</label>
	                             <div class="col-sm-9">
	                             <c:set var="gender" value="male"/>
	                             Male <input type="radio" name="R1" 
            value="Male" <c:if test="${gender=='male'}">checked</c:if>>
            Female <input type="radio" name="R1" 
            value="Female" <c:if test="${gender=='female'}">checked</c:if>>
	                        <input type="text" name="gender" value="${l.gender}" autocomplete="off" height="100px" class="form-control" id="gender" >
	                         </div>
	                    </div> --%>




								<div class="form-group">
									<label for="" class="col-sm-3 control-label"> Gender</label>
									<div class="col-sm-9">
										<c:out value="${l.gender}"></c:out>
										<input type="hidden" name="gender" value=""${l.gender}"">
									</div>
								</div>





								<div class="form-group">
									<label for="ssn_type" class="col-sm-3 control-label">SSN_Type</label>
									<div class="col-sm-9">
										<c:out value="${l.ssnType}"></c:out>

									</div>
								</div>


								<div class="form-group">
									<label for="ssn_no" class="col-sm-3 control-label">
										SSN_No.</label>
									<div class="col-sm-9">
										<c:out value="${l.ssnNumber}"></c:out>
									</div>
								</div>




								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<input type="hidden" name="action" value="edit">
									</div>
								</div>
							</c:forEach>

							<div class="form-group last">
								<div class="col-sm-offset-3 col-sm-9">
									<input type="submit" value="Update"
										class="btn btn-success btn-sm" id="btn-submit">

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