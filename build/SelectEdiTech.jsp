<!-- SelectTech dispatches to this jsp -->
<!-- This jsp displays the list of Technicians and their task count, and gives the user the option to select a Tech to assign to a task-->
<!DOCTYPE HTML>
<html>
    <head>
        <jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
        <link rel="stylesheet" href="resource/css/bootstrap.min.css">
        <link rel="stylesheet" href="resource/css/main.css">
        <title>Select Tech</title>
    </head>
    <body>
        <div class="container">
            <div class="text-xs-center logo">
                <img  align = "center" class = "rounded" src= "resource/images/booklogo.png" alt = "Book Logo" style= "width: 270px; height: 150px">
            </div>
            <div class="message-panel">
                <% if(shared.getMessage() != ""){ %>
                <div class="alert alert-success" role="alert">
                  <jsp:getProperty name="shared" property="message"/>
                </div>
                <%}%>

                <% if(shared.getError() != ""){ %>
                <div class="alert alert-warning" role="alert">
                  <jsp:getProperty name="shared" property="error"/>
                </div>
                <%}%>

                <jsp:setProperty name="shared" property="message" value=""/><!-- empty error message from the shared bean -->
                <jsp:setProperty name="shared" property="error" value=""/> <!-- empty error data from the shared bean -->
            </div>
            <p class="lead">Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p> <!--Get the firstname of the employee that is logged in and display it-->
            <!-- Buttons redirect user to other pages -->
            <div class="btn-group" role="group" aria-label="Basic example" style="float: right;">
              <a class="btn btn-secondary btn-sm" href="ViewTaskDetails">Back to Assign Task</a>
              <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
            </div>
            <!-- Display task type options to the user -->
            <%
            //Get the list of designers, Editors, or Admins depending on the task type selected that were set in the bean

            String [][] editors = shared.getEditors();
            String status = shared.getChooseTaskStatus();
            %>

            <h2 align="center">Editors</h2>
            <%
            if(editors != null && editors.length != 0){
            %>
            <!-- Table used to display the information -->
            <table class="table table-hover">
                <thead>
                    <tr>
                        <!-- Table headers -->
                        <th>Employee ID</th>
                        <th>Editor First Name</th>
                        <th>Editor Last Name</th>
                        <th>Number of Tasks Assigned to</th>
                        <th>Select</th>
                    <tr>
                </thead>
            <%
            int count =0;
            //Create an array for each editors
            for(String[] edit : editors){
            %>
            <tr>
            <!-- Display information from array that correlates to the columns used in the query -->
                <td name="editorID" align="center"><%=edit[0]%></td>
                <td name="firstname" align="center"><%=edit[2]%></td>
                <td name="lastname" align="center"><%=edit[1]%></td>
                <td name="editcount" align="center"><%=edit[3]%></td>
                <td name = "TechID" align="center">
                    <form id="TechID<%=count%>" method="POST" action="ConfirmTech"> <!-- each tech has its own form -->
                           <input type="submit" name="Submit" value="Select" class="btn btn-outline-primary btn-sm"/> <!-- submit tech selected ConfirmTech servlet-->
                           <input type="hidden" name="TechID" value="<%=count%>" /> <!-- send row index of the selected tech -->
                    </form>
                </td>
            </tr>
            <%
            count++;
            }//end of for loop
            %>
            </table>
            <%
            }//end of inner if statement
            else
            {
            %>
            <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
                <p>There are no Editors</p>
            </div>
            <%
            } //end of else
            %>
        </div>
    </body>

</html>
