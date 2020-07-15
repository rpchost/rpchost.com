<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Revlut.aspx.vb" Inherits="Revlut" %>


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
																	           
        																	          DEPOSIT WITH REVOLUT </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	     
																	      
                                                                          <tr>
																	          <td height=20>
        																	          
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
																	            
																	             
																	            
																	            
																	            
																	              <tr> 
																	               
																	                
																	                   
																	                       
																	                               
																	                                    <td align=center class=head06_small width=100%>
																	                                         <asp:Label runat=server ID=lblAmountToPay Width=220></asp:Label>
																	                                        <br><br>
																	                                        <asp:TextBox runat=server ID=txtDepositAmount enabled=false CssClass=INPUTTEXT_CENTER Width=120 MaxLength=10 ></asp:TextBox> 
																	                                    </td>
																	                                																	                                
																	                     
																	                  
																	               
																	            </tr>
																	            
																	             
																	            
																	          
																	          
																	            
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
																	                <td  align=center>
																	                
																	                  <span class=head06_small>REVOLUT phone number <br> [Country Code] [Area Code] [Phone number]</span>
																	                    </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  height=60 align=center>
																	                
																	                  <asp:textbox id="txtRevolutPhone" Width="200" CssClass="inputtext_center"  Runat="server"></asp:textbox>	
																	                    </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  align=center>
																	                
																	                  <asp:checkbox runat=server ID=chkRev cssclass=RednormalTextBold text="I have a Revolut account and I want to make a deposit by paying thru Revolut">
																	                    
																	                  </asp:checkbox>
																	                    
																	                    </td>
																	            </tr>
																	            
																	            
																	            
																	             <tr> 
																	                <td  height=60 align=center class=RednormalTextBold>
																	                
																	                    Once you submit the request, we will send you a payment request to your Revolut</td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  align=center>
																	                
																	                <table border=0 bordercolor=000000>
																	                    
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
																	                <td   align=center>
																	                
																	                 																	<asp:Button id="btnSubmit" CssClass="inputtextbtn" onclientclick="Redisplay()" Runat="server" Text="Submit Request" 
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

