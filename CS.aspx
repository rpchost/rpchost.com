<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:TextBox ID="txtUrl" runat="server" Text="" />
    <asp:Button Text="Capture" runat="server" OnClick="Capture" />
    <br />
    <asp:Image ID="imgScreenShot" runat="server" Height="500" Width="700" Visible="false" />
    </form>
</body>
</html>
