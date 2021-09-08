<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript"></script>
</head>
<body>
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
	   	<td width="1200" valign="top">
				<table>
				<%
					int accountno=Integer.parseInt(request.getParameter("accountno"));
			    String username=request.getParameter("username");
					String password=request.getParameter("password");
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
					PreparedStatement ps=con.prepareStatement("delete from NEWACCOUNT where accountno='"+accountno+"'");
					int p=ps.executeUpdate();
					if(p>0)
					{
						out.print("&nbsp;&nbsp;&nbsp;your account no "+accountno+" has closed.");
					}
					else { out.print("check your account no"); }
					
				%>
				</table>
			</td>
		</tr>
 	</table>
</div>
</body>
</html>
