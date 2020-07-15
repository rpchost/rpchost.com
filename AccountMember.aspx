<%@ Page Language="vb" AutoEventWireup="false" Inherits="rpchost.AccountMember" CodeFile="AccountMember.aspx.vb" %>
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
		<META NAME="KEYWORDS" CONTENT="fundamental alerts, technical alerts">
		<META NAME="ABSTRACT" CONTENT="The BEST Forex signals online - www.Rpchost.com . We provide real time forex signals, free forecasts.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		
		<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
		<script language="javascript">
		
		function ff()
		{
			//document.Form1.timeTell.value=Date();
		}
		
				
		</script>
		
		
		<script>

//Hide status bar msg javascript

function hidestatus(){
window.status=''
return true
}

if (document.layers)
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT)

document.onmouseover=hidestatus
document.onmouseout=hidestatus
</script> 

		
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
alert(message);
return false;
}
}
}
if (document.layers) {
document.captureEvents(Event.MOUSEDOWN);
}
document.onmousedown=click;
// --> </script>
	</HEAD>
	<body onload="ff()" bgcolor=WhiteSmoke>
		<form id="Form1" method="post" runat="server">
			<TABLE WIDTH="790" BORDER="0" CELLSPACING="0" CELLPADDING="0" align=center>
				<tr>
					<td style="HEIGHT: 24px" valign="top">
						<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="0" bgcolor="#990000">
							<TR>
								<TD>&nbsp;
									<asp:Label id="lblMem" runat="server" Width="264px" CssClass="head02" ForeColor="White"></asp:Label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<asp:Label id="Label1" runat="server" Width="113px" CssClass="head02" ForeColor="White">New York DateTime</asp:Label>&nbsp;
									<asp:Label id="txtDate" runat="server" Width="144px" CssClass="head02" ForeColor="White">New York DateTime</asp:Label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<asp:Button id="Button2" runat="server" CssClass="INPUTTEXTbtn" Width="96px" Text="Close Window"></asp:Button>
								</TD>
							</TR>
						</TABLE>
					</td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<TR>
					<TD>
						<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="0" bordercolor="#000000">
							<TR>
								<TD>
									<TABLE WIDTH="20" BORDER="1" CELLSPACING="1" CELLPADDING="1" bordercolor="#000000">
										<TR>
											<TD class="bluetext" bgColor="#ffce00">
												Fundamental Alerts
											</TD>
										</TR>
										<TR>
											<TD class="bluetext" height="100">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<asp:Button id="Button1" runat="server" Width="153px" Text="Trade The News"></asp:Button>
											</TD>
										</TR>
										<TR>
											<TD class="bluetext" bgColor="#ffce00">
												Technical Alerts
											</TD>
										</TR>
										<TR>
											<TD class="bluetext" height="300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<!--<iframe src="Alerts.aspx" height="305" width="320" scrolling="auto" frameborder="no">
												</iframe>-->
												<asp:Button id="Button3" runat="server" Width="153px" Text="Technical Signals"></asp:Button>
											</TD>
										</TR>
										<TR>
											<TD class="bluetext" bgColor="#ffce00">
												<!--Technical Analysis-->
											</TD>
										</TR>
										<TR>
											<TD>
												<iframe  height="155" width="320" scrolling="auto" frameborder="no">
												</iframe>
											</TD>
										</TR>
									</TABLE>
								</TD>
								<TD WIDTH="440">
									<iframe name="AlertDet" height="100%" width="100%" scrolling="auto" frameborder="no">
									</iframe>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
