<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrCrdd.aspx.vb" Inherits="CrCrdd" %>


<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
	<head>
	
	 <script>

        function Redisplay() {
   	    document.getElementById("loading").src = "picture/loading2.gif";
         }
   	
   	</script>
   	
	
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
   		<title>Cryptocurrency trading | Buy and Sell Bitcoin | Online forex trading</title>
   		
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
		<META NAME="KEYWORDS" CONTENT="Buy, Cryptocurrency, Bitcoin">
		<META NAME="ABSTRACT" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">

        <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
   

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server  method="post">

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
																		<div class=head09 ></div>
																	
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
																	           
        																	          DEPOSIT WITH CREDIT CARD </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	      
																	      
                                                                          
																	      
																	       <tr>
																	       <%--<asp:ScriptManager ID="ScriptManager1" runat="server" />
                                                                              <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                                                                <ContentTemplate>--%>

																	       
																	          <td align=center>
																	          
																	               <table border=0>
																	          
																	          
																	           <tr> 
																	                <td align=center  class=head09_13>
																	                
																	                <%--<img src="picture\CreditCard.jpg" width=150 />--%>
																	                
																	              <%--  Buy bitcoin directly with your credit card <u>WITHOUT VERIFICATION</u>--%>
																	                
																	                </td>
																	            </tr>
																	            
																	             
																	            
																	            
																	             <%--      <tr> 
																	                <td align=left >
																	                
																	               <table border=0>
																	                    <tr> 
																	                         <td>
																	                               
																	                                    <td align=center class=head06_small>
																	                                        <br><br>
																	                                       
																	                                        <asp:TextBox runat=server ID=txtUserID Visible=true  CssClass=INPUTTEXT Width=1 ></asp:TextBox>   
																	                                    </td>
																	                                																	                                
																	                        </td>
																	                        
																	                        <td width=100 align=center>
																	                               
																	                                   <img src="picture/flat.gif" />
																	                                																	                                
																	                        </td>
																	                        
																	                        
																	                         <td >
																	                    
																	                      
																	                            
																	                                <td align=center width=350 class=head06_small>
																	                                BTC you get <u>(No hidden fees)</u>
																	                               <br><br>
																	                               <asp:TextBox runat=server enabled=false ID=txtBtcAmount CssClass=INPUTTEXT_CENTER Width=150 MaxLength=20 ></asp:TextBox>
																	                               
																	                                </td>
																	                            
    																	            
    																	                     </td>
    																	                     
    																	                     
    																	                       <td width=100 align=center>
																	                               
																	                                   
																	                                																	                                
																	                        </td>
																	                        
    																	                     
    																	                     <td >
																	                    
																	                                <td align=center class=head06_small>
																	                               Your bitcoin wallet address
																	                               <br><br>
																	                                <asp:TextBox runat=server ID=txtBtcAddress enabled=false CssClass=INPUTTEXT_CENTER Width=420 MaxLength=55 ></asp:TextBox>
																	                   
																	                                </td>
																	                            
    																	            
    																	                     </td>
																	                    </tr>
																	            
																	                   
																	                    </table>
																	                  
																	                </td>
																	            </tr>--%>
																	            
																	             
																	            
																	          
																	          
																	            
																	             <tr> 
																	                <td  >
																	                
																	               
	                                                                                <input type="hidden" name="business" value="lanamonyuk@gmail.com">
	                                                                                  <input type="hidden" name="return" value="http://www.rpchost.com/Payments.aspx">
																	                <INPUT TYPE="hidden" name="cmd" value="_cart">
                                                                                        <input type="hidden" name="item_name" value="0.1 btc">
																	                </td>
																	            </tr>
																	            
																	            
																	               <tr> 
																	                <td  align=center height=50>
																	                
																	              
																	                 
																	                 
																	                  
																	                  <hr>
																	                    
																	                    </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  height=60 align=center>
																	                
																	                   <asp:Label runat=server ID=lblVerification CssClass=RednormalTextBold>
																	                   
																	                   <<< PLEASE READ CAREFULLY >>>   <br>
																	                     Before doing the transaction, be sure you provide correct info; <u>your First Name, Last Name, Email, Phone number and Country</u> in <a href='profile.aspx' title='your Profile' target=_blank>profile</a> section <br> should match your passport/Identity and Credit Card documents which you sent when verification.
																	                                      We will send to your phone a passcode to verify that you are making the transaction. We will review the transaction before sending you the bitcoins. If  
																	                                      something suspicious we will cancel the transaction. Your security is our priority. Please note that our trading currency is EUR, if your credit card is USD then your bank will charge you the conversion fees.
																	                     </asp:Label>
																	                    
																	                    </td>
																	            </tr>
																	            
																	            
																	            <tr> 
																	                <td  height=30>
																	                
																	                 
																	                    
																	                    </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  align=center height=140 >
																	                
																	                <table border=0 bordercolor=000000>
																	                
																	                    <tr>
																	                    <td height=100% valign=top align=left>
																	                    <table  height=140>
																	                    
																	                    
																	                     <%--<tr>
																	                    
																	                        <td class="head09_13" valign=top>
																	                            PAY WITH CREDIT CARD
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>--%>
																	                   
																	                    
																	                    <tr>
																	                    
																	                        <td>
																	                       
																	                        
																	                        
																	                         <table  >
																	                    
																	                     <tr>
																	                    
																	                        <td >
																	                      
																	                            <asp:Label runat=server ID=txtDepositAmount enabled=false CssClass=INPUTTEXT_CENTER Width=120 MaxLength=10 ></asp:Label>  <span class=BlackTextBold>EUR</span>
																                          
																	                        </td>
																	                      </tr>
																	                      
																	                    
																	                     <tr>
																	                    
																	                        <td >
																	                           
																                                    <asp:textbox id="txtAccHold" enabled=false Width="200" CssClass="inputtext_center"  Runat="server" MaxLength="16"></asp:textbox>	
														                 <span class="bluesmalltext">Account Holder Name </span>
																	                        </td>
																	                      </tr>
																	                      
																	                    
																	                     <tr>
																	                    
																	                        <td >
																	                           
																                                    <asp:textbox id="txtCrCd"  Width="200" CssClass="inputtext_center"  Runat="server" MaxLength="16"></asp:textbox>	
														                 <span class="bluesmalltext">Credit Card number </span>
																	                        </td>
																	                      </tr>
																	                      
																	                       <tr>
																	                    
																	                        <td >
																	                           
																                                  <asp:textbox id="txtExpMonth"  Width="30" CssClass="inputtext_center"  Runat="server"  MaxLength="2"></asp:textbox>	
														                                            <asp:textbox id="txtExpYear"  Width="30" CssClass="inputtext_center"  Runat="server"  MaxLength="2"></asp:textbox>	
														                                            
														                                            <%--<span class="bluesmalltext"> Expiry Month / Year </span>--%>
																	                        </td>
																	                      </tr>
																	                      
																	                      
																	                       <tr>
																	                    
																	                        <td >
																	                           
																                                    <asp:textbox id="txtC"  Width="64" CssClass="inputtext_center" Runat="server" MaxLength="3"></asp:textbox> <%--<span class="bluesmalltext">3 digits pin</span>--%>	
														                                            
																	                        </td>
																	                      </tr>
																	                      
																	                      
																	                      </table>   
																	                        
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                    
																	                    
																	                      <tr>
																	                    
																	                        <td align=center>
																	                        <img  id="loading" >
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                    
																	                     
																	                    </table>
																	                    </td>
																	                 
																	                     
																	                    
																	                    </tr>
																	                    
																	                  
																	                
																	                </table>
																	                
																	                 
																	                </td>
																	            </tr>
																	      
																	      
																	      <tr> 
																	                <td  height=15 align=center>
																	                
																	                 																	                
																	              <img src="MC.gif">
																	               <img src="VS.gif">
																	                    
																	                    </td>
																	            </tr>
																	            
																	         <tr> 
																	                <td   align=center>
																	                
																	                 																	<asp:Button id="btnSubmit" CssClass="inputtextbtn" onclientclick="Redisplay()" Runat="server" Text="Make Payment" 
                                                                Width="128px" Height=30></asp:Button>															                
																	             <%-- <a href=BuyBitcoins_CC.aspx class="inputbutton" width=150>&nbsp; Back &nbsp;</a>--%>
																	                
																	                    
																	                    </td>
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
</TABLE>



</form>

	</body>
</HTML>

