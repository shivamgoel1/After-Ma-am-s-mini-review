<%@page import="com.cts.entity.Services"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Doctor Details</title>
</head>
<body>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.addbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.addbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>

<form action="saveResult" method="Post" modelAttribute="result">
  <div class="container">
    <h1>Update Test Results</h1>
    <hr>
    
    <input id=requestId type="hidden" value="${result.id}" name="id" required> 
    
    <input id=customerId type="hidden" value="${result.cid}" name="cid" required> 
    
    <input id=doctorId type="hidden" value="${result.did}" name="did" required> 
    
    <input id=serviceId type="hidden" value="${result.serviceID}" name="serviceID" required>
    
 	<input id=resultDateId type="hidden" value="${result.result_date}" name="result_date" required>
 	
 	<input id=appointmentDateId type="hidden" value="${result.date}" name="date" required>
 	
 	<input id=statusId type="hidden" value="${result.status}" name="status" required>
 	
 	<input id=serviceDateId type="hidden" value="${result.date}" name="service_date" required>
 	
    <label for="d1actual"><b>Diag 1 Actual Value</b></label>
    <input id=d1actualId type="text"  placeholder="Enter D1 Actual Value" value="${result.d1_actual}" name="d1_actual"  required  >
    
    <label for="d1normal"><b>Diag 1 Normal Range</b></label>
    <input id=d1normalId type="text"  placeholder="Enter D1 Normal Range" value="${result.d1_normal}" name="d1_normal"  required  >
    
    <label for="d2actual"><b>Diag 2 Actual Value</b></label>
    <input id=d2actualId type="text"  placeholder="Enter D2 Actual Value" value="${result.d2_actual}" name="d2_actual"  required  >
    
    <label for="d2normal"><b>Diag 2 Normal Range</b></label>
    <input id=d2normalId type="text"  placeholder="Enter D2 Normal Range" value="${result.d2_normal}" name="d2_normal"  required  >
 
 	
     <label for="comments"><b>Comments</b></label>
    <input id=commentId type="text"  placeholder="Enter Comments" value="${doctor.comment}" name="comment"  required  >
    
    <label for="otherinfo"><b>Other Info.</b></label>
    <input id=infoId type="text"  placeholder="Enter Any other information" value="${doctor.other_info}" name="other_info"  required  >
    
    <button type="submit" class="addbtn">Update My Details</button>
  </div>

</form>
</body>
</html>