<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignalsManagement.aspx.vb" Inherits="SignalsManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        
       ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnGet" runat="server" Text="GET" />
        <br />
        <br />
    
        Signal&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtSignal" runat="server"></asp:TextBox>
        <br />
        <br />
        Status&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
        <br />
        <br />
        Opened <asp:TextBox ID="txtOpen" runat="server"></asp:TextBox>
        <br />
        <br />
        
        Closed&nbsp; <asp:TextBox ID="txtClose" runat="server"></asp:TextBox>
        <br />
        <br />
        
       
        Entry&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEntry" runat="server"></asp:TextBox>
        <br />
        <br />
        
        
        SL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtSL" runat="server"></asp:TextBox>
        <br />
        <br />
    
         Target&nbsp;&nbsp; <asp:TextBox ID="txtTarget" runat="server"></asp:TextBox>
        <br />
        <br />
    
        Profit&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtProfit" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="btnEdit" runat="server" Text="EDIT" Width="93px" />
        <br />
      
    
    </div>
    </form>
</body>
</html>
