<%-- 
    Document   : register
    Created on : 20 Mar, 2022, 11:10:47 AM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.text.Position"%>
<%@page import="java.sql.*" %>

<%
    
    if (request.getParameter ("submit") !=null)
    {
        String Name=request.getParameter("Name");
   String Email= request.getParameter ("Email");
String Password= request.getParameter ("Password"); 



Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-ONDH6FL6:1521:XE","M1","M1");
pst=con.prepareStatement("insert into register values(?,?,?)");
pst.setString(1,Name);
pst.setString (2, Email);
pst.setString (3, Password);
pst.executeUpdate();
response.sendRedirect("index2.jsp");
%>

<script>
    
    alert("Registered User");
    
    </script>
    
    
    
    
    <%

    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <%@ include file="component/allCss.jsp"%>

    </head>
    
    <body style="background-color: #0cbaba;">
       
        <div class="container-fluid">
        <div class="row p-2">
        <div class="col-md-6 offset-md-3">
        <div class="card">
        <div class="card-body">
            <h4 class="text-center text-success">Registration Page</h4>
<form>
      <div class="form-group">
    <label for="Name">Enter Name</label>
    <input type="text" class="form-control" id="Name" aria-describedby="Name" name="Name" required>
   </div>

    
    
   <div class="form-group">
    <label for="Email">Email address</label>
    <input type="email" class="form-control" id="Email" aria-describedby="Email" name="Email">
   </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <input type="password" class="form-control" id="Password" name="Password">
    <div class="text-center mt-2">
        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info"></input>
    </div>
</form>
        </div>
        </div>
        </div>
        </div>
        </div>
                            
    </body>
</html>
