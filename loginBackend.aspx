<%@ Page Language="vb" AutoEventWireup="false" Inherits="rpchost.loginBackend" CodeFile="loginBackend.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
	
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
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
		<META NAME="KEYWORDS" CONTENT="forex">
		<META NAME="ABSTRACT" CONTENT="The BEST Forex signals online - www.Rpchost.com . We provide real time forex signals, free forecasts.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		
		<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="lblMess" style="Z-INDEX: 107; LEFT: 408px; POSITION: absolute; TOP: 270" runat="server"
				Width="228px" Height="23px" ForeColor="Red"></asp:Label>
			<asp:Label id="Label3" style="Z-INDEX: 106; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server"
				Width="100%" CssClass="BlueText" Height="25" BackColor="#ffcc66"></asp:Label>
			<asp:Label id="Label2" 
                style="Z-INDEX: 102; LEFT: 474px; POSITION: absolute; TOP: 136px; width: 118px;" 
                runat="server" CssClass="BlackTextBold">Password</asp:Label>&nbsp;
			<asp:TextBox id="txtUsrName" style="Z-INDEX: 103; LEFT: 586px; POSITION: absolute; TOP: 101px; width: 174px;"
				runat="server" CssClass="INPUTTEXT" tabIndex="5"></asp:TextBox>
			<asp:Label id="Label4" height=25 style="Z-INDEX: 108; LEFT: 500; POSITION: absolute; TOP: 0px" runat="server"
				CssClass="BlueText" Width="262px" BackColor="#FFCC66">RPCHOST HEADQUARTER CENTER</asp:Label>
		    <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
			<asp:TextBox id="txtPsw" 
                style="Z-INDEX: 104; LEFT: 586px; POSITION: absolute; TOP: 138px; width: 173px;" 
                runat="server" CssClass="INPUTTEXT" tabIndex="10" TextMode="Password"></asp:TextBox>
			<asp:Label id="Label1" 
                style="Z-INDEX: 101; LEFT: 474px; POSITION: absolute; TOP: 104px; width: 117px;" 
                runat="server" CssClass="BlackTextBold">User Name</asp:Label>
			<p>
			<asp:Button id="Button1" 
                    style="Z-INDEX: 105; LEFT: 519px; POSITION: absolute; TOP: 216px; width: 183px;" tabIndex="15"
				runat="server" CssClass="INPUTBUTTON" height=40 Text="Log In"></asp:Button>
			</p>
		</form>
	</body>
</HTML>
