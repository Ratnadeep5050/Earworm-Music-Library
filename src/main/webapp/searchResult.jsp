<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Profile</title>
	  		<link rel="stylesheet" type="text/css" href="css/searchResult.css"/>
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
		<h1>Search Results ... ... </h1>
		 
		   <%@page import= "java.sql.*" %>
      	   <%@page import= "javax.sql.*" %>
      	   <%@page import= "java.io.FileInputStream" %>
      	   <%@page import= "java.io.PrintWriter" %>
      	   
      	   <% 
      	   
      	   	    if(request.getParameter("searchBarSubmit") != null){
      	   	    	
      	   	    	String songName = request.getParameter("searchBar");
      	   	    	
      	   	   		Class.forName("com.mysql.jdbc.Driver");
               
          			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/earworm","root","");
          
          			Statement st = con.createStatement();
          			ResultSet rt;
          			rt = st.executeQuery("SELECT songname FROM songs WHERE songname='"+songName+"'");
          
          			while(rt.next()){
          			
          				String pathName = "F:/Earworm/";
          				String fileName = rt.getString("songname");
      	   	    
          				
           	%>
           	
           	   <p id="song-name"><% out.println(fileName); %></p>
           	   <audio src="<%=fileName%>" type="audio/mp3" controls="controls"></audio>>		
           			
           	<% 		
           			
           			}
          	
      	   	    }
      	   	    else{
      	   	    	out.println("Noshto");
      	   	    }
      	   
      	   %>
	</body>
</html>