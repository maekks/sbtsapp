<!-- ViewBooksNotPublsihed dispatches to this jsp -->
<!-- This file displays the list of books that still need a shepherd -->
<!DOCTYPE HTML>
<html>
<head>
    <jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <title>Book List</title>
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
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>
        <h4 align="center" style="color: #9E9E9E; padding: 30px 0; padding-top: 80px;">Books That Are Not Yet Published</h4>
    <%
    //Get the list of books that were set in the bean
    String [][] books = shared.getBooksNotPublished();
    if(books != null && books.length != 0){
    %>
    <!-- Table used to display information-->
    <table class="table table-hover">
        <thead>
            <tr>
            <!-- Table headers-->
                 <th>Employee Name</th>
                 <th>Title</th>
                 <th>Start Date</th>
                 <th>Status</th>
            </tr>
        </thead>
    <%
    int count = 0;
    //Create an array for the books
    for(String[] book : books){
    %>
    <tr>
    <!-- Display information from array that correlates to the columns used in the query -->
        <td name="Employee Name" align="center"><%=book[0]%> <%=book[1]%></td>
        <td name="Book Title" align="center"><%=book[2]%></td>
        <td name="Start Date" align="center"><%=book[3]%></td>
        <td name="Book Status" align="center"><%=book[4]%></td>
    </tr>
    <%
    count++;
    }//end of for loop
    %>
    </table>
    <%
    } //End of if
    else
    {
    %>
    <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
      There are no new books available.
    </div>

    <%
    } //End of else
    %>
    </div>
</body>
</html>
