<!DOCTYPE html>
<html>
   <head>
      <title>Earworm</title>
	 <link rel="stylesheet" type="text/css" href="css/index.css"/>
	 <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
     <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
     <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
       
       <script type="text/javascript">
      	
      	$(document).ready(function(){
      		$('.welcomeTitle').hide().slideDown(1000);
      	});
        
        $(document).ready(function(){
        	$('.signInFormDiv').hide();
        	    $('#signIn').click(function(){
        		    $('.signInFormDiv').dialog({
        		        title: 'Sign In',
        		        width: 450,
        		        height: 200,
        		        modal: true
        	    });
        	});
        }); 

        $(document).ready(function(){
        	$('.signUpFormDiv').hide();
        	    $('#createAccount').click(function(){
        		    $('.signUpFormDiv').dialog({
        		        title: 'Sign Up',
        		        width: 450,
        		        height: 200,
        		        modal: true
        	    });
        	});
        });
        
      </script>

   </head>
   <body>
      <div class="welcomeTitle"> 
      	 <h1>Earworm</h1>
      	 <p>Discover musicians and their music from all over the world and share your own music</p>
      </div>
      
      <div class="signInSignUp">
      	 <input type="button" name="signIn" id="signIn" value="Sign In"/>
      	 <input type="button" name="createAccount" id="createAccount" value="Create Account"/>
      </div>
      
      <div class="signInFormDiv">
         <form name="signIn" id="signInForm" method="POST" action="authentication.jsp">
            <input type="text" name="username" id="username" placeholder="Username" size="38"/><br>	
            <input type="text" name="email" id="email" placeholder="Email" size="38"/><br>
            <input type="password" name="password" id="password" placeholder="password" size="38"/><br>
            <input type="submit" name="signInSubmit" id="signInSubmit" placeholder="Sign In"/>
         </form> 	
      </div>
       
      <div class="signUpFormDiv">
         <form name="signUp" id="signUpForm" method="POST" action="registration.jsp">
            <input type="text" name="Username" id="Username" placeholder="Username" size="38"/><br>	
            <input type="text" name="Email" id="Email" placeholder="Email" size="38"/><br>
            <input type="password" name="Password" id="Password" placeholder="password" size="38"/><br>
            <input type="submit" name="signUpSubmit" id="signUpSubmit" placeholder="Sign Up"/>
         </form> 	
      </div> 
      
      <div class="welcomeSearch">
         <form id="welcomeSearchBar" method="POST" action="searchResult.jsp">
         	<input type="text" name="searchBar" id="searchBar" placeholder="search for songs, artists, albums" size="90"/>
         	<input type="submit" name="searchBarSubmit" id="searchButton" value="Search" style="color: Black;" />
         </form> 	
      </div>
      
   </body>
</html>
