<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    if (request.getParameter ("submit") !=null)
    {
       try
       {
   String Email= request.getParameter ("Email");
String Password= request.getParameter ("Password"); 



Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-ONDH6FL6:1521:XE","M1","M1");
pst=con.prepareStatement("select * from register where Email=? and Password=?");
pst.setString (1, Email);
pst.setString (2, Password);
 rs = pst.executeQuery();
            
            if(rs.next())
            {
                response.sendRedirect("index1.jsp");
                
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
    }

%>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title> Login Form</title>
      <link rel="stylesheet" href="style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   </head>
   <body>
      <div class="bg-img">
         <div class="content">
            <header>Login Form</header>
            <form action="#">
               <div class="field">
                  <span class="fa fa-user"></span>
                  <input type="text" required placeholder="Email or Phone" name="Email">
               </div>
               <div class="field space">
                  <span class="fa fa-lock"></span>
                  <input type="password" class="pass-key" required placeholder="Password" name="Password">
                  <span class="show">SHOW</span>
               </div>
               <div class="pass">
                  <a href="#">Forgot Password?</a>
               </div>
               <div class="field">
                  <input type="submit" value="LOGIN" name="submit">
               
               </div>
            </form>
            
            <div class="signup">
               Don't have account?
               <a href="register.jsp">Signup Now</a>
            </div>
               <button><a href="index.jsp">Back</a></button>
         </div>
      </div>
      <script>
         const pass_field = document.querySelector('.pass-key');
         const showBtn = document.querySelector('.show');
         showBtn.addEventListener('click', function(){
          if(pass_field.type === "password"){
            pass_field.type = "text";
            showBtn.textContent = "HIDE";
            showBtn.style.color = "#3498db";
          }else{
            pass_field.type = "password";
            showBtn.textContent = "SHOW";
            showBtn.style.color = "#222";
          }
         });
      </script>
   </body>
</html>