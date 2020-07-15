<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UpdatebtcPrice.aspx.vb" Inherits="UpdatebtcPrice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <script type="text/javascript" language="javascript">
    function getHtml(txtbox)
    {
        var src = document.documentElement.innerHTML;
        document.forms[0]['txtHtmlSrc'].value = src;
    }
    </script>
</head>
<body>
   <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnViewHtml" runat="server" Text="View Html" />
        <br />
        <br />
        <asp:TextBox ID="txtHtmlSrc" runat="server" Height="235px" TextMode="MultiLine" Width="542px"></asp:TextBox></div>
    </form>
</body>
</html>
