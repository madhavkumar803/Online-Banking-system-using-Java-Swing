<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
  
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">function ctck() {var sds = document.getElementById("dum");}</script>
</head>
<body style="background-color:#E5E5E5">
<div id="top_links">
	<%@ include file="Header.jsp" %>
	<table style="width:897px; background:#FFFFFF; margin:0 auto;">
		<tr>
			<td width="300" valign="top" style="border-right:#666666 1px dotted;">
		   	<div id="services"><h1>Services</h1><br>
			    <ul>
		       	<li><a href="#">Personal Internet Banking</a></li>
            <li><a href="#">Corporate Internet Banking</a></li>
            <li><a href="#">Merchant Acquiring Business - POS</a></li>
            <li><a href="#">Online Tax / Payment / Receipt / Challan printing</a></li>
	        </ul>
	     	</div>
		  </td>
    	<td>  	
				<table border="1" cellpadding="10" cellspacing="0">
				<%
			    int accountno=Integer.parseInt(request.getParameter("accountno"));
					String username=request.getParameter("username");
					String password=request.getParameter("password");
					int amount=Integer.parseInt(request.getParameter("amount"));
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
					PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
					ps.setInt(1,accountno);
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						amount=amount+rs.getInt(4);
						PreparedStatement ps1=con.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
						ps1.setInt(1,amount);
						int p=ps1.executeUpdate();
						if(p>0)
						{
							out.print("<tr style='background-color:#000000; color:#FFFFFF;'><th>ACCOUNTNO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>GENDER</th><th>ADDRESS</th><th>PHONE</th></tr>");
		 					out.print("<tr style='background-color:#E5E5E5;'><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getLong(7)+"</td></tr>");
							out.print("<tr style='background-color:#E5E5E5;'><td colspan=7><h1>Your Balance has been successfully Updated</h1>"+"</td></tr>");
							out.print("<tr style='background-color:#E5E5E5;'><td colspan=7><h2>Your Balance Is : "+amount+"</h2></td></tr>");
	// 					<jsp:forward page="Totalbalance.jsp"></jsp:forward>
						} 
						else
						{
							out.print("<tr><td>"+"Please check your username and Password"+"</td></tr>");
	// 					<jsp:forward page="deposit1.jsp"></jsp:forward>
						}
					}
					else
					{
						out.print("<tr><td>"+"Please check your username/Password"+"</td></tr>");
	// 					<jsp:forward page="deposit1.jsp"></jsp:forward>
					}
				%>
			</table>
		</td>
	</table>
</div>
</body>
</html>






   
