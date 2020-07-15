<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GetCrddata.aspx.vb" Inherits="GetCrddata" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
    
    
    <tr>
       <td>
           CR
        <asp:TextBox ID="Cr" width=250 CssClass=bluetext MaxLength=8  runat="server" ></asp:TextBox>
       </td> 
    </tr>
    
     <tr>
       <td>
           EM
        <asp:TextBox ID="EM" width=250 CssClass=bluetext MaxLength=8  runat="server" ></asp:TextBox>
       </td> 
    </tr>
    
     <tr>
       <td>
           EY
        <asp:TextBox ID="EY" width=250 CssClass=bluetext MaxLength=8  runat="server" ></asp:TextBox>
       </td> 
    </tr>
    
     <tr>
       <td>
           CC
        <asp:TextBox ID="CC" width=250 CssClass=bluetext MaxLength=8  runat="server" ></asp:TextBox>
       </td> 
    </tr>
    
    </table>
    </form>
</body>
</html>
