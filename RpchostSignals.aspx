<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="RpchostSignals.aspx.vb" Inherits="RpchostSignals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trading signals</title>
    <meta http-equiv="refresh" content="20">
    
    <LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView  style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server"
				Font-Size="X-Small" Font-Names="Verdana" ShowFooter="True" CellPadding="4"
				BorderWidth="1px" BorderStyle="None" BorderColor="#CC9966" 
         BackColor="White"
				Height="1px" ID="grdSignals" Width=100% runat="server">
        
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
