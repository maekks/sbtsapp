/******************************************************************************************

BookList.java

The purpose of this servlet is to process the list of books that need to be assigned a shepherd.

   + This servlet is invoked by MainPage.jsp
   + This servlet dispatches to BookList.jsp

******************************************************************************************/

package maxapp;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import maxapp.DBI;
import maxapp.Control;
import maxapp.Shared;

public class BookList extends maxapp.Control{
    protected DBI dbi;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
    //Call the method to get the list of books
    getBooks(bean);
    gotoPage("/BookList.jsp", request, response); //dispatch to BookList.jsp

    }

    //Method to retrieve the list of books that need a shepherd
private void getBooks(maxapp.Shared bean) throws ServletException, IOException{
        String[][] books;
        maxapp.DBI dbi = null;
try{
    dbi = new maxapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        //Call the method from the DBI
        books= dbi.getBooks();
         //Set the list of Books so that it can be called in the jsp page
        bean.setBooks(books);
        }
}

catch(Exception e){
    e.printStackTrace();
    bean.setError("Servlet Exception error" +e);
}

finally{
      dbi.close();//Close connection to database
}
}
}//End of Class
