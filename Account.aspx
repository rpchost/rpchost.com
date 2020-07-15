<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Account.aspx.vb" Inherits="Account" %>



<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
								<form id="Form1" runat=server>
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
										border="0">
										<TR>
											<TD width="100%" colSpan="3">
											
												
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
														<td Width="100%" bgcolor=FFCC66 valign=middle Height="25">
																		<!-- Content goes here -->
																		<div class=head09 >ACCOUNT</div>
																	
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
																	           
        																	          Creating Money Since 2006 
																	              
															                  </TD>
																	      </tr>
																	      
																	      
																	      
																	      <tr>
																	          <td class="head06">
																	          <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>
        																	         <%-- <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>--%>
															                  </TD>
																	      </tr>
																	      
                                                                     
                                                                          <tr>
																	          <td height=70>
															                    <asp:Label runat=server ID="lblBTC" CssClass="head00_7">
				          
				          </asp:Label>   
															                      
															                  </TD>
																	      </tr>
																	      
            													       <tr>
																	          <td width=100% align=center>
																	          
																	                <table width=100%>
																	                
																	                
																	                    <tr>
																	                    
																	                    <td align=center width=100%>
																	                    <table width=100% >
																	                    <tr>
																	                        <td class=head10 width=200>
																	                            USD MAIN Balance
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                           <asp:TextBox runat=server ID=txtUsdBalance Width=120 Enabled=false CssClass=INPUTTEXT ></asp:TextBox>
																	                        </td> 
																	                         <td width=100>
																	                           
																	                             </td> 
																	                          
																	                           <td class=head10 width=200>
																	                            BITCOIN MAIN Balance
																	                          </td> 
																	                           <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                           <asp:TextBox runat=server ID=txtBtcBalance Width=120 Enabled=false CssClass=INPUTTEXT ></asp:TextBox>
																	                        </td> 
																	                        
																	                        
																	                         </tr>
																	                    </table>
																	                    </td>
																	                    
																	                    
																	                    </tr>
																	                    
																	                     <tr>
																	                        <td colspan=3 height=10>

																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                    
																	                    <tr>
																	                    <td>
																	                    <table border=1 bordercolor=black>
																	                  <%--  <tr>
																	                        <td class=head10 width=100>
																	                           USD Lending
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td width=220 colspan=2>
																	                        
																	                        <table>
																	                            <tr>
																	                                <td>
																	                                     <asp:RadioButtonList CssClass=head10_Left runat=server ID = RdLend  RepeatColumns=3>
                                                                                                        <asp:ListItem Text="Starter[100]" Value="100" Selected></asp:ListItem>
                                                                                                        <asp:ListItem Text="PRO [500]" Value="500" ></asp:ListItem>
                                                                                                        </asp:RadioButtonList>
																	                                </td>
																	                                 <td>
																	                                    <asp:Button runat=server ID=btnLend  Width=100 Height=25 CssClass=INPUTBUTTON Text="LEND"></asp:button>
																	                                </td>
																	                            </tr>
																	                            
																	                        </table>
                                                                                               
                                                                                                
																	                        </td> 
																	                        
																	                        
																	                        
																	                        
																	                         <td width=70 >
																	                          
																	                         </td> 
																	                        
																	                         <td class=head10_Left>
																	                           BTC Lending
																	                        </td> 
																	                        
																	                        <td width=200 colspan=2>
																	                        
																	                        <table>
																	                            <tr>
																	                                <td>
																	                                 <asp:RadioButtonList CssClass=head10_Left runat=server ID = RdBtcLending RepeatColumns=3>
                                                                                                    <asp:ListItem Text="Starter [100]" Value="100" Selected></asp:ListItem>
                                                                                                    <asp:ListItem Text="PRO [500]" Value="500"  ></asp:ListItem>
                                                                                                     </asp:RadioButtonList>
																	                                </td>
																	                                
																	                                <td>
																	                                 <asp:Button runat=server ID=btnBtcLend  Width=100 Height=25 CssClass=INPUTBUTTON Text="LEND"></asp:button>
																	                                </td>
																	                            </tr>
																	                        </table>
																	                           
                                                                                                
                                                                                                 
																	                        </td> 
																	                        
																	                        
																	                        
																	                        
																	                        
																	                    </tr>--%>
																	                    
																	            <%--        <tr>
																	                        
																	                         <td colspan=4>
																	                           <asp:Label runat=server ID="lblMess" CssClass=RedTextBold></asp:Label>
																	                        </td> 
																	                         <td width=40>
																	                           
																	                        </td> 
																	                         <td colspan=4 height=40>
																	                           <asp:Label runat=server ID="lblBtcMess" CssClass=RedTextBold></asp:Label>
																	                        </td> 
																	                        
																	                    </tr>--%>
																	                    
																	                       <tr>
																	                        
																	                         <td colspan=4  width=500>
																	                         
																	                         <table>
																	                            <tr>
																	                                <td class=head10_Left>
																	                                  TRANSFER TO EXCHANGE ACCOUNT
																	                                </td>
																	                                
																	                                 <td>
																	                                  <asp:TextBox runat=server ID=txtExchangeUSD Width=90 CssClass=INPUTTEXT ></asp:TextBox>
																	                                </td>
																	                                
																	                                 <td>
																	                                  <asp:Button runat=server ID=btnExchangeUSD  Width=100 Height=25 CssClass=INPUTBUTTON Text="TRANSFER"></asp:button>
																	                                </td>
																	                            </tr>
																	                            
																	                            
																	                            <tr>
																	                                <td class=head10_Left>
																	                                 WITHDRAW USD AMOUNT
																	                                </td>
																	                                
																	                                 <td>
																	                                 <asp:TextBox runat=server ID=txtUsdTobeWithdrawn Width=90 CssClass=INPUTTEXT ></asp:TextBox>
																	                       
																	                                </td>
																	                                
																	                                 <td>
																	                                 <asp:Button runat=server ID=btnWithdraw  Width=100 Height=25 CssClass=INPUTBUTTON Text="WITHDRAW"></asp:Button>
																	                                </td>
																	                            </tr>
																	                            
																	                            
																	                             <tr >
																	                                <td height=30>
																	                                
																	                                </td>
																	                                
																	                              
																	                            </tr>
																	                            
																	                            
																	                             <tr>
																	                                <td class=head10_Left colspan=3>
																	                                 
																	                               
																	                                 <table>
																	                                    <tr>
																	                                        <td colspan=2 class=head10_Left >
																	                                          Transfer to Other Rpchost User
																	                                        </td>
																	                                    </tr>
																	                                    
																	                                      <tr>
																	                                      
																	                                        <td Class="head00_8" >
																	                                           Amount
																	                                        </td>
																	                                        
																	                                        <td Class="head00_8" >
																	                                           <asp:TextBox runat=server ID=txtTransferUSD Width=90 CssClass=INPUTTEXT Text="0"></asp:TextBox>
																	                                           $
																	                                        </td>
																	                                        
																	                                         <td Class="head00_8">
																	                                           To UserID
																	                                        </td>
																	                                        
																	                                        <td >
																	                                           <asp:TextBox runat=server ID=txtUsdUserID Width=90 CssClass=INPUTTEXT></asp:TextBox>
																	                       
																	                                        </td>
																	                                        
																	                                         <td >
																	                                            <asp:Button runat=server ID=btnTransferUSD  Width=100 Height=25 CssClass=INPUTBUTTON Text="TRANSFER"></asp:Button>
																                       
																	                                        </td>
																	                                    </tr>
																	                                    
																	                                      <tr>
																	                                       
																	                                    </tr>
																	                                 </table>
																	                                 
																	                                </td>
																	                                
																	                                 <td>
																	                               
																	                                </td>
																	                                
																	                                 <td>
																	                                
																	                                </td>
																	                            </tr>
																	                            
																	                         </table>
																	                        
																	                          
																	                           
																	                        </td> 
																	                       
																	                         
																	                         
																	                         
																	                          <td colspan=4  width=500>
																	                          
																	                          
																	                          <table>
																	                            <tr>
																	                                <td class=head10_Left>
																	                                 TRANSFER TO EXCHANGE ACCOUNT
																	                                </td>
																	                                
																	                                <td>
																	                                 <asp:TextBox runat=server ID=txtExchangeBTC Width=90 CssClass=INPUTTEXT ></asp:TextBox>
																	                       
																	                                </td>
																	                                
																	                                <td>
																	                                 <asp:Button runat=server ID=btnExchangeBTC  Width=100 Height=25 CssClass=INPUTBUTTON Text="TRANSFER"></asp:button>
																	                                </td>
																	                            </tr>
																	                            
																	                            
																	                            
																	                            <tr>
																	                                <td class=head10_Left>
																	                                WITHDRAW BTC AMOUNT
																	                                </td>
																	                                
																	                                 <td>
																	                                  <asp:TextBox runat=server ID=txtBTCWithdraw Enabled=false Width=90 CssClass=INPUTTEXT ></asp:TextBox>
																	                        
																	                                </td>
																	                                
																	                                 <td>
																	                                 <asp:Button runat=server ID=btnWithdrawBTC  Width=100 Height=25 CssClass=INPUTBUTTON Text="WITHDRAW"></asp:Button>
																	                        
																	                                </td>
																	                            </tr>
																	                            
																	                            
																	                             <tr >
																	                                <td height=30>
																	                                
																	                                </td>
																	                                
																	                              
																	                            </tr>
																	                            
																	                                  <tr>
																	                                <td class=head10_Left colspan=3>
																	                                 
																	                               
																	                                 <table>
																	                                    <tr>
																	                                        <td colspan=2 class=head10_Left >
																	                                          Transfer to Other Rpchost User
																	                                        </td>
																	                                    </tr>
																	                                    
																	                                      <tr>
																	                                      
																	                                        <td Class="head00_8" >
																	                                           Amount
																	                                        </td>
																	                                        
																	                                        <td Class="head00_8" >
																	                                           <asp:TextBox runat=server ID=txtTransferBtc Width=90 CssClass=INPUTTEXT Text="0"></asp:TextBox>
																	                                           btc
																	                                        </td>
																	                                        
																	                                         <td Class="head00_8">
																	                                           To UserID
																	                                        </td>
																	                                        
																	                                        <td >
																	                                           <asp:TextBox runat=server ID=txtBtcUserID Width=90 CssClass=INPUTTEXT></asp:TextBox>
																	                       
																	                                        </td>
																	                                        
																	                                         <td >
																	                                            <asp:Button runat=server ID=btnTransferBtc  Width=100 Height=25 CssClass=INPUTBUTTON Text="TRANSFER"></asp:Button>
																                       
																	                                        </td>
																	                                    </tr>
																	                                    
																	                                      <tr>
																	                                       
																	                                    </tr>
																	                                 </table>
																	                                 
																	                                </td>
																	                                
																	                                 <td>
																	                               
																	                                </td>
																	                                
																	                                 <td>
																	                                
																	                                </td>
																	                            </tr>
																	                          </table>
																	                        
																	                         
																	                           
																	                        </td> 
																	                        
																	                        
																	                    </tr>
																	                    
																	                    
																	              <%--        <tr>
																	                        
																	                         <td colspan=4 width=700>
																	                         
																	                        
																	                         
																	                        																                         
																	                        </td> 
																	                         <td>
																	                          
																	                         </td> 
																	                         
																	                         
																	                         
																	                          <td colspan=3 class=head10_Left  width=700>
																	                        
																	                      
																	                           
																	                        </td> 
																	                         <td>
																	                          
																	                         </td> 
																	                        
																	                    </tr>--%>
																	                    
																	                    </table>
																	                    </td>
																	                    
																	                       
																	                        
																	                    </tr>
																	                    
																	                    
																	                    
																	                    
																	                    
																	                     <tr>
																	                        <td colspan=3 height=20>

																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                     <tr>
																	                        <td >
																	                        
																	                        <table>
																	                            <tr>
																	                      <td class=head10_left width=178>
																	                            
																	                            <asp:Label runat=server ID="lblWithdrawUSD" Text="Withdraw USD amount" Visible=false CssClass=INPUTLABEL></asp:Label>
																	                        </td> 
																	                        
																	                         <td>
																	                            
																	                        </td> 
																	                        
																	                        <td class=head10>
																	                           
																	                        </td> 
																	                        
																	                        <td>
																	                            &nbsp;</td> 
																	                        
																	                          <td>  
                                                                                               
                                                                                                    <table runat=server id=tblWithdraw visible=false>
                                                                                                        <tr>
                                                                                                        
                                                                                                         <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                        
                                                                                                            <td>
                                                                                                               <img src="picture/arrow.jpg"
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                                <asp:RadioButtonList CssClass=BlackTextBold10 runat=server ID = RdWithdraw  RepeatColumns=3>
                                                                                                                    <asp:ListItem Text="PM" Value="PM" Selected></asp:ListItem>
                                                                                                                    <asp:ListItem Text="PAYEER" Value="PAYEER" ></asp:ListItem>
                                                                                                                    
                                                                                                                    <asp:ListItem Text="WESTERN UNION" Value="WU"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="BANK ACCOUNT" Value="BANK"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="CREDIT CARD" Value="CREDITCARD"></asp:ListItem>
                                                                                                                </asp:RadioButtonList>
                                                                                                            </td>
                                                                                                            
                                                                                                             <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                               <asp:Button runat=server ID=btnConfirmWithdrawUSD  Width=60 Height=25 CssClass=INPUTBUTTON Text="Confirm"/>
                                                                                                            </td>
                                                                                                             <td width=10>
                                                                                                              
                                                                                                            </td>
                                                                                                             <td>
                                                                                                               <asp:Button runat=server ID=btnCancel  Width=60 Height=25 CssClass=INPUTBUTTON Text="Cancel"/>
                                                                                                            </td>
                                                                                                            
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                          <%--<tr>
                                                                                                        
                                                                                                            <td colspan=2>
                                                                                                                <asp:Label runat=server ID="lblSelectedWithdrawMethod" CssClass=head12>Address ID</asp:Label>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td >
                                                                                                              <asp:TextBox runat=server ID=txtWithdrawUsdAddress Width=100 Height=20 CssClass=INPUTTEXT MaxLength=10 ></asp:TextBox>
                                                                                                            </td>
                                                                                                            
                                                                                                            
                                                                                                        </tr>--%>
                                                                                                         <tr>
                                                                                                        
                                                                                                            <td colspan=8 class=RednormalText>
                                                                                                               Account data are setted in your <a href=profile.aspx title="profile">profile</a> section.<br>
                                                                                                               Check the withdrawal <a href=Fees.aspx title="Fees">Fees</a> . 
                                                                                                               
                                                                                                            </td>
                                                                                                            
                                                                                                            <td >
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                            
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                       
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                    </table>
                                                                                               
                                                                                               </td>
																	                        
																	                        
																	                    </tr>
																	                   
																	                        </table>

																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                    
																	                    
																	                    
																	                   <%--Withdraw BTC--%> 
																	                   
																	                       <tr>
																	                        <td >
																	                        
																	                        <table>
																	                            <tr>
																	                      <td class=head10_Left>
																	                           
																	                            <asp:Label runat=server ID="lblWithdrawBtc" Text="Withdraw all BTC amount" Visible=false CssClass=INPUTLABEL></asp:Label>
																	                            
																	                            
																	                        </td> 
																	                        
																	                         <td>
																	                            
																	                        </td> 
																	                        
																	                        <td class=head10>
																	                            &nbsp;</td> 
																	                        
																	                        <td>
																	                            &nbsp;</td> 
																	                        
																	                          <td>  
                                                                                               
                                                                                                    <table runat=server id=tblWithdrawBTC visible=false>
                                                                                                        <tr>
                                                                                                        
                                                                                                         <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                        
                                                                                                            <td>
                                                                                                               <img src="picture/arrow.jpg"
                                                                                                            </td>
                                                                                                            
                                                                                                              <td class=head12>
                                                                                                               Bitcoin wallet
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                               <asp:TextBox runat=server ID=txtBitcoinWallet Width=230 CssClass=BlueText Enabled=false MaxLength=50 ></asp:TextBox>
                                                                                                            </td>
                                                                                                            
                                                                                                             <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                               <asp:Button runat=server ID=btnConfirmWithdrawBTC  Width=60 Height=25 CssClass=INPUTBUTTON Text="Confirm"/>
                                                                                                            </td>
                                                                                                             <td width=10>
                                                                                                              
                                                                                                            </td>
                                                                                                             <td>
                                                                                                               <asp:Button runat=server ID=btnCancelWithdrawBTC  Width=60 Height=25 CssClass=INPUTBUTTON Text="Cancel"/>
                                                                                                            </td>
                                                                                                            
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                         
                                                                                                         <tr>
                                                                                                        
                                                                                                            <td colspan=8 class=RednormalText>
                                                                                                               Fees to Bitcoin wallet are normal Network fees
                                                                                                            </td>
                                                                                                            
                                                                                                            <td >
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                            
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                       
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                    </table>
                                                                                               
                                                                                               </td>
																	                        
																	                        
																	                    </tr>
																	                   
																	                        </table>

																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                    
																	                </table>
																	          
															                  </TD>
															             
															              
																	      </tr>
                                                                       
                                                                     
                                                                    
                                                                   
                                                                        
																	     </table>
																		
																		
																	</TD>
																	
																	
														
																</TR>
																
																  <tr>
                                                                                                        
                                                                                                         <td>
                                                                                                               
                                                                                                            </td>
                                                                                                            
                                                                                                            <td colspan=6>
                                                                                                               <asp:Label runat=server ID="lblWithdrawMess" CssClass=Rednormaltext></asp:Label>
                                                                                                            </td>
                                                                                                            
                                                                                                        </tr>
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
