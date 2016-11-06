<!-- CreateBook dispatches to this jsp -->
<!-- This file displays the l book count that was just created by the manager-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="sbtsapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
     <!-- Insert sbtsapp Logo-->
    <h1 align = "center"><img  align = "center" src= "images/booklogo.png" alt = "Book Logo" style= "width: 270px; height: 150px"></h1>
</head>
<body bgcolor = "#00BFFF">

<p>Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p>  <!--Get the firstname of the employee that is logged in and display it-->

<!-- Display options to the user -->

<a href="ViewContracts"><button type="button" style="float:right;">Back to List of Contracts</button></a>
<a href="BookList"><button type="button" style="float:center;">Go to List of Books</button></a>
<a href="MainPage.jsp"><button type="button" style="float:left;">Main Page</button></a>

<p align = "center">Book record has been created!</p>

<%
//Get the book that was just createrd and set in the bean
String [][] confirmbook = shared.getConfirmBook();
if(confirmbook != null && confirmbook.length != 0){
%>
<!-- Table used to display the information-->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- Table headers-->
     <th>Book ID</th>
     <th>Title</th>
	 <th>Start Date</th>
</tr>
<%
int count = 0;
//Create an array for the book
for(String[] book : confirmbook){
%>
<tr>
<!-- Display information from array that correlates to the columns used in the query -->
<td name="bookID" align="center"><%=book[0]%></td>
<td name="title" align="center"><%=book[1]%></td>
<td name="startdate" align="center"><%=book[2]%></td>
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
<p>There are no new books available.</p>
<%
} //End of else
%>
</body>


</html>
