<%-- 
    Document   : AddContact
    Created on : 20 Mar, 2022, 11:11:36 AM
   
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    if (request.getParameter ("submit") !=null)
    {
        String Name=request.getParameter("Name");
   String Phone= request.getParameter ("Phone");
String Email= request.getParameter ("Email"); 


try
{
Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-ONDH6FL6:1521:XE","M1","M1");
pst=con.prepareStatement("insert into Addc values(?,?,?)");
pst.setString(1,Name);
pst.setString (3, Email);
pst.setString (2, Phone);
rs = pst.executeQuery();
            
            
            if(rs.next())
            {
                response.sendRedirect("ViewContact.jsp");
                
            }
            else
            {
                 response.sendRedirect("login.jsp?msg=Invalid user or password");
            }
            con.close();
       }   
        catch(Exception e)
        {
            out.println(e.toString());
        }
       finally
       {
           

    }

%>

<script>
    
    alert("Registered User ");
    
    </script>
    
    
    
    
    <%

    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding Contact Page</title>
         <%@ include file="component/allCss.jsp"%>

    </head>
 <body style="background-color:#808080;">
        <%@ include file="component/navbar.jsp"%>

                <div class="container-fluid">
        <div class="row p-2">
        <div class="col-md-6 offset-md-3">
        <div class="card">
        <div class="card-body">
            <h4 class="text-center text-success">Add Contact Page</h4>
<form>
      <div class="form-group">
    <label for="exampleInputEmail1">Enter Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="Name">
   </div>
   <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="Email">
   </div>
       <div class="form-group">
    <label for="exampleInputEmail1">Enter Phone No</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="Phone">
    </div>

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
