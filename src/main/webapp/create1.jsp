<!DOCTYPE HTML>
<html>
<head>
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="js/create.js"></script>
</head>
<body>
<div id="top_links">
	<%@ include file="Header.jsp" %>
	<table style="width:897px; background-color:#FFFFFF; margin:0 auto;">
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
	    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>OPEN ACCOUNT FORM</h1><br>
   	    	<table  align="center" bgcolor="white">
						<tr>
							<td>
								<form name=F1 onSubmit="return dil(this)" action="create2.jsp" method="post">
						  		<table cellspacing="5" cellpadding="3">	
										<tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
										<tr><td>PASSWORD:</td><td> <input type="password" name="password"/></td></tr>
										<tr><td>RE-PASSWORD:</td><td> <input type="password" name="repassword"/></td></tr>
										<tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
										<tr><td>Gender:</td></tr>
										<tr><td>Male <input type="radio" name="gender" value="male"></td><td>Female <input type="radio" name="gender" value="female"/></td></tr>
										<tr><td>ADDRESS:</td><td> <input type="text" name="adderess"/></td></tr>
										<tr><td>PHONE:</td><td> <input type="text" name="phone"/></td></tr>
										<tr><td><input type="submit" name="btn" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
									</table>
	           		</form>
							</td>
						</tr>
					</table>
				</div>      
	    </td>
			<td width="299" valign="top">
		 		<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1>
		    	<center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center>
			  	<p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
			 </div>      
			</td>
   	</tr>
 	</table> 
	<div id="footer_top">
	  <div id="footer_navigation"></div>
	  <div id="footer_copyright">
	  	<center><img  alt="business"  width="196" height="106"></center>
	    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
	    <p>Copyright © Your Company Name</p>
    </div>
	</div>
	<script type="text/javascript">
	document.onload = ctck();
	</script>
</div>
</body>
</html>

