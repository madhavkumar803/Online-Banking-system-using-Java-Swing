<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Private Bank</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="js/transfer.js"></script>
</head>
<body>
<div id="top_links">
	<%@ include file="Header.jsp" %>
	<table style="width:800px; background:#FFFFFF; margin:0 auto;">
		<tr >
			<td width="100" valign="top" style="border-right:#666666 1px dotted;">
    		<div id="services"><h1>Services</h1><br>
		    	<ul>
        		<li><a href="#">Personal Internet Banking</a></li>
            <li><a href="#">Corporate Internet Banking</a></li>
            <li><a href="#">Merchant Acquiring Business - POS</a></li>
            <li><a href="#">Online Tax / Payment / Receipt / Challan printing</a></li>
          </ul>
        </div>
			</td>
	    <td width="450" valign="top">
    		<div id="welcome" style="border-right:#666666 1px dotted;"><h1>TRANSFER FORM</h1><br>
					<form name=F1 onSubmit="return dil(this)" action="transfer2.jsp" >
			    	<table cellspacing="5" cellpadding="3">
					    <tr><td>ACCOUNT NO:</td><td> <input type="text" name="accountno"/></td></tr>
							<tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
							<tr><td>PASSWORD:</td><td> <input type="password" name="password"/></td></tr>
							<tr><td>TARGET ACCOUNT NO:</td><td><input type="text" name="taccountno"/></td></tr>
							<tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
							<tr><td><input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
						</table>
	    		</form>
    		</div>
			</td>    
    	</td>
   		<td width="250" valign="top">
    		<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
    			<p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
    		</div>      
   		</td>
 		</tr>
	</table>   
	<div id="footer_top">
  	<div id="footer_navigation"></div>
  	<div id="footer_copyright" >
    	<center><img  alt="business"  width="196" height="106"></center><br>
	    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
  		<p>Copyright ? Your Company Name</p>
  	</div>
	</div>>
</div>
</body>
</html>
