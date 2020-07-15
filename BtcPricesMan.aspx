<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BtcPricesMan.aspx.vb" Inherits="BtcPricesMan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BTC PRICES</title>
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>
    
</head>
<body>
    <form id="form1" runat="server">
   <table align=center width=700>
   
   <tr>
    <td align=center  class="head10" colspan=3>
        BTC PRICES
        MANUAL</td>
   </tr>
   
   
    <tr>
    <td height=50>
        
    </td>
   </tr>
   
    
   
   
    <tr>
    <td class="head10">
       EUR Price
    </td>
       
     <td>
     <asp:TextBox ID="txtEurPrice" runat="server"></asp:TextBox>
      </asp:TextBox>
     
    </td>
   </tr>
    <tr>
    <td class="head10">
       USD Price
    </td>
       
     <td>
     <asp:TextBox ID="txtUsdPrice" runat="server"></asp:TextBox>
      </asp:TextBox>
     
         <asp:Button ID="btcGenerate"
            runat="server" Text="Generate" width=100 />
            
    </td>
   </tr>
  
    <tr>
    <td height=10>
        
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       Front EUR Ask
    </td>
       
     <td>
     <asp:TextBox ID="txtFrontEurAsk" runat="server"></asp:TextBox>
      </asp:TextBox>
     
    </td>
   </tr>
   
   <tr>
    <td class="head10">
       Front EUR Bid
    </td>
       
     <td>
      <asp:TextBox ID="txtFrontEurBid" runat="server"></asp:TextBox>
     
     
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       Front USD Ask
    </td>
       
     <td>
     
      <asp:TextBox ID="txtFrontUsdAsk" runat="server"></asp:TextBox>
      </asp:TextBox>
    </td>
   </tr>
   
   <tr>
    <td class="head10">
       Front USD Bid
    </td>
       
     <td>
      <asp:TextBox ID="txtFrontUsdBid" runat="server"></asp:TextBox>
     
     
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       Ask Commission
    </td>
       
     <td class=RednormalText>
      <asp:TextBox ID="txtAskCommission" runat="server"></asp:TextBox>
     
     
    &nbsp;exchange commission Ask rate (0.50%)</td>
   </tr>
   
   <tr>
    <td class="head10">
       Bid Commission
    </td>
       
     <td class=RednormalText>
      <asp:TextBox ID="txtBidCommission" runat="server"></asp:TextBox>
     
     
         exchange commission Bid rate (0.50%)</td>
   </tr>
   
   
   
   
   <tr>
    <td  height=20>
       
    </td>
       
     <td>
      
     
     
    </td>
   </tr>
   
   <%--<tr>
    <td class="head10">
       Commision
    </td>
       
     <td>
      <asp:TextBox ID="txtCommission" runat="server"></asp:TextBox>
     
     
    </td>
   </tr>--%>
   
    <%--<tr>
    <td >
        
    </td>
       
     <td>
      
     <asp:checkbox runat=server id=chkComm cssClass=BlacknormalText Text="Activate Payments Commissions"></asp:checkbox>
     
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       Crd Cd Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtCrdCdCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       Paypl Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtPayplCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       Bank Transfer Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtBankCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
    <tr>
    <td class="head10">
       PM Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtPMCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
   <tr>
    <td class="head10">
       WU Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtWUCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
   <tr>
    <td class="head10">
       Revolut Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtRevCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
   <tr>
    <td class="head10">
       OMT Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtOMTCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>
   
   <tr>
    <td class="head10">
       TransferWise Commission
    </td>
       
     <td>
      <asp:TextBox ID="txtWiseCommission" runat="server" maxlength=4></asp:TextBox>
     
     
    </td>
   </tr>--%>
   
    <tr>
    <td>
       
    </td>
       
     <td height=100>
     
      </asp:TextBox><asp:Button ID="btcSubmit"
            runat="server" Text="Submit" width=100 />
            
       </asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnMain"
            runat="server" Text="MAIN" />
    </td>
   </tr>
   
   </table>
    </form>
</body>
</html>
