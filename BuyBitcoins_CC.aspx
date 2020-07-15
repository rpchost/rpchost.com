<%@ Page Language="VB" AutoEventWireup="false" ValidateRequest="false" enableEventValidation="false" CodeFile="BuyBitcoins_CC.aspx.vb" Inherits="BuyBitcoins_CC" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
	<head>
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
	
   <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131430617-1"></script>

   	
   	<script>
   	
   	function load() {
   	    document.getElementById("loading").src = "picture/loading2.gif";
         }
   	
   	</script>
   	
   	<script type="text/javascript">


   	    function Redisplay() {
   	        document.getElementById("loading").src = "picture/loading2.gif"
   	    }

    </script>



   		
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
																		
																		 <asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																		
																	
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
																	           
        																	         <%-- BUY BITCOIN WITH CREDIT CARD--%> 
																	              <asp:Label CssClass="head05" ID=lblTitle width="100%" runat=server></asp:Label>
															                  </TD>
																	      </tr>
																	      
																	   
                                                                         
																	      
																	       <tr>
																	          <td align=center>
																	           
																	                  <table border=0>
																	          
																	          
																	           <tr> 
																	                <td align=center  class=head09_13>
																	                
																	                <%--<img src="picture\CreditCard.jpg" width=150 />--%>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td  height=20 align=center>
																	                  <asp:Label runat=server ID=lblVerification CssClass=RedTextBold></asp:Label>
																	                
																	                 
																	                    </td>
																	            </tr>
																	            
																	            
																	              
																	            
																	           
																	            
																	             <tr> 
																	                <td height=10 align=center>
																	                
																	                <img  id="loading"  >
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center >
																	                   <asp:Label runat=server ID=lblAmountToPay cssclass=head06_small>Amount to pay</asp:Label>
																	                   
																	                    <br>
																	                   
																	                     <asp:Label runat=server ID=lblAmountLimit cssclass=head00_7></asp:Label>
																	                  
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtDepositAmount CssClass=INPUTTEXT_CENTER AutoPostBack=true Width=120 MaxLength=10 ></asp:TextBox>
																	                <asp:dropdownlist id="ddlCurrency" Width="80" CssClass="inputtext" AutoPostBack=true Runat="server">
										                                                    <asp:ListItem Value="EUR" Selected="True">EUR</asp:ListItem>
										                                                    <asp:ListItem Value="USD">USD</asp:ListItem>
																	                   </asp:dropdownlist>
																	                   
																	                
																	                </td>
																	            </tr>
																	             <tr> 
																	                <td align=center height=10>
																	                
																	                 
																	                   
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	            
																	              <tr> 
																	                <td align=center class=head06_small>
																	                   BTC amount you get
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server enabled=false ID=txtBtcAmount CssClass=INPUTTEXT_CENTER AutoPostBack=true Width=150 MaxLength=20 ></asp:TextBox>
																	               
																	                   
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	              <tr> 
																	                <td align=center class=head06_small>
																	                  Your bitcoin wallet address
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtBtcAddress CssClass=INPUTTEXT_CENTER Width=400 MaxLength=70 ></asp:TextBox>
																	                   
																	                
																	                </td>
																	            </tr>
																	            
																	            <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	              <tr> 
																	                <td align=center >
																	                 <asp:Label runat=server ID=lblRevolutPhone visible=false CssClass =head06_small>Your phone number associated to your Revolut account [Country Code] [Area Code] [Phone Number]</asp:Label>
																	                  
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtRevolutPhone visible=false CssClass=INPUTTEXT_CENTER Width=250 MaxLength=25 ></asp:TextBox>
																	                   
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	            <%--  <tr> 
																	                <td align=center class=head00_7>
																	                  Payment request will be sent to your email
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtEmail Enabled=false CssClass=INPUTTEXT Width=240 ></asp:TextBox>
																	                   
																	                
																	                </td>
																	            </tr>--%>
																	            
																	             <tr> 
																	                <td  height=30>
																	                
																	                 
																	                </td>
																	            </tr>
																	            
																	               <tr> 
																	                <td height=50 class=RednormalText align=center>
																	                
																	                     Please be sure of your Bitcoin address, wrong BTC addresses is not refundable. Receiving 
                                                                                         bitcoins may take 30 minutes to 4 hours (sometimes it takes maximum 2 days) depending on network difficulty<br>
																	                        you can Edit or Cancel the payment while the transaction is in pending mode<br><br>
																	                        
																	                       
																	                        <asp:label runat=server CssClass="redtextbold" ID=lblMsg ></asp:label>
																	                    
																	                        
																	                       
                                                                                         <br><br>
                                                                                         
                                                                                         Whatever problem happen during buying process please <a href=contact.aspx title="Contact us" target=_blank>contact us</a>, 
                                                                                         we will fix it directly
                                                                                         
                                                                                         
                                                                                         
                                                                                         </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td class=head09 align=center valign=top>
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td height=40>
																	                </td>
																	            </tr>
																	            
																	            <tr> 
																	                <td align=center valign=top>
																	                
																	                
		
																	                <asp:Button id="btnSubmit" runat="server" Text="Make Payment" Width="300px"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
																	                  
																	                <asp:Button id="btnCancelPayment" runat="server" Text="Edit/Cancel transaction" Width="170px" Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
																	               
																	               <asp:Button id="btnConfirmPayment" runat="server" Text="Confirm WesterUnion Payment" visile=false Width="210" Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
																	               <asp:Button id="btnConfirmOmtPayment" runat="server" Text="Confirm OMTN" visile=false Width="180" Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                                                                                    
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
