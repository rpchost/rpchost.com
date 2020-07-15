<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DeleteNews.aspx.vb" Inherits="rpchost.DeleteNews" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>

		<title>Delete News</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
		
		
	</HEAD>
<body>
    <form id="form1" runat="server">

    
    <br />
    <br />
    <br />
<asp:Label id="Label3" style="Z-INDEX: 106; LEFT: 8px; POSITION: absolute; TOP: 0px" runat="server"
				CssClass="INPUTBUTTON" Width="696px">Delete News</asp:Label>
    
    <asp:DropDownList ID="ddNews" CssClass="INPUTTEXT" runat="server" Height="21px" Width="225px">
    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="INPUTBUTTON" Width="135px" />

    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Main" CssClass="INPUTBUTTON" 
        Width="82px" />
    <p>
        &nbsp;</p>

    </form>
</body>
</html>
