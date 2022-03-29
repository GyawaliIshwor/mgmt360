<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> 
<html> 
<head>
 <meta charset="ISO-8859-1"> 
 <title>Register</title>
<link rel="stylesheet" href="style.css"  type="text/css">
<%@ page import="java.sql.*" %>
 <% Class.forName("com.mysql.cj.jdbc.Driver");
String method=request.getMethod();
String ErrMsg="";
if (method.compareToIgnoreCase("post")==0) {

String Email = request.getParameter("txEmail");
String Username = request.getParameter("txUsername"); 
String Password = request.getParameter("txPassword");
String Verify = request.getParameter("txVerify");

if (Password.compareTo(Verify)!=0) ErrMsg="Passwords do not match!";
else {
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreviewsdb", "root", "root@123");
Statement Cmd = Con.createStatement();
String SQL = String.format("select * from usercredentials where username='%s'", Username);
ResultSet Dat = Cmd.executeQuery(SQL);

Boolean UserExists=Dat.next();

Dat.close();
Cmd.close();
Con.close();

if (UserExists) ErrMsg="Username "+Username+" taken"; else {

Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreviewsdb", "root", "root@123");
Cmd = Con.createStatement();
SQL = String.format("insert into usercredentials(email, username, password) values('%s', '%s', '%s')", Email,Username, Password);

Cmd.executeUpdate(SQL); Cmd.close(); Con.close();

request.getRequestDispatcher("login.jsp").forward(request, response);

}

}

} %>

</head> <body>
<div class="main">
<div style="color:red;font-weight:bold">
 <%=ErrMsg %> 
 </div>
 
  
     
     
       <div class="login-div">
        <p class="header-text">
                Welcome to book review system. Register first to continue.
            </p>
           
            <div class="form-table">

            <form method=post action="register.jsp"> 
                <table style="width: 100%;margin-top: 20px;margin-bottom: 20px; ">
                    <tr class="credentialContainer"> <td class="label" ><label style="width: 100%; " for="mail">Email</label></td> 
                        <td class="input"><input type="email" name="txEmail" id="mail" placeholder="Enter email-id"></td> </tr>
                </table>
                <table style="width: 100%;margin-top: 20px;margin-bottom: 20px; ">
                    <tr class="credentialContainer"> <td class="label" ><label style="width: 100%; " for="mail">User Name</label></td> 
                        <td class="input"><input type="text" name="txUsername" id="mail" placeholder="Enter user name"></td> </tr>
                </table>
                <table style="width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <tr class="credentialContainer"> <td class="label" ><label style="width: 100%; " for="mail">Password</label></td> 
                        <td class="input"><input type="password" name="txPassword" id="txPassword" placeholder="Enter password"></td> </tr>
                </table>
                <table style="width: 100%;margin-top: 20px;margin-bottom: 20px;">
                    <tr class="credentialContainer"> <td class="label" ><label style="width: 100%; " for="mail">Confirm Password</label></td> 
                        <td class="input"><input type="password" name="txVerify" id="txVerify" placeholder="Retype password"></td> </tr>
                </table>
                <input type="submit" class="btn" value="Register">
               
                </form>
            </div>
            <div >
                <p style="margin: 10px 0px;">Already Registered!! Proceed to Login!!</p>
                <button class="btn"><a href="../html/login.html">Login</a></button>
            </div>
           
        </div>
     
     
</div>
</body> 
</html>