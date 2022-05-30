<%-- 
    Document   : ViewContact
    Created on : 20 Mar, 2022, 11:12:00 AM
    Author     : Humnashi
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Details</title>
         <link href="bootstrap-5.1.3-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
         <%@ include file="component/allCss.jsp"%>
    </head>
   <body style="background-color:#808080;">
        <%@ include file="component/navbar.jsp"%>

        <h1><center>Contacts Details</center></h1>
        <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%"> 
    <thead>
<tr>
    <th>Name</th>
<th>Phone</th>
<th>Email</th>

</tr>
<%
    
    Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-ONDH6FL6:1521:XE","M1","M1");

  String sql="select * from Addc order by Name";
  Statement st=con.createStatement();
  rs=st.executeQuery(sql);
  
  
  while(rs.next())
  {
      String Phone=rs.getString("Phone");
 
      
      %>
      
  
    
<tr>
    <td><%=rs.getString("Name") %></td>
<td><%=rs.getString("Phone") %></td>
<td><%=rs.getString("Email") %></td>
</tr>

<%
    
    
    }

%>

</table>
        
    </body>
</html>
