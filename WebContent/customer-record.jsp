
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<br>
<style>
h2 {
  background-color: black;
  color: white;
}
  
 a:hover {
      background-color: #ddd;
      color: red;}

table td {

    font-size: 23px;
    
  }
body{
		bgcolor="Bisque";
}

</style>

            <a href="home.jsp">Home<i class="fa fa-home"></i></a>


<%
String msg=request.getParameter("msg");
if("transferred".equals(msg))
{
	%>
		
		<h2> Transction Successfully!</h2>
		<%} %>
		
		<br>
		<h1 align="center"><font><strong>Customer Record</strong></font></h1>
		
		<h3 color="green">please select any customer name for transction</h3>
		
		<table align="center" cellpadding="5" cellspacing="5" border="1" >
		<tr bgcolor="cyan" >
		<td><b>ACCOUNT NO.</b></td>
		<td><b>NAME</b></td>
		<td><b>Email</b></td>
		<td><b>CURRENT BALANCE</b></td>
		
		</tr>
		
<%
try{ 
 Class.forName("oracle.jdbc.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","abc123");
      Statement st = con.createStatement();
       ResultSet rs;
       
    rs = st.executeQuery("select * from CUSTOMERS");
    
		while(rs.next())
		{
		%>
		<tr bgcolor="yellow" >
		
		<td> <%=rs.getString(4) %>  </td>
		<td><a href="transfer.jsp?id=<%=rs.getString(4) %>" ><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><i class='fas fa-rupee'></i><%=rs.getString(3) %></td>
		
		</tr>
		
		<% 
		}

	}

catch (Exception e) {
e.printStackTrace();
}
%>
</table>























