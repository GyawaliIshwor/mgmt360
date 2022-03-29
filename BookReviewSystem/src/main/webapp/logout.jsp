<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> <!DOCTYPE html>

<html>
 <head> 
 <meta charset="ISO-8859-1"> 
 <title>Logout</title>
 <link rel="stylesheet" href="style.css"  type="text/css">

<% HttpSession Session = request.getSession(); 
Session.setAttribute("username", "");
Session.setAttribute("email", "");

%> 
</head>
 <body>
 <div class="main">
  <h1>You have been logged out.</h1> </div> </body> </html>