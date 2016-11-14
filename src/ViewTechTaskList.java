/******************************************************************************************

ViewTechTaskList.java

The purpose of this servlet is to get the tasks from database belong to the logged in Technician

   + This servlet is invoked by MainPage.jsp
   + This servlet dispatches to ViewTechTaskList.jsp

******************************************************************************************/

package sbtsapp;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import sbtsapp.DBI;
import sbtsapp.Control;
import sbtsapp.Shared;

public class ViewTechTaskList extends sbtsapp.Control{
    protected DBI dbi;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    sbtsapp.Shared bean = (sbtsapp.Shared)session.getAttribute("shared");
    //Get the id of the employee who is logged in
    int thistechid = bean.getEmpId();
   //Call the method that gets the tasks belonging to the tech
   getTechTaskList(bean, thistechid);
    gotoPage("/ViewTechTaskList.jsp", request, response); //Dispatch to ViewTechTaskList.jsp to show the task list

    }

    //Method to get the list of tasks belonging to a tech
private void getTechTaskList(sbtsapp.Shared bean, int empid) throws ServletException, IOException{
	// create a DBI shell
        sbtsapp.DBI dbi = null;
	// make a matrix to hold the task list of data
    String[][] techTaskList;
try{
    // create an instance of the DBI
    dbi = new sbtsapp.DBI();
    //Check if there is a database connection to Tomcat
    if(dbi.connect()){
        // Get the tasksfrom the DB for this tech and hold them in a matrix
        techTaskList = dbi.getTechTaskList(empid);
        bean.setTechTaskList(techTaskList);



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