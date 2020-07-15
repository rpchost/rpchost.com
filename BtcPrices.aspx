<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BtcPrices.aspx.vb" Inherits="BtcPrices" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BTC PRICES</title>
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>
    
</head>
<body>
    <form id="form1" runat="server">
   <table align=center width=700>
   
   <tr>
    <td align=center  class="head10" colspan=3>
        BTC PRICES
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
    <td  class="head10">
                ASK [EUR]
    </td>
       
     <td>
        <asp:TextBox ID="txtAskEur" autopostback=true runat="server"></asp:TextBox>
        
        &nbsp;&nbsp;
        
        <span class=BlackTextBold> Epayments + 1122 </span> </td>
   </tr>
   
    <tr>
    <td  class="head10">
                BID [EUR]
    </td>
       
     <td>
        <asp:TextBox ID="txtBidEur" autopostback=true runat="server"></asp:TextBox>
         &nbsp;&nbsp; 
         <span class=BlackTextBold> Epayments - 500</span>
         
         </td>
   </tr>
   
   <tr>
     <td height=30>
       </td>
   </tr>
   
    <tr>
    <td  class="head10">
                ASK [USD]
                
                
    </td>
       
     <td>
        <asp:TextBox ID="txtAskUsd" runat="server"></asp:TextBox>
        
         &nbsp;&nbsp;
        
        <span class=BlackTextBold> Epayments + 1520 </span> </td>
        
    </td>
   </tr>
   
    <tr>
    <td  class="head10">
        BID [USD]
    </td>
       
     <td>
        <asp:TextBox ID="txtBidUsd" runat="server"></asp:TextBox>
         &nbsp;&nbsp; 
         <span class=BlackTextBold> Epayments - 770</span>
         
    </td>
   </tr>
   
   
   <tr>
     <td height=30>
       </td>
   </tr>
   
    <tr>
    <td  class="head10">
        EUR/USD Buy Rate
    </td>
       
     <td>
        <asp:TextBox ID="txtRate" autopostback=true runat="server"></asp:TextBox>
        
        <a href="https://www.hellenicbank.com/portalserver/hb-en-portal/useful-tools/currency-converter" class=RednormalText target=_blank > Hellenic Rate </a>
    </td>
   </tr>
   
    <tr>
    <td  class="head10">
        EUR/USD Sell Rate
    </td>
       
     <td>
        <asp:TextBox ID="txtSellRate" runat="server"></asp:TextBox>
    </td>
   </tr>
   
   
    <tr>
    <td height=30>
       
        </td>
       
     <td>
    </td>
   </tr>
   
   
  <%-- <tr>
    <td class="head10">
       Reserve
    </td>
       
     <td>
         <asp:TextBox ID="txtReserve" runat="server"></asp:TextBox>
    </td>
   </tr>--%>
   
    <tr>
    <td height=30>
       
        </td>
       
     <td>
     
     <asp:Label runat=server id=lblLastUpdatedPrice class=RednormalText></asp:Label>
     
    </td>
   </tr>
   
   
    <tr>
    <td class="head10">
       Front EUR Ask
    </td>
       
     <td>
     <asp:TextBox ID="txtFrontEurAsk" AutoPostBack=true runat="server"></asp:TextBox>
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
     
      <asp:TextBox ID="txtFrontUsdAsk" runat="server" AutoPostBack=true></asp:TextBox>
      </asp:TextBox><asp:Button ID="btnUSD"
            runat="server" Text="Get EURUSD" width=115px />
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



       	<tr>
                                                                              <td align="center" colspan="2">
                                                                                  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></td>
                                                                              </tr>


       <tr>
                                                                              <td align="center"  colspan="2">
                                                                                <script type="text/javascript">
	atOptions = {
		'key' : '10b7f767e2a3a6373ac4b54d0ba8bef4',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
	document.write('<scr' + 'ipt type="text/javascript" src="http' + (location.protocol === 'https:' ? 's' : '') + '://www.hiprofitnetworks.com/10b7f767e2a3a6373ac4b54d0ba8bef4/invoke.js"></scr' + 'ipt>');
</script></td>
                                                                              </tr>
   
   </table>
    </form>
</body>
</html>
