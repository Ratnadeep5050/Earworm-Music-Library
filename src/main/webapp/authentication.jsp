<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@page import= "java.sql.*"%>
        <%@page import= "javax.sql.*"%>
        
        <% 
        
            if(request.getParameter("signInSubmit") != null){
            
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                Class.forName("com.mysql.jdbc.Driver");
            
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/earworm","root","");
            
                Statement st = con.createStatement();
                ResultSet rt;
                rt = st.executeQuery("Select * from users where username='"+username+"' and password='"+password+"'");
            
                if(rt.next()){
                    
                    session.setAttribute("username",username);
                    response.sendRedirect("profile.jsp");
                    
                }
                else{
                	response.sendRedirect("index.jsp");
                }
            }
            else{
                
                out.println("Not");
                
            }
             
        %>
        
    </body>
</html>
