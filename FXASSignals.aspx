<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FXASSignals.aspx.vb" Inherits="FXASSignals" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Rpchost.com - the best FOREX SIGNALS online</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="TITLE" CONTENT="Rpchost.com - the best FOREX SIGNALS online">
		<META NAME="SUBJECT" CONTENT="Forex predictions, forecasts, analysis">
		<META NAME="PLACENAME" CONTENT="Forex traders land">
		<META NAME="CREATOR" CONTENT="Joseph Chalhoub">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<META NAME="DESCRIPTION" CONTENT="The BEST Forex signals online - www.Rpchost.com . We provide real time free forex signals, free forecasts, education resources for forex traders.">
		<META NAME="KEYWORDS" CONTENT="forex trader, artificial intelligent, automated forex system">
		<META NAME="ABSTRACT" CONTENT="The BEST Forex signals online - www.Rpchost.com . We provide real time forex signals, free forecasts.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		<LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
			<script type="text/javascript">
<!-- Begin
/* This script and many more are available free online at
The JavaScript Source!! http://javascript.internet.com
Created by: Lee Underwood

Because this is a true refresh, you might want to put a
notice on the page that it refreshes every "X" minutes */

function reFresh() {
  //this.location.reload(true)
 // window.location.reload( false )


}
/* Set the number below to the amount of delay, in milliseconds,
you want between page reloads: 1 minute = 60000 milliseconds. */
//window.setInterval("reFresh()",4000);
// End -->
			</script>
			<script language="JavaScript"> <!--
// No rightclick script v.2.5
// (c) 1998 barts1000
// barts1000@aol.com
// Don't delete this header!

var message="Sorry, that function is disabled"; // Message for the alert box

// Don't edit below!

function click(e) {
if (document.all) {
if (event.button == 2) {
alert(message);
return false;
}
}
if (document.layers) {
if (e.which == 3) {
alert(message)	;
return false;
}
}
}
if (document.layers) {
document.captureEvents(Event.MOUSEDOWN);
}
document.onmousedown=click;
// --> </script>
			<script language="JavaScript"> 
//Hide status bar msg javascript

function hidestatus(){
window.status='Rpchost.com - Lebanon Beirut - Joseph@Rpchost.com'
return true
}

function hidestatus1(){
window.status='Rpchost.com - Lebanon Beirut - Joseph@Rpchost.com'
return true
}

if (document.layers)
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT | Event.KEYPRESS | Event.KEEYDOWN)

document.onmouseover=hidestatus
document.onmouseout=hidestatus
document.onkeypress=hidestatus1
document.onkeydown=hidestatus1
			</script>
			<script language="JavaScript"> 
//Hide status bar msg javascript

function DisableF5(){

//alert(event.keyCode);
		

if (event.keyCode == 116) 
{
event.keyCode=0;
alert ('Sorry! You can not refresh this page!');
event.returnValue = false;
return false;
}


}
			</script>
	</HEAD>
	<body bgcolor="gainsboro" topmargin="0"  leftmargin="0" onkeydown="DisableF5()"
		onkeypress="DisableF5()" onload="DisableF5()">
		<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0" >
			<TR vAlign="top">
				<TD width="100%" height="100%" valign=top align=left>
					<form id="Form1" method="post" runat="server">
					
					
						<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0" >
							<TR vAlign="top">
							
							
							
								
								<TD width="100%" valign=top>
									<table align="center" border="0" height="100%" width="100%">
									
									
				                     <tr>
					                    <td  colspan=3>
						                    <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#990000">
							                    <TR>
								                    <TD colspan=3>
								                    &nbsp;
									                    <asp:Label id="lblMem" runat="server" Width="264px" CssClass="head02" ForeColor="White"></asp:Label>
									                    
									                    <asp:Label id="Label1" runat="server" Width="213px" CssClass="head02" ForeColor="White">Signals Time [GMT+2]</asp:Label>
									                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    									
								                    </TD>
							                    </TR>
						                    </TABLE>
					                    </td>
				                    </tr>
				
				
				<tr>
				    <td height=10></td>
				</tr>
				
										<tr>
											
											<td valign=top>
												<TABLE borderColor="#000000" border="0" cellSpacing="0" cellPadding="0" width="100%" align="center">
													<TBODY>
														
														<%--<tr><td  height=38></td></tr>--%>
				
														<tr>
															<td height="10" width="100%" valign="top" class="BlackTextBold" bgcolor="whitesmoke">Trading 
																Signals</td>
														</tr>
														<TR>
															
															
															
															<TD valign="top" height="100%"><iframe name="SqwakBox" onload="hidestatus()" src="TradingSignals.aspx?UserID=<%=Session("UserID")%>" frameBorder="no" width="100%" scrolling="auto" height="100%"></iframe>
															<!--<TD valign="top" height="227"><iframe name="SqwakBox" onload="hidestatus()" src="http://localhost/ForexAlertsPRO/TradingSignals.aspx?userID=<%=Session("UserID")%>"-->
															</TD
														</TR>
														<tr>
															<td bgColor="dimgray" height="4"></td>
														</tr>
														<tr>
															<td height="10" valign="top" class="BlackTextBold" bgcolor="whitesmoke">
																Finished Signals</td>
														</tr>
														<TR>
															
															<TD height="260"><iframe name="SqwakBox" src="FinishedSignals.aspx?userID=<%=Session("UserID")%>" frameBorder="no"
																	width="100%" scrolling="auto" height="300"></iframe>
																	<!--<TD height="260"><iframe name="SqwakBox" src="http://localhost/ForexAlertsPRO/FinishedSignals.aspx?userID=<%=Session("UserID")%>" frameBorder="no"
																	width="100%" scrolling="auto" height="300"></iframe>-->
																	
															</TD>
														</TR>
														
													
											</td>
										</tr>
									</table>
								</TD>
							</TR>
							
						</TABLE>
				</TD>
			</TR>
		</TABLE>
		</FORM></TD></TR></TBODY></TABLE>
	</body>
</HTML>

