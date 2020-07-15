<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DeleteSignals.aspx.vb" Inherits="Rpchost.DeleteSignals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
  	<form id="Form1" method="post" runat="server">
			<asp:Label id="Label1" style="Z-INDEX: 100; LEFT: 40px; POSITION: absolute; TOP: 72px" runat="server"
				CssClass="BlackTextBold">From</asp:Label>
			<asp:Button id="Button3" style="Z-INDEX: 109; LEFT: 232px; POSITION: absolute; TOP: 176px" tabIndex="5"
				runat="server" Width="112px" Text="Delete ALL" CssClass="INPUTBUTTON"></asp:Button>
			<asp:Button id="btnEdit" 
                style="Z-INDEX: 108; LEFT: 712px; POSITION: absolute; TOP: 174px" runat="server"
				Width="112px" Text="Edit Signal" CssClass="INPUTBUTTON" tabIndex="6"></asp:Button>
			<asp:label id="Label16" style="Z-INDEX: 107; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server"
				Width="976px" CssClass="INPUTBUTTON"> &nbsp;DELETE SIGNALS</asp:label>
			<asp:Label id="lblMess" 
                style="Z-INDEX: 106; LEFT: 366px; POSITION: absolute; TOP: 232px" runat="server"
				Width="248px" CssClass="RednormalText"></asp:Label>
			<asp:TextBox id="txtTo" style="Z-INDEX: 103; LEFT: 352px; POSITION: absolute; TOP: 72px" runat="server"
				Width="104px" tabIndex="3"></asp:TextBox>
			<asp:Label id="Label2" style="Z-INDEX: 101; LEFT: 296px; POSITION: absolute; TOP: 72px" runat="server"
				CssClass="BlackTextBold">To</asp:Label>&nbsp;
			<asp:TextBox id="txtFrom" style="Z-INDEX: 102; LEFT: 96px; POSITION: absolute; TOP: 72px" runat="server"
				Width="104px" tabIndex="1"></asp:TextBox>
			<asp:Button id="Button1" style="Z-INDEX: 104; LEFT: 40px; POSITION: absolute; TOP: 176px" runat="server"
				Width="152px" Text="Delete FROM - TO" CssClass="INPUTBUTTON" tabIndex="5"></asp:Button>
		    <p>
			<asp:Button id="Button4" 
                    style="Z-INDEX: 108; LEFT: 376px; POSITION: absolute; TOP: 176px" runat="server"
				Width="112px" Text="Main" CssClass="INPUTBUTTON" tabIndex="6"></asp:Button>
			</p>
		</form>
</body>
</html>
