<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OMT.aspx.vb" Inherits="OMT" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
	<head>
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
																	           
        																	          DEPOSIT WITH OMT </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	     
																	      
                                                                        
																	       <tr>
																	       <%--<asp:ScriptManager ID="ScriptManager1" runat="server" />
                                                                              <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                                                                <ContentTemplate>--%>

																	       
																	          <td align=center>
																	          
																	               <table border=0>
																	          
																	          
																	           
																	            
																	             <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                            
																	                                    <td align=center class=head06_small>
																	                                         <asp:Label runat=server ID=lblAmountToPay Width=220></asp:Label>
																	                                        <br><br>
																	                                        <asp:TextBox runat=server ID=txtDepositAmount enabled=false CssClass=INPUTTEXT_CENTER Width=120 MaxLength=10 ></asp:TextBox> 
																	                                        <asp:TextBox runat=server ID=txtUserID Visible=true  CssClass=INPUTTEXT Width=1 ></asp:TextBox>   
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
																	                             
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                   
																	                    
																	                    <tr>
																	                    
																	                        <td align=center>
																	                       
																	                       
																	                       <table>
																	                      
																	                       <tr>
																	                        <td align=center height=20 >
																	                        <asp:label runat=server id=lbl1 class="redtextbold">
																	                         This payment method is for clients inside Lebanon, you can send payment to our 
                                                                                                agent there using OMT<br />
                                                                                                [Receiver name : Joseph Chalhoub]<br />
                                                                                                
																	                        </asp:label>
																	                         <asp:label runat=server id=lbl2 class="redtextbold">
																	                         After you make the payment with OMT, please provide your [first name, last name and OMTN number] and press "I made the payment"
                                                                                               <br />
                                                                                                [Receiver name : Joseph Chalhoub]<br /> 
																	                        </asp:label>
																	                           
                                                                                                <%--<br />
                                                                                                After you make the payment with OMT, please provide your [first name, last name and OMTN number] and press "I made the payment"
                                                                                                --%>
                                                                                                </td>
																	                       </tr>
																	                       
																	                         <tr>
																	                        <td align=center height=20 class="redtextbold">
																	                            
																	                            
																	                            
                                                                                                </td>
																	                       </tr>
																	                       
																	                        <tr>
																	                            <td align=center height=20 >
																	                                     <asp:Button ID="btnReserve" runat="server" height=30 CssClass="inputbutton" onclientclick="Redisplay()" causesvalidation=false Text="Reserve this payment" />
																	                                     
																	                                     <br><br>
																	                                     
																	                                     <asp:label runat=server ID=lblReserve cssClass=RednormalText></asp:label>
																	                            </td>
																	                       </tr>
																	                       
																	                       <tr>
																	                       <td align=center>
																	                       <table>
							
																	                           <tr>
																	                            <td align=center class=head09_13 height=20 >
																	                                   <asp:Label runat=server ID=lblFName> First Name </asp:label>
																	                            </td>
																	                            <td align=left height=20 >
																	                                   <asp:textbox runat=server MaxLength =20 id="FName"></asp:textbox>
																	                                   <asp:RequiredFieldValidator id="RequiredFieldValidator1" cssclass=RednormalText runat="server" ErrorMessage="First Name is required" ControlToValidate="FName"></asp:RequiredFieldValidator>
																	                            </td>
																	                           </tr>
																	                            <tr>
																	                            <td align=center height=20 class=head09_13>
																	                                    
																	                                    <asp:Label runat=server ID=lblLName> Last Name  </asp:label>
																	                            </td>
																	                            <td align=left height=20 >
																	                                   <asp:textbox runat=server MaxLength =20 id="LName"></asp:textbox>
																	                                   <asp:RequiredFieldValidator id="RequiredFieldValidator2" cssclass=RednormalText runat="server" ErrorMessage="Last Name is required" ControlToValidate="LName"></asp:RequiredFieldValidator>
																	                            </td>
																	                           </tr>
																	                           
																	                            <tr>
																	                            <td align=center height=20 class=head09_13>
																	                                    
																	                                    <asp:Label runat=server ID=lblOmtn> OMTN  </asp:label>
																	                            </td>
																	                            <td align=left height=20 >
																	                                   <asp:textbox runat=server MaxLength =20 id="Omtn"></asp:textbox>
																	                                    <asp:RequiredFieldValidator id="RequiredFieldValidator3" cssclass=RednormalText runat="server" ErrorMessage="OMTN is required" ControlToValidate="OMTN"></asp:RequiredFieldValidator>
																	                            </td>
																	                           </tr>
																	                      
																	                       </table> 
																	                       </tr>
																	                       </td>
																	                       
																	                        
																	                       
																	                       </table>
																	                          
																	                          
																	                        
																	                        
																	                        </td>
																	                        
																	                        
																	                      
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                    
																	                    
																	                    
																	                    
																	                     
																	                    </table>
																	                    </td>
																	                    
																	                      <%--<td class=head06_small align=center valign=top>
																	                        We can send invoice to your email 
																	                        <br><br>
																	                         
																	                         <asp:TextBox runat=server ID=txtEmail enabled=false CssClass=INPUTTEXT Width=280></asp:TextBox>
																	                        
																	                        <br><br>
																	                        
																	                   
<asp:HyperLink runat=server ID="Invoice" Text="SEND INVOICE"  CssClass="redtextbold" Height=30  NavigateUrl="ReservePayment.aspx?type=invoice" ></asp:HyperLink><br><br>

<span class=rednormaltext> The invoice will be canceled after 1 hour <br> The invoice takes minutes to arrive<br> Please check your inbox and junk email </span>
																	                      </td>--%>
																	                     
																	                    
																	                    </tr>
																	                    
																	                  
																	                
																	                </table>
																	                
																	                 
																	                </td>
																	            </tr>
																	      
																	       
																	    
																	            
																	            
																	                
																<TR>
																
																
																	<TD  align="center">
																	
																	 <img  id="loading"  >
																	</TD>
																	
																</TR>															                
                                                                                        
																	                 
																	              <tr> 
																	                <td  height=15 align=center>
																	                
																	                 	 <asp:Button ID="btnSubmit" runat="server" height=30 CssClass="inputbutton" Text="I made the payment" />
																	                    
																	                    
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
