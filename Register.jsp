<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="io" class="com.cts.atrs.model.ListFromDbModel" scope="request"></jsp:useBean>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
	<!-- Latest compiled CSS -->
	<link rel="stylesheet" href="css/project.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/back.css">
   

	<!-- jQuery library -->
	<script src="js/jquery-1.10.2.js"></script>
	
	<!-- compiled JavaScript -->
	<script src="js/project.js"></script>

	<!-- jQuery library -->
	<script src="js/jquery-ui.js"></script>
	<!-- <script src="js/jquery-ui.min.js"></script>  -->
	<script src="js/jquery.validate.min.js"></script>
	<!-- compiled JavaScript -->

	
	<!--Date Picker -->
<script>

	$(
		function() 
		{   console.log("m in datepicker"); 
			$( "#datepicker" ).datepicker(
				{changeMonth:true,changeYear:true,dateFormat:"dd/mm/yy",minDate:"-130Y", maxDate: 0});
		}
	 );
</script>
	
	
	<script>
    $( document ).ready(function(){
    $('#btn-submit').click(function() {  
	
		$(".error").hide();
		var hasError = false;
		var emailblockReg = /^([\w-\.]+@(?!gmail.com)(?!gmail.in)(?!yahoo.com)(?!yahoo.in)(?!hotmail.in)(?!hotmail.com)([\w-]+\.)+[\w-]{2,4})?$/;
		var emailaddressVal = $("#email").val();
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		var nameReg = /^[a-zA-Z ]*$/;
		var passReg = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%&^]).{8,25})$/;
		var phonereg=/^([0]|\+91)?[789]\d{9}$/;
		var numericReg = /^[a-zA-Z]*[a-zA-Z0-9]$/;
		var inputVal = $("#name").val();
		var pass=$("#password").val();
		var phone=$("#phone").val();
		var address=$("#address").val();
		var gender=$("#gender").val();
		var ssnno=$("#ssn_no").val();
	    if(inputVal==''){
	    	$("#name").after('<span class="error" style="color:red">Name is mandatory</span>'); 
			hasError=true;
	    }else if(inputVal.length<6){
	    	$("#name").after('<span class="error" style="color:red">Name should be more than 6 characters</span>'); 
			hasError=true;
	    }else if(!nameReg.test(inputVal)) {
			$("#name").after('<span class="error" style="color:red">Name contains alphabets only</span>'); 
			hasError=true;	
		}
		
	    if(emailaddressVal == '') {
	    	$("#email").after('<span class="error" style="color:red">Please enter your email address.</span>');
	    	hasError = true;
	    	} 
	    	else if(!emailReg.test(emailaddressVal)) { 
	    	$("#email").after('<span class="error" style="color:red">Enter a valid email address.</span>');
	    	hasError = true;
	    	} 
	    	else if(emailblockReg.test(emailaddressVal)) { 
	    	$("#email").after('<span class="error" style="color:red">Only gmail, hotmail or yahoo.</span>');
	    	hasError = true;
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
	    
	    if(ssnno== ''){
	    	$("#ssn_no").after('<span class="error" style="color:red">SSN Number should not be empty</span>');
	    	hasError=true;
	    }
	    else if(ssnno.length<1 || ssnno.length>10 ){
	    	$("#ssn_no").after('<span class="error" style="color:red">SSN Number should be greater than 1 and less than 10 alphanumerics</span>');
	    	hasError = true;
	    }
	    else if(numericReg.test(ssnno))
    	{
    	$("#ssn_no").after('<span class="error" style="color:red">It should contain only characters and numeric</span>'); 
    	hasError=true; 
    	}

		if(hasError == true) { return false; }
	/* 	else
		{
		return true;
		} */
});	
  });
  </script>
	
	
	<!-- //validations here-->
	

