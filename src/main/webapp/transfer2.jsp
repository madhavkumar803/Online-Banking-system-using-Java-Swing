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
				<table style='width:100%;'>
				<% 	
					int accountno=Integer.parseInt(request.getParameter("accountno"));
					String username=request.getParameter("username");
					String password=request.getParameter("password");
					int taccountno=Integer.parseInt(request.getParameter("taccountno"));
					int amount=Integer.parseInt(request.getParameter("amount"));
					int test=0,res=amount;
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/online_banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
					PreparedStatement ps=con.prepareStatement("Select * from newaccount where accountno=?");
					ps.setInt(1,accountno);
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						test=rs.getInt(4); 
						PreparedStatement ps1=con.prepareStatement("Select * from newaccount where accountno=?");
				    ps1.setInt(1,taccountno);
						ResultSet rs1=ps1.executeQuery();
						if(rs1.next())
						{
							if(amount<=test)
							{
								amount=amount+rs1.getInt(4);
								PreparedStatement ps2=con.prepareStatement("update newaccount set amount=? where  accountno='"+taccountno+"'");
								ps2.setInt(1,amount);
								ps2.executeUpdate();
								int p=ps2.executeUpdate();
								if(p>0)
								{
									PreparedStatement ps3=con.prepareStatement("update newaccount set amount=? where  accountno='"+accountno+"'");
									ps3.setInt(1,(test-res));
									ps3.executeUpdate();
									out.print("<tr><td><h1>Your account was debited by "+res+"<br/> Your toatal balcance is "+(test-res)+"</h1></td></tr>");
								}
								else { out.print("<tr><td><h1>Please check your target accountno</h1></td></tr>"); }
							}
							else { out.print("<tr><td><h1>amount is less then your balabce</h1></td></tr>"); }
						}
						else { out.print("<tr><td><h1>check your transfer account nuber</h1></td></tr>"); }
					}
					else { out.print("<tr><td><h1>Check your account number</h1></td></tr>"); }
				%>
				</table>
			</td>
		</tr>
	</table>
</div>
</body>
</html>