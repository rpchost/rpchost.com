<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestSignals.aspx.vb" Inherits="TestSignals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
<table>
    
    
    <tr>
        <td>
            <asp:Label ID="lblCode" runat="server" Text=""></asp:Label>-Code
        </td>
    </tr>
    
    <tr>
        <td>
            <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>-Date
        </td>
    </tr>
    
    <tr>
        <td>
            <asp:Label ID="lblExpiryDate" runat="server" Text=""></asp:Label>-Expiry
        </td>
    </tr>
    
    
     <tr>
        <td>
            <asp:Label ID="lblMess" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    
</table>
    </form>
</body>
</html>
