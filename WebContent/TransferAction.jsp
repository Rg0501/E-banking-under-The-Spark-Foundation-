
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%
String id=session.getAttribute("id").toString();

String transfer_to = request.getParameter("transfer_to");
int amount = Integer.parseInt(request.getParameter("amount"));
int current_amnt=0;



Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","abc123");
	
Statement st = con.createStatement();
	    
	    ResultSet rs = st.executeQuery("select * from customers where acc_no='"+id+"' ");
	    while(rs.next()){	
	     current_amnt=rs.getInt(3);}
	    int net_amnt = current_amnt - amount ;
		st.executeUpdate("update customers set CURRENT_BALANCE='"+net_amnt+"' where acc_no='"+id+"'  ");
		
		
		ResultSet rs1 = st.executeQuery("select * from customers where acc_no='"+transfer_to+"' ");
	    while(rs1.next()){
	     current_amnt=rs1.getInt(3);}
	    int net_amnt2 = current_amnt + amount ;
		st.executeUpdate("update customers set CURRENT_BALANCE='"+net_amnt2+"' where acc_no='"+transfer_to+"'  ");
			    
		
		response.sendRedirect("customer-record.jsp?msg=transferred");
	    
%>