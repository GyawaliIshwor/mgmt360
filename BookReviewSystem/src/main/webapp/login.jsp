<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> <!DOCTYPE html>
<html> 
<head> 
<meta charset="ISO-8859-1">
 <title>Login</title> 
 <link rel="stylesheet" href="style.css"  type="text/css">
 <%@ page import="java.sql.*" %>
  <% Class.forName("com.mysql.cj.jdbc.Driver");
  String method=request.getMethod();

String ErrMsg="";
if (method.compareToIgnoreCase("post")==0) {

String Username = request.getParameter("txUsername");
String Password = request.getParameter("txPassword");
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreviewsdb", "root", "root@123");
Statement Cmd = Con.createStatement();
String SQL = String.format("select * from usercredentials where username='%s' and password='%s'", Username, Password);
ResultSet Dat = Cmd.executeQuery(SQL);

Boolean UserExists=Dat.next();
if (!UserExists) ErrMsg="Invalid username or password";
else {
Username = Dat.getString("username");
String Email = Dat.getString("email");
HttpSession Session=request.getSession();
Session.setAttribute("username", Username); 
Session.setAttribute("email", Email);
if (Session.getAttribute("RetPage")==null || Session.getAttribute("RetPage").toString().isEmpty())

request.getRequestDispatcher("secret.jsp").forward(request, response);

else {

}

} 
Dat.close();
Cmd.close(); 
Con.close();

} %> </head>
 <body>
 <div class="main">
  <div style="color:red;font-weight:bold"> 
  <%=ErrMsg %> </div>
   <div class="login-div">
            <p class="header-text">
                Welcome to book review system. Register first to continue.
            </p>
            <div class="form-table">
            	 <form method=post action="login.jsp">
            
	                <table style="width: 100%;margin-top: 20px;margin-bottom: 20px;">
	                    <tr class="credentialContainer"> <td class="label" ><label style="width: 100%; " for="mail">User Name</label></td> 
	                        <td class="input"><input type="text" name="txUsername" id="mail" placeholder="Enter username"></td> </tr>
	                </table>
	                <table style="width: 100%;margin-top: 20px;margin-bottom: 20px;">
	                    <tr class="credentialContainer"> <td class="label" ><label style="width: 100%; " for="mail">Password</label></td> 
	                        <td class="input"><input type="password" name="txPassword" id="txPassword" placeholder="Enter password"></td> </tr>
	                </table>
	                <input type="submit" class="btn" value="Login"> 
	
	               
                </form>
            </div>
            <div >
                <p style="margin: 10px 0px;">Not Registered !! Proceed to Register!!</p>
                <a href="./register.jsp" > <button class="btn"> Register</button></a>
            </div>
           
        </div>

   </div>
   </body> 
   </html>