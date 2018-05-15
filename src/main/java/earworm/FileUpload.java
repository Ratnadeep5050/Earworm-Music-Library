package earworm;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.sql.*;
import javax.sql.*;
import java.lang.*;

import java.util.List; 
import java.io.*;

public class FileUpload extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 PrintWriter out = response.getWriter();
		
        try {
        	
        	ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
    		List<FileItem> multiFiles = sf.parseRequest(request);
        	
            for(FileItem item : multiFiles) {
        	    item.write(new File("F:/Earworm/src/main/webapp/" + item.getName()));
        	    out.println(item.getName());

        	    String username = (String)request.getSession().getAttribute("username");
        	    
        	    Class.forName("com.mysql.jdbc.Driver");
                
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/earworm","root","");
                
                Statement st = con.createStatement();
                ResultSet rt;
                int i = st.executeUpdate("INSERT INTO songs(Username,Songname) VALUES ('"+username+"','"+item.getName()+"')");
                
                response.sendRedirect("profile.jsp");
            }
        }
        catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/*protected void addSong(String songName) {
		
		String song = songName;
		String username = (String)session.getAttribute("username");
		session.getAttribute("username");
		
		Class.forName("com.mysql.jdbc.Driver");
        
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/earworm","root","");
        
        Statement st = con.createStatement();
        ResultSet rt;
        int i = st.executeUpdate("INSERT INTO songs(Username,Songname) VALUES ('"+username+"','"+song+"')");
        
		
	}*/

}
