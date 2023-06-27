<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","root");

PreparedStatement ps=con.prepareStatement("delete from payregister where id ='"+n+"'");
ps.executeUpdate();
con.close();
request.setAttribute("msg","Record Has been Successfully Deleted");
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
<jsp:forward page="ahome.jsp"></jsp:forward>