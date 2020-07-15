<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Paypall.aspx.vb" Inherits="Paypall" %>



<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
	<head>
	
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
   
<script src="https://www.paypalobjects.com/api/checkout.js">

</script>
    
    <script>

        function Redisplay() {
   	    document.getElementById("loading").src = "picture/loading2.gif";
         }
   	
   	</script>
   	
 

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server method="post">

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
																	           
        																	          DEPOSIT WITH PAYPAL </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	      <tr>
																	          <td class="head06">
        																	         
															                  </TD>
																	      </tr>
																	      
                                                                          
																	      
																	       <tr>
																	       <%--<asp:ScriptManager ID="ScriptManager1" runat="server" />
                                                                              <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                                                                <ContentTemplate>--%>

																	       
																	          <td align=center>
																	          
																	               <table border=0>
																	          
																	          
																	          
																	            
																	             
																	            
																	            
																	              <tr> 
																	                <td align=left >
																	                
																	              <%--      <table border=0>
																	                    <tr> 
																	                         <td>
																	                               
																	                                    <td align=center class=head06_small>
																	                                         <asp:Label runat=server ID=lblAmountToPay Width=220></asp:Label>
																	                                        <br><br>
																	                                        <asp:TextBox runat=server ID=txtDepositAmount enabled=false CssClass=INPUTTEXT_CENTER Width=120 MaxLength=10 ></asp:TextBox> 
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
																	                  --%>
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
																	            
																	            <%-- <tr> 
																	                <td  height=60 align=center>
																	                
																	                 
																	                    
																	                    </td>
																	            </tr>--%>
																	            
																	             <tr> 
																	                <td  align=center height=140 >
																	                
																	                <table border=0 bordercolor=000000>
																	                
																	                    <tr>
																	                  
																	                    
																	                    
																	                     <td >
																	                      <table  height=140>
																	                    
																	                    
																	                     <tr>
																	                    
																	                        <td class="head09_13" align=center height=20 valign=top>
																	                             PAY TO RPCHOST PAYPAL BY PRESSING THIS LINK <a href="http://www.paypal.me/RpcHst" class="redtextbold" target=_blank>Pay us here</a>
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                   
																	                    
																	                    <tr>
																	                    
																	                        <td align=center>
																	                       
																	                       
																	                       <table>
																	                      
																	                       <%--<tr>
																	                        <td align=center height=20 class="redtextbold">
																	                              <a href="http://www.paypal.me/RpcHst" class="redtextbold" target=_blank>Pay us here</a>
																	                        </td>
																	                       </tr>--%>
																	                     
																	                       
																	                       
																	                      
																	                         <tr>
																	                        <td align=center class="bluetext" height=40>
																	                             
																	                             You're sending to Rpchost : <asp:label runat=server ID=lblPyToRpc ></asp:label>
																	                             <br> in the note section please copy/paste the following as payment reference
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                        
																	                       
																	                         <tr>
																	                        <td align=center class=RedTextBold >
																	                           
																	                           
																	                             
																	                             <asp:label runat=server ID=Ref   borderwidth="4px" width=300 borderstyle=6></asp:label> <br>
																	                           <%--   <asp:label runat=server ID=lblUSerID  ></asp:label>
																	                        --%>
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                       
																	                       <tr>
																	                        <td align=center height=20>
																	                             
																	                        </td>
																	                       </tr>
																	                       
																	                           <tr>
																	                        <td align=center height=20 class="redsmalltext">
																	                               <a href= "#" onclick="window.open('picture/paypal.gif','_blank')" > [See an Example]</a>
																	                        </td>
																	                       </tr>
																	                       
																	                       </table>
																	                        
																	                        </td>
																	                        
																	                    </tr>
																	                     
																	                    </table>
																	                    </td>
																	                  
																	                    
																	                    </tr>
																	                    
																	                  
																	                
																	                </table>
																	                
																	                 
																	                </td>
																	            </tr>
																	      
																	       <tr> 
																	                <td  height=55 align=center class="rednormaltext">
																	                
																	                 		Click "Reserve transaction" button only when you finish the paypal payment
																	                 																					                
                                                                                        
																	                    </td>
																	            </tr>
																	    
																	            
																	            
																	                
																<TR>
																
																
																	<TD  align="center">
																	
																	 <img  id="loading"  >
																	</TD>
																	
																</TR>															                
                                                                                        
																	                 
																	              <tr> 
																	                <td  height=15 align=center>
																	                
																	                 	 <asp:Button ID="btnSubmit" runat="server" height=30 CssClass="inputbutton" Text="Reserve Transaction" onclientclick="Redisplay()"/>
																	                    
																	                    
																	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	                    
																	                    
																	                    <asp:Button ID="Button1" runat="server" height=30 CssClass="inputbutton" Text="BACK" />
																	                    </td>
																	            </tr>
																	            
																	            
																	            <tr> 
																	                <td height=30>
																	                
																	                 	
																	                    
																	                    </td>
																	            </tr>
																	            
																	         <tr> 
																	                <td   align=center>
																	                
																	               
																	                    
																	                    </td>
																	            </tr>
																	     </table>
																		
																		
																	</TD>
																	
																	<%--</ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    
                                                                     <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                                             <ProgressTemplate>
                                                                                <div class="">
                                                                                    Processing Please Wait...
                                                                                    <img runat="server" id="ajaxLoader" src="~/picture/giphy.gif" alt="loading" /></div>
                                                                                <div class="" style="height: 10px;">
                                                                                </div>
                                                                            </ProgressTemplate>
                                                                       
                                                                    </asp:UpdateProgress>--%>
																	
																	
														
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
