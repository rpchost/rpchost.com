<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StopStartPayments.aspx.vb" Inherits="StopStartPayments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ASK/BID Management</title>
    
    <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">


</head>
<body>
    <form id="form1" runat="server">
   <table>
   
   <tr>
    <td align=center colspan=2 class="head09">
       ASK/BID Management
    </td>
   </tr>
   
   
    <tr>
    <td height=50>
        
    </td>
   </tr>
   
   
   <tr>
    <td>
       
    </td>
   </tr>
  
     
    <tr>
    <td class="head09">
        BTC ASK
    </td>
       
     <td>
        <asp:TextBox ID="txtBtcAskMin" runat="server" MaxLength=5></asp:TextBox>
        
        &nbsp;&nbsp;
          <asp:TextBox ID="txtBtcAskMax" runat="server" MaxLength=5></asp:TextBox>
        &nbsp;&nbsp; EUR
    </td>
   </tr>
   
    <tr>
    <td class="head09">
        BTC BID
    </td>
       
     <td>
        <asp:TextBox ID="txtBtcBidMin" runat="server" MaxLength=5></asp:TextBox>
    &nbsp;&nbsp; 
    <asp:TextBox ID="txtBtcBidMax" runat="server" MaxLength=5></asp:TextBox>
    </td>
   </tr>
   
   
    <tr>
    <td class="head09">
        ASK MESSAGE
    </td>
       
     <td>
        <asp:TextBox ID="txtAskMessage" width=500 runat="server"></asp:TextBox>
    </td>
   </tr>
   
    <tr>
    <td class="head09">
        BID MESSAGE
    </td>
       
     <td>
        <asp:TextBox ID="txtBidMessage" width=500 runat="server"></asp:TextBox>
    </td>
   </tr>
   
    
    <tr>
    <td class="head09">
        Buy BTC Reserve
    </td>
       
     <td>
        <asp:TextBox ID="txtBuyReserve" width=155 runat="server"></asp:TextBox>
        &nbsp; &nbsp; EUR
        
    </td>
   </tr>
   
   <tr>
    <td class="head09">
        Sell BTC Reserve
    </td>
       
     <td>
        <asp:TextBox ID="txtSellReserve" width=155 runat="server"></asp:TextBox>
         &nbsp; &nbsp; BTC
        
    </td>
   </tr>
   
    <tr>
    <td height=50>
       
    </td>
      
     <td>
     
     <asp:Label ID=lblMess runat=server CssClass=RednormalTextBold></asp:Label>
     
    </td>
   </tr>
   
    <tr>
    <td>
        
    </td>
       
     <td>
     
     <asp:Button ID="btcSubmit"
            runat="server" Text="Submit" Width="104px" style="height: 29px" />
            
       </asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnMain"
            runat="server" Text="MAIN" />
    </td>
   </tr>
   
   </table>
    </form>
</body>
</html>
