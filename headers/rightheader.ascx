<%@ Control Language="vb" AutoEventWireup="false" Inherits="rightheader" CodeFile="rightheader.ascx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" >
    <title>Untitled Page</title>
    
   <%-- <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">--%>
    
 <script>
     function switchHeight() {
         document.getElementById('cell').height = window.innerHeight - 100;
     } 
</script>
        
</head>

<body onload="switchHeight()">

		<table cellSpacing="0" cellPadding="0" width=170 border="0" height=100%>
		<tr>
		<td id=cell valign=top class="TDRightHeader3">
		
		<table cellSpacing="0" cellPadding="0" border=0 width="100%" >
		
		
		    <tr>
				<td height="45">
			    
			       <a href="default.aspx"  title="Rpchost.com"> <img src="logo.gif" alt="Rpchost Logo" />	</a>
				
				</td>
			</tr>
			
			<tr>
				<td class="INPUTTITLETEXT" vAlign="middle" height="24" align=center>
				          <%--<asp:Label runat=server ID="lblBTC" CssClass="head00_8">
				          
				          </asp:Label>--%>
				</td>
			</tr>
			<tr>
				<td width="100%" bgColor="#ffffff" height="1"></td>
			</tr>
			
			
			
			<tr>
				<td vAlign="middle" width="100%" bgColor="#3366CC" align=center  height="22">
				
				
				
				    <asp:Label runat=server ID="lblSession" CssClass="whitetext"></asp:Label>
						
				
				</td>
			</tr>
			<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>
			
			<tr>
				<td  vAlign="middle" align=center height="10">
						
				<span id="siteseal"><script async type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=8DEbHxFP1KiZeLPcZ6LcEHxFOPmLCkKnqhvn6sQYctRwtnbnd0IyLHzPMW9H"></script></span>
				</td>
			</tr>
			
			<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>
			<tr>
				<td width="100" height="10"></td>
			</tr>
			
		<%--	<tr>
				<td  vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="LendingProgram.aspx"  title="Lending Program">
						<DIV class="head01">&nbsp;&nbsp;&nbsp;&nbsp;Cryptocurrencies Program</DIV>
					</A>
				</td>
			</tr>--%>
			<%--<tr>
				<td  vAlign="middle" width="130" height="24" align="center">
						<DIV class="head01_9">&nbsp;&nbsp;&nbsp;&nbsp;Bitcoin Trading</DIV>
					
				</td>
			</tr>--%>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Account.aspx"  title="Account">
						<DIV class="head00">&nbsp;Account</DIV>
					</A>
				</td>
			</tr>
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Deposit.aspx"  title="Deposit">
						<DIV class="head00">&nbsp;Deposit</DIV>
					</A>
				</td>
			</tr>
			
				<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Exchange.aspx"  title="Exchange">
						<DIV class="head00">&nbsp;Exchange</DIV>
					</A>
				</td>
			</tr>
			
			--%>
			
			
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="BuyBitcoins.aspx"  title="Buy Bitcoin With Paypal or Credit Card without verification">
						<DIV class="head00">&nbsp;Buy Bitcoin</DIV>
					</A>
				</td>
			</tr>--%>
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Exchange.aspx"  title="Exchange">
						<DIV class="head00">&nbsp;Buy/Sell</DIV>
					</A>
				</td>
			</tr>

            	<tr>
				<td width="100"  height="20"></td>
			</tr>


			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="BuyBitcoin.aspx"  title="Deposit">
						<DIV class="head00">&nbsp;Deposit</DIV>
					</A>
				</td>
			</tr>
			
            	<tr>
				<td width="100"  height="20"></td>
			</tr>
			
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Withdraw.aspx"  title="Withdraw">
						<DIV class="head00">&nbsp;Withdraw</DIV>
					</A>
				</td>
			</tr>
            	<tr>
				<td width="100"  height="20"></td>
			</tr>

			
			<%--  <tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Transactions.aspx"  title="Transactions History">
						<DIV class="head00">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Transactions</DIV>
					</A>
				</td>--%>
			</tr>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="SellBitcoins.aspx"  title="Sell Bitcoin and receive money to your Paypal or Bank account">
						<DIV class="head00">&nbsp;Sell Bitcoin</DIV>
					</A>
				</td>
			</tr>--%>
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Lending.aspx"  title="Sell Bitcoin and receive money to your Paypal or Bank account">
						<DIV class="head00">&nbsp;Lend Bitcoin</DIV>
					</A>
				</td>
			</tr>

            	<tr>
				<td width="100"  height="20"></td>
			</tr>
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="100%" height="24"><A style="TEXT-DECORATION: blink" href="AccountVerification.aspx"  title="Verify your account to buy bitcoin with Credit Card">
						<table><tr><td><DIV class="head00">Verification</DIV> </td>
						<td><asp:Image ImageUrl="~/picture/Verified.jpg" runat=server ID=imgVer/> </td>
						</tr></table>
						
						
					</A>
				</td>
			</tr>

            	<tr>
				<td width="100"  height="20"></td>
			</tr>
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="BtcSignal.aspx"  title="Bitcoin Signals Prediction">
						<DIV class="head00">&nbsp;Bitcoin Signals</DIV>
					</A>
				</td>
			</tr>
			
				<tr>
				<td width="100"  height="20"></td>
			</tr>
			
			
			
		<%--	<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Offers.aspx"  title="Offers posted by people who want to sell Crypto with cheap prices">
						<DIV class="head00">&nbsp;Hot deals</DIV>
					</A>
				</td>
			</tr>--%>
			
			
			
			
		<%--	<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Withdraw.aspx"  title="Fees">
						<DIV class="head00">&nbsp;Withdraw info</DIV>
					</A>
				</td>
			</tr>--%>
			
				<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Fees.aspx"  title="Fees">
						<DIV class="head00">&nbsp;Fees</DIV>
					</A>
				</td>
			</tr>

            	<tr>
				<td width="100"  height="20"></td>
			</tr>
			
            	<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>

			<tr>
				<td class="TDRightHeader3" vAlign="middle" align="center" width="130" height="24"><A style="TEXT-DECORATION: blink" href="TermsConditions.aspx"  title="Terms and Conditions">
						<DIV class="head00">&nbsp;Terms & Conditions</DIV>
					</A>
				</td>
			</tr>

            	<tr>
				<td width="100"  height="20"></td>
			</tr>

            	<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>
			
				<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" align="center" height="24"><A style="TEXT-DECORATION: blink" href="privatepolicy.aspx"  title="Privacy policy">
						<DIV class="head00">&nbsp;Privacy policy</DIV>
					</A>
				</td>
			</tr>

            	<tr>
				<td width="100"  height="20"></td>
			</tr>

            
			
			<%--<tr>
				<td  class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="LendingProgram.aspx"  title="Lending Program">
						<DIV class="head00">&nbsp;Lending</DIV>
					</A>
				</td>
			</tr>--%>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="invest.aspx"  title="Invest">
						<DIV class="head00">&nbsp;Invest / Withdraw</DIV>
					</A>
				</td>
			</tr>--%>
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="history.aspx"  title="Transactions History">
						<DIV class="head00">&nbsp;Transactions History</DIV>
					</A>
				</td>
			</tr>--%>
			
		  
			
		
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="ProfitCalculator.aspx"  title="Profit Calculator">
						<DIV class="head00">&nbsp;Profit Calculator</DIV>
					</A>
				</td>
			</tr>--%>
			
			
			<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>
			
			<tr>
				<td width="100"  height="5"></td>
			</tr>
			
		<%--	<tr>
				<td  vAlign="middle" width="130" height="24">
						<DIV class="head01_9">&nbsp;&nbsp; &nbsp;Trading Signals</DIV>
					
				</td>
			</tr>
			
			
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Signals.aspx"  title="Live Signals">
						<DIV class="head00">&nbsp;EURUSD - BTCEUR</DIV>
					</A>
				</td>
			</tr>
			
			<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>--%>
			
			
		
			
			<%--<tr>
				<td  vAlign="middle" width="130" height="24">
						<DIV class="head01_9">&nbsp;&nbsp; &nbsp;Articles</DIV>
					
				</td>
			</tr>--%>
			
			
			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" align="center"><A style="TEXT-DECORATION: blink" href="ForexArticles.aspx"  title="Forex and Cryptocurrency Articles">
						<DIV class="head00"> &nbsp;Investment Articles</DIV>
					</A>
				</td>
			</tr>
			
            	<tr>
				<td width="100"  height="20"></td>
			</tr>

			
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="FreeForexSignal.aspx"  title="Free Forex Signal">
						<DIV class="head00"> Free Forex Signals</DIV>
					</A>
				</td>
			</tr>--%>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="issueIndicator.aspx"  title="Our products">
						<DIV class="head00">&nbsp;Our products</DIV>
					</A>
				</td>
			</tr>--%>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Ex4_To_Mq4.aspx"  title="Ex4 to Mq4 Decompiler">
						<DIV class="head00"> Ex4 To Mq4</DIV>
					</A>
				</td>
			</tr>--%>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Forex-Strategies.aspx"  title="Forex Strategies">
						<DIV class="head00"> Forex Strategies</DIV>
					</A>
				</td>
			</tr>--%>
			
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="ForexArticles.aspx"  title="Forex Articles">
						<DIV class="head00"> Forex Articles</DIV>
					</A>
				</td>
			</tr>--%>
			<%--<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="forextrading.aspx"  title="Forex Trading">
						<DIV class="head00"> Forex Trading</DIV>
					</A>
				</td>
			</tr>--%>
			
			<tr>
				<td width="100"  height="5"></td>
			</tr>
			<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>
			
			
			<tr>
				<td class="TDRightHeader3" align="center" vAlign="middle" width="130" height="24"><A style="TEXT-DECORATION: blink" href="Sitemap.aspx"  title="Sitemap">
						<DIV class="head00">&nbsp;Site Map</DIV>
					</A>
				</td>
			</tr>
            	<tr>
				<td width="100"  height="15"></td>
			</tr>

			
			<tr>
				<td width="100" bgColor="#ffffff" height="1"></td>
			</tr>
			
			<tr>
				<td width="100"  height="15"></td>
			</tr>
			
			
			<tr>
				<td  vAlign="middle" width="100%" height="10" align=center>
						<div class=head01 align=center> Total Investments </div>
					
				</td>
			</tr>
            <tr>
				<td width="100"  height="5"></td>
			</tr>

			
			<tr>
				<td class="TDRightHeader3" vAlign="middle" width="130" height="18" align=center>
						<div class=head01> <asp:Label runat=server ID=lblTotalInvestments></asp:Label> </div>
					
				</td>
			</tr>
			
			<tr>
				<td width="100"  height="20"></td>
			</tr>
	
			
		<%--	<tr>
				<td width="100"  ><asp:Label runat=server ID=lblDateTime></asp:Label></td>
			</tr>
			--%>
			
			<tr>
				<td  vAlign="middle" width="130" align=center valign=middle>
						<div class=head00_8_5>
						
						
					<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="TimerTime" runat="server">
        </asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Label ID="lblDateToday" runat="server"></asp:Label>
                <asp:Label ID="lblTime" runat="server"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="TimerTime" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
        <br />--%>
        
        
						<asp:Label runat=server ID=lblDateTime></asp:Label>
						
						</div>
					
				</td>
			</tr>
		
			
			</table>
		
	</body>
	
</html>
