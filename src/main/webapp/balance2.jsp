<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet">
	<script src="balance.js" type="text/javascript"></script>
</head>
<body>
<div id="top_links">
	<%@ include file="Header.jsp" %>
	<table style="width:100%; background:#FFFFFF; margin:0 auto;">
		<tr>
			<td valign="top" style="border-right:#666666 1px dotted;">
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
        	String username=request.getParameter("username");
					String password=request.getParameter("password");
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
					PreparedStatement ps=con.prepareStatement("Select * from newaccount where accountno=?");
       		ps.setString(1,request.getParameter("accountno"));
					ResultSet rs=ps.executeQuery();
					out.print("<table border='1' align='left' cellspacing='0' cellpadding='10'>" );
					out.print("<tr style='background-color:#000000; color:#FFFFFF;'><th>ACCOUNT&nbsp;NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>GENDER</th><th>ADDRESS</th><th>PHONE</th></tr>");
					while(rs.next())
					{
						if(((rs.getString(2)).equals(username))&&((rs.getString(3)).equals(password)))
						{
				    int accountno1=rs.getInt(1);
						session.setAttribute("accountno",accountno1);
						out.print("<tr style='background-color:#E5E5E5;'>");
						out.print("<td>" + rs.getInt(1) + "</td>");
						out.print("<td>" + rs.getString(2) + "</td>");
						out.print("<td>" + rs.getString(3) + "</td>");
						out.print("<td>" + rs.getInt(4) + "</td>");
						out.print("<td>" + rs.getString(5) + "</td>");
						out.print("<td>" + rs.getString(6) + "</td>");
						out.print("<td>" + rs.getString(7) + "</td></tr>");
						out.print("<tr style='background-color:#E5E5E5;'><td colspan='7'><h1>Your Available Balance is : "+rs.getInt(4)+"<h1></td></tr>");
						}
						else { out.print("Your username or passward is wrong"); }
					}
				%>
				</table>
			</td>
		</tr>
  </table>
</div>
</body>
</html>