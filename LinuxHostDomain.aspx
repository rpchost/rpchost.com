<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinuxHostDomain.aspx.cs" Inherits="LinuxHostDomain" %>

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
                Account Type : Linux hosting
            </td>
        </tr>
        <tr>
            <td>
                Duration (Months)  : 12
            </td>
        </tr>
        
          <tr>
            <td>
               Domain Name *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     www.<asp:TextBox 
                    ID="txtUrl" runat="server" Width="377px"></asp:TextBox>
            </td>
        </tr>
        
       
          <tr>
            <td>
               <asp:Button ID="btnBuy" runat="server" Text="Continue" onclick="btnBuy_Click" />
            </td>
        </tr>
        
   </table>
    </form>
</body>
</html>
