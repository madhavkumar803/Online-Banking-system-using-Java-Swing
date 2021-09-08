<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<SCRIPT src="js/create.js" LANGUAGE="JavaScript"></SCRIPT>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript"> function ctck() { var sds = document.getElementById("dum"); }</script>
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
 				<table border="1px" width="100%" align="center" bgcolor="white" cellspacing="0" cellpadding="5px">
					<%
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
						PreparedStatement ps=con.prepareStatement("insert into newaccount (USERNAME,PASSWORD,AMOUNT,GENDER,ADDRESS,PHONE) values (?,?,?,?,?,?)");
						ps.setString(1,request.getParameter("username"));
						ps.setString(2,request.getParameter("password"));
						ps.setInt(3,Integer.parseInt(request.getParameter("amount")));
						ps.setString(4,request.getParameter("gender"));
						ps.setString(5,request.getParameter("adderess"));
						ps.setInt(6,Integer.parseInt(request.getParameter("phone")));
						int p=ps.executeUpdate();
						
						if(p>0)
						{
							
					PreparedStatement ps1=con.prepareStatement("select ACCOUNTNO from newaccount where USERNAME=?");
						ps1.setString(1,request.getParameter("username"));
						ResultSet rs=ps1.executeQuery();
						
						if(rs.next())
						{
							out.print("<tr><td><h2>Congratulations! Your account has been created.</h2></td></tr><tr><td><h2>Your account number is : "+rs.getInt(1)+"</h2></td></tr>");
							%><table><tr><td><button onclick="window.print()">Click to print the current page.</buttton></td></tr></table><%
						}
						else
						{
							out.print("<tr><td>table nahi bana</td></tr>");
						}
						} 
						else
						{
							out.print("<tr><td>table nahi hiiiiiiiiiiii  bana</td></tr>");
						}
					%>
				</table>      
			</td>
		</tr>
	</table>
	<div id="footer_top">
  	<div id="footer_navigation"></div>
  	<div id="footer_copyright" >
			<center><img  alt="business"  width="196" height="106"></center><br>
	    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
  		<p>Copyright © Your Company Name</p>
 		</div>
	</div>
	<script type="text/javascript"> document.onload = ctck(); </script>
</div>
</body>
</html>

