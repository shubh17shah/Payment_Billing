<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<% 
String username=request.getParameter("username");
System.out.print(username);
String userpass=request.getParameter("userpass");
String branch=request.getParameter("branch");
boolean status=false;
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","root");
PreparedStatement ps=con.prepareStatement("insert into payregister(username,userpass,branch) values(?,?,?) ");
ps.setString(1,username);
ps.setString(2,userpass);
ps.setString(3,branch);
ps.executeUpdate();
String query="select * from payregister";
ResultSet rs=ps.executeQuery(query);
status=rs.next();
if(status){
System.out.print("hi");
username=rs.getString(2);
session.setAttribute("username",String.valueOf(username));
session.setAttribute("islogin","plz sign in first");

%>
<jsp:forward page="home.jsp"></jsp:forward>
<%
}
else{
System.out.print("hi");
request.setAttribute("Error","Sorry! Username or Password Error. Plz Enter Correct Detail ");
session.setAttribute("Loginmsg","Plz sign in first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
}
catch(Exception e){
e.printStackTrace();
}

%>