<!-- ??  dispatches to this jsp -->
<!-- This file -->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="SBTS.Shared" />
     <!-- Insert SBTS Logo-->
    <h1 align = "center"><img  align = "center" src= "images/booklogo.png" alt = "Book Logo" style= "width: 270px; height: 150px"></h1>
</head>
<body bgcolor = "#00BFFF">
                        <jsp:getProperty name="shared" property="message"/>  <!--retrieves the error message from the shared bean -->
                        <jsp:getProperty name="shared" property="error"/>  <!--retrieves the error data from the shared bean -->
                        <jsp:setProperty name="shared" property="message" value=""/><!-- empty error message from the shared bean -->
                        <jsp:setProperty name="shared" property="error" value=""/> <!-- empty error data from the shared bean -->

<p>Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p> <!-- welcome message -->

<!--  the links redirect to other pages -->

<a href="ViewTaskDetails.jsp"><button type="button" style="float:right;">Back to Assign Task</button></a>
<a href="MainPage.jsp"><button type="button" style="float:left;">Main Page</button></a>
<%
//get the roles from shared module
String [][] designers = shared.getDesigners();
String [][] editors = shared.getEditors();
String [][] admins = shared.getAdmins();
String status = shared.getChooseTaskStatus();

//If it's design work
if(status.equals("Design a Cover") || status.equals("Design a Promotion")){
%>
<h2 align="center">Designers</h2>

<%
if(designers != null && designers.length != 0){
%>
<!-- create table -->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- table header -->
     <th>Employee ID</th>
     <th>Designer First Name</th>
     <th>Designer Last Name</th>
	 <th>Number of Tasks Assigned to</th>
     <th>Select</th>
<tr>
<%
int count =0;
//create row as many as designer remained there
for(String[] design : designers){
%>
<tr>
<!-- table header  -->
<td name="designerID" align="center"><%=design[0]%></td>
<td name="firstname" align="center"><%=design[2]%></td>
<td name="lastname" align="center"><%=design[1]%></td>
<td name="designcount" align="center"><%=design[3]%></td>
<td name = "TechID2" align="center">
					<form id="TechID2<%=count%>" method="POST" action="ConfirmTechParallel"> <!--  -->
					       <input type="submit" name="Submit" value="Select"/> <!--  -->
					       <input type="hidden" name="TechID2" value="<%=count%>" /> <!--   -->
						   </form>
</td>
</tr>
<%
count++;
}//end of for loop
%>
</table>
<%
}//End of inner if statement
else
{
%>
<p>There are no Designers</p>
<%
}//End of else statement
}//End of outer if statement

//If the work related to galley
else if(status.equals("Galley 1") || status.equals("Galley 2") || status.equals("Galley 3")){
%>

<h2 align="center">Editors</h2>
<%
if(editors != null && editors.length != 0){
%>
<!-- create the table  -->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- table header  -->
     <th>Employee ID</th>
     <th>Editor First Name</th>
     <th>Editor Last Name</th>
	 <th>Number of Tasks Assigned to</th>
     <th>Select</th>
<tr>
<%
int count =0;
for(String[] edit : editors){
%>
<tr>
<!-- the table content  -->
<td name="editorID" align="center"><%=edit[0]%></td>
<td name="firstname" align="center"><%=edit[2]%></td>
<td name="lastname" align="center"><%=edit[1]%></td>
<td name="editcount" align="center"><%=edit[3]%></td>
<td name = "TechID2" align="center">
					<form id="TecID2<%=count%>" method="POST" action="ConfirmTechParallel"> <!--   -->
					       <input type="submit" name="Submit" value="Select"/> <!--  -->
					       <input type="hidden" name="TechID2" value="<%=count%>" /> <!--   -->
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
<p>There are no Editors</p>
<%
}//end of else statement
}//end of outer else if statement

//If it's the scanning ISBN Publish work
else if(status.equals("Scanning") || status.equals("ISBN") || status.equals("Publish")){
%>

<h2 align="center">Admins</h2>
<%
if(admins != null && admins.length != 0){
%>
<!-- create the table -->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- table header -->
     <th>Employee ID</th>
     <th>Administrator First Name</th>
     <th>Administrator Last Name</th>
	 <th>Number of Tasks Assigned to</th>
     <th>Select</th>
<tr>
<%
int count =0;
//create row for each admin exist there
for(String[] admin : admins){
%>
<tr>
<!-- the content of each row  -->
<td name="adminID" align="center"><%=admin[0]%></td>
<td name="firstname" align="center"><%=admin[2]%></td>
<td name="lastname" align="center"><%=admin[1]%></td>
<td name="admincount" align="center"><%=admin[3]%></td>
<td name = "TechID2" align="center">
					<form id="TechID2<%=count%>" method="POST" action="ConfirmTechParallel"> <!--   -->
					       <input type="submit" name="Submit" value="Select"/> <!--  -->
					       <input type="hidden" name="TechID2" value="<%=count%>" /> <!--  -->
						   </form>
</td>
</tr>
<%
count++;
}//end of for loop
%>
</table>
<%
} //end of inner if statement
else
{
%>
<p>There are no Admins</p>
<%
}//end of else
}//end of outer else if statement
%>

</body>


</html>
