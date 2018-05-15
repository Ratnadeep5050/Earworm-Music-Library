<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
   <head>
	  <title>Profile</title>
	  <link rel="stylesheet" type="text/css" href="css/profile.css"/>
	  <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
      <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
     	
	    <script src="build/mediaelement-and-player.min.js"></script>
	    <link rel="stylesheet" href="build/mediaelementplayer.min.css"/>
	  
	   <script type="text/javascript">
        	$(document).ready(function(){
        		$('audio,vedio').mediaelementplayer();
        	});
       </script>
       
   </head>
   
   <body>
      <div class="taskBar">
         <p id="search">Search</p>
         <form name="taskBarSearch" id="taskBarSearch" method="POST" action="taskBarSearchResult.jsp">
            <input type="text" name="searchField" id="searchField" size="68" />
            <input type="submit" id="searchButton" name="searchButton" value="Ask"/>
         </form>
         <input type="button" name="home" id="home" value="Home"/>
         <input type="button" name="notification" id="notification" value="Notification"/>
         <input type="button" name="user" id="user" value="<%= session.getAttribute("username") %>"/>
         <input type="button" name="signOut" id="signOut" value="Sign Out" onclick="location.href='index.jsp'"/>
      </div>

      <div class="coverAndProfilePic">
      	 <img class="profilePic" src="images/profilePic.jpg"/>
      </div>

      <div class="userContentBar">
      	<input type="button" name="all" id="all" value="All"/>
      	<input type="button" name="tracks" id="tracks" value="Tracks"/>
      	<input type="button" name="albums" id="albums" value="Albums"/>
      	
      	<form action="FileUpload" method="POST" name="songUpload" id="songUpload" enctype="multipart/form-data">
      	  <input type="file" name="songChoose" id="songChoose" value="Choose"/>
      	  <input type="submit" name="songChooseSubmit" id="songChooseSubmit" value="Upload">		
      	</form>	
      </div>

      <div class="userContents">
      	
      	   <%@page import= "java.sql.*" %>
      	   <%@page import= "javax.sql.*" %>
      	   <%@page import= "java.io.FileInputStream" %>
      	   <%@page import= "java.io.PrintWriter" %>
      	   
      	   <% 
      	   
      	   		String username = (String)session.getAttribute("username");
      	   
      	   		Class.forName("com.mysql.jdbc.Driver");
           
           		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/earworm","root","");
           
           		Statement st = con.createStatement();
           		ResultSet rt;
           		rt = st.executeQuery("SELECT songname FROM songs WHERE username='"+username+"' AND songname IS NOT NULL");
           
           		while(rt.next()){
           			
           			String pathName = "F:/Earworm/src/main/webapp";
           			String fileName = rt.getString("songname");
           			String path = pathName + fileName;
           			
           	%>
           	
           	   <p><% out.println(fileName); %></p>
           	   <audio src="<%=fileName%>" type="audio/mp3" controls="controls"></audio>>		
           			
           	<% 		
           			
           		}
      	   
      	   %>
      	   
      	
      </div>
   </body>
</html>