</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to AirTicket Reservation System</title>
</head>
<body>
	<div class="page-header" style="text-align:center; border-radius:20px 20px 0px 0px;  height:40px ;margin:20px">
	   <h1>Air Ticket Reservation System 
	      <small>You Seek We FulFill</small>
	   </h1>
	</div>
	<div class="container">
	    <div class="row">
	        <div class="col-md-4 col-md-offset-4">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                	<div class="text-center">
	                    	<span><b>SIGN UP</b></span>
	                    	
	                    	<br>
	                         <span><c:out value="${requestScope.errorMess}"></c:out></span>
	                           
	                    
	                    </div>
	                </div>
	                
	                <div class="panel-body">
	                    <form class="form-horizontal" action="./BaseControllerServlet1" method="post" >
	                    
	                     <div class="form-group">
	                        <label for="name" class="col-sm-3 control-label">
	                           Name</label>
	                        <div class="col-sm-9">
	                            <input type="text"  name="cname" autocomplete="off" class="form-control" id="name" placeholder="Enter Name"  >
	                        </div>
	                    </div>
	                    
	                    
	                    
	                    <div class="form-group">
	                        <label for="email" class="col-sm-3 control-label">
	                            Email</label>
	                        <div class="col-sm-9">
	                            <input type="email"  name="email" autocomplete="off" class="form-control" id="email" placeholder="Email"  >
	                        </div>
	                    </div>
	                    
	                    
	                    
	                    <div class="form-group">
	                        <label for="password" class="col-sm-3 control-label" >
	                            Password</label>
	                        <div class="col-sm-9">
	                            <input type="password" name="password" class="form-control" autocomplete="off" id="password" placeholder="eg: ABbc123@"  >
	                        </div>
	                    </div>
	                    
	                    
	                    
	                     <div class="form-group">
	                        <label for="dob" class="col-sm-3 control-label">
	                            D.O.B</label>
	                        <div class="col-sm-9">
	                            <input id="datepicker"  name="dob" autocomplete="off" type="text" class="form-control" placeholder="mm-dd-yyyy"  >	                       
	                        </div>
	                    </div>
	                    
	                    
	                    
	                    <div class="form-group">
	                        <label for="address" class="col-sm-3 control-label">
	                            Address</label>
	                        <div class="col-sm-9">
	                            <input type="text" name="address" autocomplete="off" height="100px" width="100px" maxlength="100" class="form-control" id="address" placeholder="Address" >
	                        </div>
	                    </div>
	                    
	                    
	                    
	                    <div class="form-group">
	                        <label for="phone" class="col-sm-3 control-label">
	                            Phone</label>
	                        <div class="col-sm-9">
	                            <input type="text" name="phone" autocomplete="off" class="form-control" id="phone" placeholder="Phone - 10 digits"  >
	                        </div>
	                    </div>
	                    
	                    
	                     <div class="form-group">
	                        <label for="" class="col-sm-3 control-label">
	                            Gender</label>
	                        <div class="col-sm-5">
	                            <input type="radio"  name="gender" id="male" value="Male">Male&nbsp;&nbsp;
	                           	<input type="radio"  name="gender" id="female" value="Female" checked>Female
	                        </div>
	                    </div>
	                    
	                    
	                    <div class="form-group">
	                        <label for="ssn_type" class="col-sm-3 control-label">SSN_Type</label>
	                        <div class="col-sm-9">
	                        
	                           <select class="form-control" id="Ssn_types" name="ssn_type" onchange="showsource(this.value)" >

										<!-- <option class="col-sm-9 control-label"></option>-->
										 <c:forEach items="${io.ssntypes}" var="ss"> <%--Method name of NamesListFromDb--%>
										<option value="${ss.ssnType}" class="col-sm-15 control-label">${ss.ssnType}</option> <%--Property of pojo --%>
										</c:forEach> 
										</select>
	                        </div>
	                    </div>
	                    
	                    
	                     <div class="form-group">
	                        <label for="ssn_no" class="col-sm-3 control-label">
	                            SSN No.</label>
	                        <div class="col-sm-9">
	                            <input type="text" name="ssn_no" autocomplete="off" class="form-control" id="ssn_no" placeholder="SSN number"  >
	                        </div>
	                    </div>                 
	                    
	                     
	                    
	                    <div class="form-group last">
	                        <div class="col-sm-offset-3 col-sm-9">
	                        <input type="hidden" name="action" value="registration"> 
	                            <button type="submit" class="btn btn-success btn-sm" id="btn-submit" >
	                                Register</button>
	                                 <button type="reset" class="btn btn-default btn-sm" >
	                                Reset</button>
	                                
	                        </div>
	                    </div>	                    
	                    
	                    </form>
	               <!--  </div>
	                <div class="panel-footer">
	                	<div class = "text-center">
	                    Not Registred? <a href"#">Register here</a>
	                    </div> -->
	               </div>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>