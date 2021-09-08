<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript"></script>
</head>
<body>
<div id="top_links">
	<%@ include file="Header.jsp" %>
	<table style="width:897px; background:#FFFFFF; margin:0 auto;">
		<tr >
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
	    <td width="1200" valign="top">
				<table style='width:100%;' border=1px cellspacing=0 cellpadding="5">
					<%
	        	int accountno=Integer.parseInt(request.getParameter("accountno"));
	        	String username=request.getParameter("username");
						String password=request.getParameter("password");
						int amount=Integer.parseInt(request.getParameter("amount"));
						int test=0;
					 	Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
						PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			      ps.setInt(1,accountno);
						ResultSet rs=ps.executeQuery();
						if(rs.next())
						{
							test=rs.getInt(4);
							if(test>=amount)
							{
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
								PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno=?");
								ps1.setInt(1,(test-amount));
								ps1.setInt(2,accountno);
								int p=ps1.executeUpdate();
								if(p>0)
								{
									out.print("<tr style='background-color:#000; color:white;'><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>GENDER</th><th>ADDRESS</th><th>PHONE</th></tr>");
									out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+(rs.getInt(4)-amount)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getInt(7)+"</td></tr>");
									out.print("<tr><td colspan=7><h4>Your account No: "+accountno+" is debited with Rs. "+amount+" Available balance is Rs. "+(rs.getInt(4)-amount)+"</h4></td></tr>");
								}
							 	else
							 	{
								out.print("<tr><td>your transefar account number is incorrect</td></tr>");
							 	}
							}
							else
							{
								out.print("<tr><td>your account balace is insufficeant</td></tr>");
							}
							
						}
						else { out.print("<tr><td>Check your account number</td></tr>"); }
					%>
				</table>
			</td>
		</tr>
 	</table>
</div>
</body>
</html>
