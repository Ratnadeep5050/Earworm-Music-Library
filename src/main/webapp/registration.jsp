
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@page import= "java.sql.*" %>
        <%@page import= "javax.sql.*" %>
        
        <%
        
            if(request.getParameter("signUpSubmit") != null){
            
            String username = request.getParameter("Username");
            String email = request.getParameter("Email");
            String password = request.getParameter("Password");
            
            //session.putValue("Username",username);
            
            Class.forName("com.mysql.jdbc.Driver");
            
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/earworm","root","");
            
            Statement st = con.createStatement();
            ResultSet rt;
            int i = st.executeUpdate("INSERT INTO users(Username,Email,Password) VALUES ('"+username+"','"+email+"','"+password+"')");
            
            out.println("Done");
            }
            else{
            out.println("Not"); 
            }
            
        %>
    </body>
</html>
