<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
	<!-- Latest compiled CSS -->
	<link rel="stylesheet" href="css/project.css">
	<link rel="stylesheet" href="css/index.css" type="text/css" media="all">

	<!-- jQuery library -->
	<script src="js/jquery-1.10.2.js"></script>

	<!-- compiled JavaScript -->
	<script src="js/project.js"></script>
	
	
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to AirTicket Reservation System</title>
</head>
<body>

<div  style="text-align:center; border-radius:20px 20px 0px 0px;  height:40px ;margin:20px">
   <h1>Air Ticket Reservation System <br>
         <span><small>You Seek We FulFill</small></span>
   </h1>

</div>

	<div class="container">
	    <div class="row">
	        <div class="col-md-4 col-md-offset-4">
	            <div class="panel panel-default" style="border-radius:20px;border:none; box-shadow: 3px 4px 5px #333;margin-top: 100px;">
	                <div class="panel-heading" style="border-radius:20px 20px 0px 0px; height:70px">
	                	<div class="text-center">
	                    	<h3  style="text-align:center;color:#008080;margin:10px;">Sign-In</h3>
	                    </div>
	                </div>
	                <div class="panel-body" style="height:200px">
	                    <form class="form-horizontal"  action="./BaseControllerServlet1" method="post">
	                    <div class="form-group" style="height:50px">
	                        <label for="email" class="col-sm-3 control-label">
	                            Email</label>
	                        <div class="col-sm-9">
	                            <input type="email" name="email" class="form-control" name="email" id="email" placeholder="Email" required>
	                        </div>
	                    </div>
	                    
	                    
	                    
	                    <div class="form-group" style="height:40px">
	                        <label for="password" class="col-sm-3 control-label">
	                            Password</label>
	                        <div class="col-sm-9">
	                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
	                        </div>
	                    </div>
	                    
	                    <div class="text-center" style="color:red;margin-bottom:10px">
	                    
	                         <c:out value="${requestScope.errorMess}"></c:out>
	                           
	                     </div>
	                    
	                    <div class="form-group last" style="height:50px">
	                        <div class="col-sm-offset-3 col-sm-9">
	                        <input type="hidden" name="action" value="Login">
	                            <button type="submit" class="btn btn-success btn-sm">
	                                                  Sign in</button>&nbsp;&nbsp;
	                                 <button type="reset" class="btn btn-default btn-sm">
	                                Reset</button>
	                        </div>
	                    </div>
	                    </form>
	                </div>
	                <div class="panel-footer" style="border-radius:0px 0px 20px 20px;height:50px">
	                	<div class = "text-center" style="margin:5px">
	                    Not Registred? <a href="Register.jsp">Register here</a>
	                    </div>
	               </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>