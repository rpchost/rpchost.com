<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Deposit_WU.aspx.vb" Inherits="Deposit_WU" %>


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

  <script>

      function myFunction() {
             document.getElementById('someid').value = document.getElementById('txtDepositAmount').value;
      }
  </script>
    
    

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server method="POST">
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
																		<div class=head09 >WESTERN UNION DEPOSIT</div>
																	
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
																	                <td align=center>
																	                
																	                <img src="picture\WU.jpg" width=100 height=100 />
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	              <tr> 
																	                <td height=50 class=head07>
																	                
																	                <asp:Label runat=server ID=Label1>Transaction ID</asp:Label> 
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                     
																	                     <asp:Label runat=server ID=lblPlan></asp:Label> 
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center height=20>
																	                     
																	                     
																	                
																	                </td>
																	            </tr>

																	             <tr> 
																	                <td align=center class=RednormalTextBold>
																	                
																	                    If you made the WesterUnion paymet, please fill the following information and press the button [I made the payment].
                                                                                        <br />
                                                                                        After we receive the WU payment, 10 minutes you receive your bitcoins</td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center height=10>
																	                     
																	                     
																	                
																	                </td>
																	            </tr>
																	            
																	          <%--  <tr> 
																	                <td align=center class=head00_7>
																	                
																	                     Exact USD Amount You sent</td>
																	            </tr>
																	           
																	           
																	           
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtDepositAmount CssClass=INPUTTEXT Width=80 MaxLength=10 ></asp:TextBox>
																	                
																	                </td>
																	            </tr>--%>
																	            
																	            
																	            
																	             <tr> 
																	                <td align=center class=head00_7>
																	                
																	                     Exact Sender Name</td>
																	            </tr>
																	             <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtSenderName CssClass=INPUTTEXT_CENTER Width=220 ></asp:TextBox>
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center height=10>
																	                     
																	                     
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center class=head00_7>
																	                
																	                     Exact Tracking number [MTCN]</td>
																	            </tr>
																	             <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtMTCN CssClass=INPUTTEXT_CENTER Width=120  MaxLength=15></asp:TextBox>
																	                
																	                </td>
																	            </tr>
																	            
																	              
																	            
																	              <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            <tr> 
																	                <td align=center>
																	                
																	                                                           
                                                                                        
                                                                                        <%--<input type="submit" name="PAYMENT_METHOD" width=100 height=100  value="Pay Now!">--%>
																	                <asp:Button id="btnSubmit" runat="server" Text="I confirm I made the payment" Width="230" Height=43 CssClass="INPUTBUTTON"></asp:Button>
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
