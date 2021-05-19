

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%
String id=request.getParameter("id");

    	session.setAttribute("id",id);
    	
%>
<style>

body  
{  
    background-image:url('regimg.jpg');	 
opacity: 0.9;
	background-size:cover;	
	background-repeat: no-repeat;
	background-position: center center ;
	background-attachment: fixed;
	

}

.input-style {
  width: 20%;
  padding: 8px 20px;
  margin-left:1%;
  box-sizing: border-box;
  border: none;
  background-color:white;
  color: black;
  font-size: 23px;
}

.button {
  background-color: aqua;
  color: black;
  padding: 12px 20px;
  text-align: center;
 
  display: inline-block;
  font-size: 20px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
 
  width: 25%;
   border-radius: 25px;
} 
    
    .button:hover {
  background-color: pink;
  color: black;
}
    
</style>

<h2 align="center"><strong><i>TRANSFER FROM:</i></strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" >

<tr bgcolor="cyan" >
    <td><b>Account Number</b></td>
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
       
    rs = st.executeQuery("select * from CUSTOMERS where acc_no='"+id+"' ");
    
    while(rs.next()){
  %> 
 
    <tr bgcolor="yellow" >

<td> <%=rs.getString(4) %>  </td>
<td><a href="transfer.jsp?id=<%=rs.getString(4) %>" ><%=rs.getString(1) %></a></td>
<td><%=rs.getString(2) %></td>
<td><i class='fas fa-rupee'></i><%=rs.getString(3) %></td>

</tr>
</table>
    
    <% 
}
}
 catch (Exception e) {
e.printStackTrace();
}
%>
   	 
<br>
<br><br>
<form action="TransferAction.jsp" method="post" align="center">
<H2>
<strong>Select customer to transfer to:</strong>


	<select class="input-style" name="transfer_to" required>
   
   <option>---</option>
   <%
try{ 
 Class.forName("oracle.jdbc.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","abc123");
      Statement st = con.createStatement();
       ResultSet rs1;
       
    rs1 = st.executeQuery("select * from CUSTOMERS  ");
    
while(rs1.next()){
%>
      	
     	 <option value=<%=rs1.getString(4) %> name="transfer_to"><%=rs1.getString(2) %> </option>
     <% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
   	 
   </select>
   
   
<br><br><br><br>

<strong>Enter Amount :</strong></i><input  class="input-style" type="number"  name="amount" required>
</H2>

<br>
<br>

<button align="center" class="button" type="submit">Transfer Money</button>



</form>












