<% HttpSession Session = request.getSession(); 
String username=""; 
String email=""; 
if (Session.getAttribute("username")!=null && !Session.getAttribute("username").toString().isEmpty())

username=Session.getAttribute("username").toString();

if (Session.getAttribute("email")!=null && !Session.getAttribute("email").toString().isEmpty()) email=Session.getAttribute("email").toString();

if (username.isEmpty() || email.isEmpty()) { String URL=request.getRequestURI();
String RetPage=URL.substring(URL.lastIndexOf("/")+1);
Session.setAttribute("RetPage", RetPage);
request.getRequestDispatcher("login.jsp").forward(request, response); } %>