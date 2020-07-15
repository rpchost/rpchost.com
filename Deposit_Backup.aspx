<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Deposit_Backup.aspx.vb" Inherits="Deposit_Backup" %>


<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


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

<meta name="verify-admitad" content="2504a66eeb" />	

  

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server>
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
										border="0">
										
										
										<TR>
											<TD vAlign="top" height="100%" width=100%>
												<table cellSpacing="0" cellPadding="0" height="100%" width=100%>
													<tr>
														<td >
															<uc1:right runat="server" id="RightHeader"></uc1:right>
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
																		<uc4:right runat="server" id="headerbutton"></uc4:right>
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
																		<div class=head09 >DEPOSIT</div>
																	
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
																	          <td height=20>
        																	          
															                  </TD>
																	      </tr>
																	      
																	       <tr>
																	          <td align=center>
																	           <table border=1 cellpadding=0 cellspacing=0  bordercolor=000000>
																	           
																	            <tr>
																	                <td width=20 class="head07">
																	          
        																	            Payment Method
        																	      
        																	        </TD>
        																	        
        																	        <td width=30><img src="picture/PM.jpg" width=150/></TD>
        																	        <td  width=30><img src="picture/Payeer.png" width=150 /></TD>
        																	        <td  width=30 class="head05" align=center>BANK TRANSFER</TD>
        																	         <td  width=30 align=center><img src="picture/CreditCard.jpg" width=150 /></TD>
        																	         <td  width=50 align=center><img src="picture/Bitcoin1.jpg" width=150 height=90 /></TD>
        																	        
																	              </tr>
																	              
																	              
																	              
																	                <tr>
																	                <td width=20>
																	          
        																	        <img src="picture/CustomPlan.jpg" width=180 height=130 />
        																	      
        																	        </TD>
        																	           
        																	        <td width=30 align=center>
        																	             <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	                         <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 0% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image3" ToolTip="Once you deposit any USD amount, you can transfer to Exchange section, and profit from Exchanging between USD and BTC. You can lend and you can also transfer currency between your accounts. But be aware; if you want to lend, the 7% fee is applied " imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="Button1" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	        </TD>
        																	        <td width=30 >
        																	        <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	                         <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 0% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image4" ToolTip="Once you deposit any USD amount, you can transfer to Exchange section, and profit from Exchanging between USD and BTC. You can lend and you can also transfer currency between your accounts. But be aware; if you want to lend, the 7% fee is applied" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="Button3" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	        </TD>
        																	        
        																	       <td width=30 class="head08">
        																	       
        																	        Coming soon
        																	       
        																	       </TD>
        																	         <%-- <td  width=30>
        																	           <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	     <table border=0 align=center>
																	                <tr> 
																	                        <td class=head09 align=center> Deposit Fee = 16% </td>
																	                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image3" ToolTip="10% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD + Credit card fee" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                        </td>
																	                 </tr>
																	             </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnCreditCard" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	             
        																	             
        																	         </TD>--%>
        																	           <td width=30 >
        																	       
        																	        <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	            <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 0% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image10" ToolTip="Once you deposit any USD amount, you can transfer to Exchange section, and profit from Exchanging between USD and BTC. You can lend and you can also transfer currency between your accounts. But be aware; if you want to lend, the 15% fee is applied " imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnDepositCustCreditCard" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	       
        																	       </TD>
        																	         
        																	             <td  width=30>
        																	            <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	     <table border=0 align=center>
																	                <tr> 
																	                        <td class=head09 align=center> Deposit Fee = 0% </td>
																	                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image9" ToolTip="Once you deposit any Bitcoin amount, you can transfer to Exchange section, and profit from Exchanging between USD and BTC. You can lend and you can also transfer currency between your accounts." imageUrl ="picture/exclamation.jpg" runat=server  />
																	                        </td>
																	                 </tr>
																	             </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="Button4" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	         </TD>
        																	         
																	              </tr>
																	              
																	              
																	            
																	              
																	           
																	             <tr>
																	                <td width=20>
																	          
        																	        <img src="picture/StarterPlan.jpg" width=180 height=130/>
        																	      
        																	        </TD>
        																	           
        																	        <td width=30 align=center>
        																	             <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	                         <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 7% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image2" ToolTip="7% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnSubmit" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	        </TD>
        																	        <td width=30 >
        																	        <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	            <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 7% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image7" ToolTip="7% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnSubmitPayeer100" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	        </TD>
        																	        
        																	       <td width=30 class="head08">
        																	       
        																	        Coming Soon
        																	       
        																	       </TD>
        																	         <%-- <td  width=30>
        																	           <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	     <table border=0 align=center>
																	                <tr> 
																	                        <td class=head09 align=center> Deposit Fee = 16% </td>
																	                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image3" ToolTip="10% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD + Credit card fee" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                        </td>
																	                 </tr>
																	             </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnCreditCard" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	             
        																	             
        																	         </TD>--%>
        																	           <td width=10 >
        																	       
        																	         <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	            <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 15% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image11" ToolTip="Once you deposit any USD amount, you can transfer to Exchange section, and profit from Exchanging between USD and BTC. You can lend and you can also transfer currency between your accounts." imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnDepositCreditStarter" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	       
        																	       </TD>
        																	         
        																	             <td  width=30>
        																	            <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	     <table border=0 align=center>
																	                <tr> 
																	                        <td class=head09 align=center> Deposit Fee = 0% </td>
																	                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image5" ToolTip="No fees on bitcoin deposit" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                        </td>
																	                 </tr>
																	             </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnDepositBitcoinStarter" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	         </TD>
        																	         
																	              </tr>
																	              
																	              
																	               
																	              
																	              
																	              <tr>
																	                <td width=20>
																	          
        																	        <img src="picture/ProPlan.jpg" width=180 height=130/>
        																	      
        																	        </TD>
        																	          
        																	        <td width=30 >
        																	        <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	                       
        																	                        
        																	                     <table border=0 align=center>
																	                                <tr> 
																	                                        <td class=head09 align=center> Deposit Fee = 7% </td>
																	                                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image1" ToolTip="7% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                        </td>
																	                                 </tr>
																	                             </table>   
																	             
        																	                    </td>
        																	                </tr>
        																	                
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="Button2" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	        </TD>
        																	        <td width=30 >   <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	                         <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 7% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image8" ToolTip="7% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnSubmitPayeer500" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	             </TD>
        																	        <td width=30 class="head08">Coming Soon</TD>
        																	     <%--   <td width=30 >
        																	         <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	                       <table border=0 align=center>
																	                <tr> 
																	                        <td class=head09 align=center> Deposit Fee = 16% </td>
																	                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image4" ToolTip="10% fee is a one time fee on deposit. This fee cover the costs of exchanging USD to bitcoins and bitcoins to USD + Credit card fee" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                        </td>
																	                 </tr>
																	             </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="Button3" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	        </TD>--%>
        																	        
        																	           <td width=30 >
        																	       
        																	        <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	            <table border=0 align=center>
																	                        <tr> 
																	                                <td class=head09 align=center> Deposit Fee = 15% </td>
																	                                <td valign=top width=10 height=10 align=center><asp:Image ID="Image12" ToolTip="Once you deposit any USD amount, you can transfer to Exchange section, and profit from Exchanging between USD and BTC. You can lend and you can also transfer currency between your accounts." imageUrl ="picture/exclamation.jpg" runat=server  />
																	                                </td>
																	                         </tr>
																	                     </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnDepositCreditPro" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	       
        																	       
        																	       </TD>
        																	       
        																	         <td  width=30>
        																	            <table border=0 width=100% height=120 >
        																	                <tr>
        																	                    <td align=center>
        																	     <table border=0 align=center>
																	                <tr> 
																	                        <td class=head09 align=center> Deposit Fee = 0% </td>
																	                        <td valign=top width=10 height=10 align=center><asp:Image ID="Image6" ToolTip="No fees on bitcoin deposit" imageUrl ="picture/exclamation.jpg" runat=server  />
																	                        </td>
																	                 </tr>
																	             </table>
        																	                    </td>
        																	                </tr>
        																	                
        																	                 <tr>
        																	                    <td align=center>
        																	                       <asp:Button id="btnBitcoinDepositPro" runat="server" Text="Make the Deposit" Width="120px" Height=30 CssClass="INPUTBUTTON"></asp:Button>
        																	                    </td>
        																	                </tr>
        																	                
        																	             </table>
        																	         </TD>
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