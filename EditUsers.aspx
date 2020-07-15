<%@ Page Language="vb" AutoEventWireup="false" EnableViewState="true" Inherits="rpchost.EditUsers" CodeFile="EditUsers.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>EditUsers</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:TextBox id="txtStatus" style="Z-INDEX: 100; LEFT: 246px; POSITION: absolute; TOP: 120px"
				runat="server"></asp:TextBox>
			<asp:TextBox id="txtLevel" style="Z-INDEX: 114; LEFT: 246px; POSITION: absolute; TOP: 199px"
				runat="server"></asp:TextBox>
			<asp:Label id="Label5" style="Z-INDEX: 113; LEFT: 56px; POSITION: absolute; TOP: 200px" runat="server"
				CssClass="BlackTextBold">Level</asp:Label>
			<asp:Button id="btnMain" 
                style="Z-INDEX: 110; LEFT: 387px; POSITION: absolute; TOP: 323px" runat="server"
				Text="Main" Width="112px" CssClass="INPUTBUTTON" CausesValidation="False"></asp:Button>
            <asp:Button id="btnDelete" OnClientClick="return confirm('Are you sure you want to Delete user ?')"
                style="Z-INDEX: 110; LEFT: 248px; POSITION: absolute; TOP: 321px" runat="server"
				Text="Delete" Width="112px" CssClass="INPUTBUTTON" CausesValidation="False"></asp:Button>

			<asp:Label id="lblMess" 
                style="Z-INDEX: 109; LEFT: 564px; POSITION: absolute; TOP: 323px" runat="server"
				Width="136px"></asp:Label>
			<asp:Label id="lblID" 
                style="Z-INDEX: 108; LEFT: 247px; POSITION: absolute; TOP: 80px" runat="server"
				CssClass="BlackTextBold"></asp:Label>
			<asp:Label id="Label4" style="Z-INDEX: 107; LEFT: 56px; POSITION: absolute; TOP: 80px" runat="server"
				CssClass="BlackTextBold">ID</asp:Label>
			<asp:Label id="Label3" style="Z-INDEX: 106; LEFT: 8px; POSITION: absolute; TOP: 0px" runat="server"
				CssClass="INPUTBUTTON" Width="696px">Edit User</asp:Label>
			<asp:Button id="btnSubmit" style="Z-INDEX: 103; LEFT: 150px; POSITION: absolute; TOP: 319px"
				runat="server" Text="Edit" Width="80px" CssClass="INPUTBUTTON"></asp:Button>
			<asp:Label id="Label1" style="Z-INDEX: 104; LEFT: 56px; POSITION: absolute; TOP: 120px" runat="server"
				CssClass="BlackTextBold">Status</asp:Label>
			<asp:Label id="Label2" style="Z-INDEX: 105; LEFT: 56px; POSITION: absolute; TOP: 160px" runat="server"
				CssClass="BlackTextBold">DateRegister</asp:Label>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 111; LEFT: 431px; POSITION: absolute; TOP: 128px"
				runat="server" ErrorMessage="*" ControlToValidate="txtStatus"></asp:RequiredFieldValidator>
		    <p>
			<asp:Label id="Label6" 
                    style="Z-INDEX: 113; LEFT: 56px; POSITION: absolute; TOP: 238px" runat="server"
				CssClass="BlackTextBold">Last Payment Date</asp:Label>
			</p>
			<asp:TextBox id="txtDate" 
                style="Z-INDEX: 102; LEFT: 246px; POSITION: absolute; TOP: 159px" 
                runat="server"></asp:TextBox>
			<asp:checkbox id="chkSms" style="Z-INDEX: 114; POSITION: absolute; TOP: 277px; LEFT: 246px;"
				runat="server" autopostback=true></asp:checkbox>
			<asp:TextBox id="txtLastPayment" style="Z-INDEX: 114; POSITION: absolute; TOP: 237px; LEFT: 246px;"
				runat="server"></asp:TextBox>
		    <p>
			<asp:Label id="Label7" 
                    style="Z-INDEX: 113; LEFT: 56px; POSITION: absolute; TOP: 275px" runat="server"
				CssClass="BlackTextBold">SMS Notification</asp:Label>
			</p>
		</form>
	</body>
</HTML>
