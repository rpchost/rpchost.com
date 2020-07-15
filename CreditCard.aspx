<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CreditCard.aspx.vb" Inherits="CreditCard" %>


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


//alert(document.getElementById("MM").value);       


//var amount = document.getElementById('amount');

// Render the PayPal button
paypal.Button.render({
// Set your environment
env: 'production', // sandbox | production

// Specify the style of the button
style: {
  layout: 'vertical',  // horizontal | vertical
  size:   'medium',    // medium | large | responsive
  shape:  'rect',      // pill | rect
  color:  'gold'       // gold | blue | silver | white | black
},

// Specify allowed and disallowed funding sources
//
// Options:
// - paypal.FUNDING.CARD
// - paypal.FUNDING.CREDIT
// - paypal.FUNDING.ELV
funding: {
  allowed: [

    paypal.FUNDING.CARD,
    paypal.FUNDING.CREDIT
  ],
  disallowed: []
},

// Enable Pay Now checkout flow (optional)
commit: true,

// PayPal Client IDs - replace with your own
// Create a PayPal app: https://developer.paypal.com/developer/applications/create
client: {
//  sandbox: 'AaiiXnu42QaCvvR3JTEW8VENDEgtwA3j8jaGfaUx3gip1FQP5VDNmQhYtFwAI9zUu1PveGssnbforvLT',
production: 'AVu7kB4odMjbJ98gdp3fk55ovjN_QW7_ync_WfQfoT1mVa4nYRLdjUHjIW_jm-lA3Pf02tqcu2trgeEJ'
},

payment: function (data, actions) {
  return actions.payment.create({
    payment: {
      transactions: [
        {
          amount: {
            total: document.getElementById('<%= txtDepositAmount.ClientID %>').value,

            currency: '<%= curr %>'
          },
          description: document.getElementById('<%= txtBtcAmount.ClientID %>').value + " BTC "
        }
      ]
    }
  });
},

onAuthorize: function (data, actions) {
  return actions.payment.execute()
    .then(function () {
      //window.alert('Payment Complete!');
      
      window.location.replace('ReservePayment.aspx');
    });
}
}, '#paypal-button-container');





</script>
    

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server action="https://www.paypal.com/cgi-bin/webscr" method="post">
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
																		<div class=head09 >BUY BITCOIN</div>
																	
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
																	           
																	                  <table border=0>
																	          
																	          
																	           <tr> 
																	                <td align=center  class=head09_13>
																	                
																	                <%--<img src="picture\CreditCard.jpg" width=150 />--%>
																	                
																	              <%--  Buy bitcoin directly with your credit card <u>WITHOUT VERIFICATION</u>--%>
																	                
																	                </td>
																	            </tr>
																	            
																	             
																	            
																	              <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                     
																	                   
																	                  
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=left >
																	                
																	                    <table border=0>
																	                    <tr> 
																	                         <td>
																	                               
																	                                    <td align=center class=head06_small>
																	                                         <asp:Label runat=server ID=lblAmountToPay Width=220></asp:Label>
																	                                        <br><br>
																	                                        <asp:TextBox runat=server ID=txtDepositAmount enabled=false CssClass=INPUTTEXT Width=120 MaxLength=10 ></asp:TextBox>  
																	                                    </td>
																	                                																	                                
																	                        </td>
																	                        
																	                        <td width=100 align=center>
																	                               
																	                                   <img src="picture/flat.gif" />
																	                                																	                                
																	                        </td>
																	                        
																	                        
																	                         <td >
																	                    
																	                      
																	                            
																	                                <td align=center width=350 class=head06_small>
																	                                BTC you get <u>(No hidden fees)</u>
																	                               <br><br>
																	                               <asp:TextBox runat=server enabled=false ID=txtBtcAmount CssClass=INPUTTEXT Width=150 MaxLength=20 ></asp:TextBox>
																	                               
																	                                </td>
																	                            
    																	            
    																	                     </td>
    																	                     
    																	                     
    																	                       <td width=100 align=center>
																	                               
																	                                   
																	                                																	                                
																	                        </td>
																	                        
    																	                     
    																	                     <td >
																	                    
																	                                <td align=center class=head06_small>
																	                               Your bitcoin wallet address
																	                               <br><br>
																	                                <asp:TextBox runat=server ID=txtBtcAddress enabled=false CssClass=INPUTTEXT Width=420 MaxLength=55 ></asp:TextBox>
																	                   
																	                                </td>
																	                            
    																	            
    																	                     </td>
																	                    </tr>
																	            
																	                   
																	                    </table>
																	                  
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
																	                <td  height=60 align=center>
																	                
																	                   <asp:Label runat=server ID=lblVerification CssClass=RednormalTextBold>
																	                     When you pay by Credit Card please do not close the page, when the payment finish you will be redirected to your Transactions History section where you will see your order
																	                     </asp:Label>
																	                    
																	                    </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  align=center height=140 >
																	                
																	                <table border=1 bordercolor=000000>
																	                
																	                    <tr>
																	                    <td height=100% valign=top align=left>
																	                    <table  height=140>
																	                        <tr>
																	                         <td>
																	                         
																	                        </td>
																	                        </tr>
																	                         <tr>
																	                         <td class=RednormalTextBold align=right>
																	                            Pay with Paypal  >>>
																	                        </td>
																	                        </tr>
																	                         <tr>
																	                         <td class=RednormalTextBold align=right>
																	                            Pay with Credit Card     >>> 																	                        </td>
																	                        </tr>
																	                    </table>
																	                    </td>
																	                    
																	                    <td>
																	                     <div id="paypal-button-container"></div>
																	                    </td>
																	                    
																	                     <td width=200 align=center class="head05">
																	                      OR 
																	                    </td>
																	                    
																	                      <td class=head06_small align=center valign=top>
																	                        We can send invoice to your email 
																	                        <br><br>
																	                         
																	                         <asp:TextBox runat=server ID=txtEmail enabled=false CssClass=INPUTTEXT Width=280></asp:TextBox>
																	                        
																	                        <br><br>
																	                        
																	                       <%-- <asp:Button id="btnSubmit" runat="server" Text="SEND INVOICE" Width="160px" Height=43 CssClass="INPUTBUTTON"></asp:Button>
 --%>
<asp:HyperLink runat=server ID="Invoice" Text="SEND INVOICE"  CssClass="redtextbold" Height=30  NavigateUrl="ReservePayment.aspx?type=invoice" ></asp:HyperLink><br><br>

<span class=rednormaltext> The invoice will be canceled after 1 hour <br> The invoice takes minutes to arrive<br> Please check your inbox and junk email </span>
																	                      </td>
																	                     
																	                    
																	                    </tr>
																	                    
																	                  
																	                
																	                </table>
																	                
																	                 
																	                </td>
																	            </tr>
																	      
																	      
																	      <tr> 
																	                <td  height=15>
																	                
																	                 																	                
																	              
																	                    
																	                    </td>
																	            </tr>
																	            
																	         <tr> 
																	                <td   align=center>
																	                
																	                 																	                
																	              <a href=BuyBitcoins_CC.aspx>  &lt;&lt; &nbsp&nbsp     Back</a>
																	                
																	                    
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




</form>

	</body>
</HTML>
