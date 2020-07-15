<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Deposit_Bitcoin_Custom.aspx.vb" Inherits="Deposit_Bitcoin_Custom" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>

<HTML>
	<head>
      		
   		<title>Cryptocurrency trading | Online forex trading | free forex signals</title>
   		
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best online forex signals - Rpchost.com provides real time free fx trading signals, technical and fundamental alerts, the best online resource for automated forex trading.">
		<META NAME="KEYWORDS" CONTENT="forex, forex trading, foreign exchange, forex signals, online forex trading, currency, free, technical analysis, forex trading signals">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form2" runat=server>
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
										border="0">
										<TR>
											<TD width="100%" colSpan="3">
											
												<%--<uc2:right runat="server" id="Right1"></uc2:right>--%>
											</TD>
										</TR>
										
										<TR>
											<TD colSpan="3"></TD>
										</TR>
										
										<TR>
											<TD vAlign="top" height="100%" width=100%>
												<table cellSpacing="0" cellPadding="0" height="100%" width=100%>
													<tr>
														<td >
															<uc1:right runat="server" id="Right2"></uc1:right>
														</td>
													</tr>
												</table>
											</TD>
											<TD vAlign="top" width="100%" height="100%">
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<tr>
														<td vAlign="top" align=left>
															<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
																<TR>
																	<TD align=left bgcolor="#3366cc">
																		<uc4:right runat="server" id="Right3"></uc4:right>
																	</TD>
																</TR>
															</TABLE>
														</td>
													</tr>
													<TR><td height=1></td></tr>
													<tr>
														<td align="left" colSpan="4">
															
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		<div class=head09 >BITCOIN DEPOSIT</div>
																	
																	</td>
													</TR>
													<TR>
														<td height="15">
														</td>
													</TR>
													<TR>
														<td Height="115" valign="top" >
															<TABLE width="100%" height="130" class="BlackSmallText10" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																<TR>
																
																<td width=6></td>
																
																	<TD valign="top" >
																	
																	  <table width="100%">
																	  
																	  
																	   <tr>
																	          <td class="head05" width="100%" align=center>
																	           
        																	          Creating Money Since 2006 </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	      <tr>
																	          <td class="head06">
        																	          <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>
															                  </TD>
																	      </tr>
																	      
                                                                          <tr>
																	          <td height=40>
        																	          
															                  </TD>
																	      </tr>
																	      
																	       <tr>
																	          <td align=center>
																	           
																	                  <table border=0>
																	          
																	          
																	           <tr> 
																	                <td align=center class=RednormalTextBold>
																	                
																	                
																	                
																	               Incorrect withdrawal or Deposit addresses are not refundable. Be sure you send BTC to the correct address.
																	                
																	                    
																	                    </td>
																	            </tr>
																	            
																	            
																	              <tr> 
																	                <td height=30>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	             
																	            
																	              <tr> 
																	                <td align=center class=RednormalText>
																	                
																	                   <%--This BTC amount will change every 1 minute--%>
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	            
																	            <tr> 
																	                <td class=head09_13>
																	                Send BTC amount to Rpchost.com Bitcoin wallet
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center>
																	               <asp:TextBox runat=server ID=txtBitcoinAddress Width=280 CssClass=BlueText Enabled=false>3QAWKRpuoqjH3BjSTgFXCBjg3QUVpVXtF9</asp:TextBox>
																	               <%--Bitstamp Bitcoin Wallet--%>
																	                </td>
																	            </tr>
																	            
																	               <tr> 
																	                <td class=head09 align=center>
																	             
																	                           <table border=0 align=center>
																	                            <tr> 
																	                                    <td class=head09 align=center>  </td>
																	                                    <td valign=top width=10 height=10 align=center><asp:Image ID="Image1" ToolTip="Be sure you send the correct BTC amount to the correct address from your wallet. After you make the BTC payment please click the below button, [I made the payment], so we process your payment manually. Bitcoin Payment took usually from several minutes to 2 hours max to appear in your Deposit account" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                    </td>
																	                             </tr>
																	                             
																	                         </table>
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center class=head07>
																	                
																	                    
																	                  <asp:label runat=server ID=lblAmountToSend CssClass=head09_13 Enabled=false>Bitcoin amount you Sent</asp:label>  &nbsp;  <asp:TextBox ID="txtBitcoin" Width=100 runat="server"></asp:TextBox> 
																	                
																	                  
																	                
																	                    
																	                    </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center height=20>
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center class=RednormalText>
																	                    After you send the bitcoin payment from your wallet please click the below button [I made the payment] so we process your payment directly
																	                </td>
																	            </tr>
																	             <tr> 
																	                <td align=center class=RednormalText>
																	                    After we receive the payment, it will appear directly in your Rpchost account
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td height=50>
																	                
																	                    
																	                
																	                </td>
																	            </tr>
																	            
																	            <tr> 
																	                <td align=center>
																	                
																	                <asp:Button id="btnPaid" runat="server" Text="I made the payment" Width="150px" Height=43 CssClass="INPUTBUTTON"></asp:Button>
																	                </td>
																	            </tr>
																	          </table>
																	           
															                  </TD>
																	      </tr>
																	      
																	    
																	      
																	     </table>
																		
																		
																	</TD>
																	
																	
														
																</TR>
															</TABLE>
														</td>
													</TR>
												</TABLE>
											</td>
										</tr>
										
										
													
													
												</TABLE>
											</td>
										</tr>
									</TABLE>
										</td>
									</tr>
								</table>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	
	
	
</TD>
</TR>




</form>

	</body>
</HTML>

