<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrCd.aspx.vb" Inherits="CrCd" %>


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

// Render the PayPal button
paypal.Button.render({
// Set your environment
env: 'sandbox', // sandbox | production

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
allowed: [paypal.FUNDING.CARD],
disallowed: [paypal.FUNDING.CREDIT]
},

// Enable Pay Now checkout flow (optional)
commit: true,

// PayPal Client IDs - replace with your own
// Create a PayPal app: https://developer.paypal.com/developer/applications/create
client: {
sandbox: 'AXDOAJVtwXOe-LYY-kB8VADYEZZUmYDLvog8nIRFreoaUAWDZzF-z44SCj0EHNjTBJjDuyvhF6s6a35E'
//production: 'AQYnHMUWxxHlFj3fARFvFsdf-PxbDb0HYJnEPqjnauMIaznuMSA4luaST1i8iO0gsoZu8CYSOliPGwQV'
},

// Set up the transaction
//            createOrder: function(data, actions) {
//                return fetch('/demo/checkout/api/paypal/order/create/', {
//                    method: 'post'
//                }).then(function(res) {
//                    return res.json();
//                }).then(function(data) {
//                    return data.orderID;
//                });
//            },



payment: function (data, actions) {
  return actions.payment.create({
    payment: {
    
      transactions: [
        {
          amount: {
            total: document.getElementById('<%= txtDepositAmount.ClientID %>').value,

            currency: '<%= curr %>'
          },
          description: document.getElementById('<%= txtBtcAmount.ClientID %>').value + " BTC.  " +  " Wallet =  " + document.getElementById('<%= txtBtcAddress.ClientID %>').value + ". UserID = " + document.getElementById('<%= txtUserID.ClientID %>').value,
          
          payment_options: {
        allowed_payment_method: 'INSTANT_FUNDING_SOURCE'
      }
      
        }
      ]
    }
  });
},

//onApprove: function(data, actions) {
//      // Capture the funds from the transaction
//      return actions.order.capture().then(function(details) {
//        // Show a success message to your buyer
//      alert('Transaction completed by First Name ' + details.payer.name.given_name);
//     // alert('Transaction completed by full Name ' + details.payer.name.Surname);
//      alert('Transaction completed by Phone_number ' + details.payer.phone.phone_number);
//      });
//    },

    onAuthorize: function(data, actions) {

    return actions.order.capture().then(function(details) {
        // Show a success message to your buyer
   // alert('Transaction completed by First Name ' + details.payer.name.given_name);
   // alert('Transaction completed by full Name ' + details.payer.name.surname);

    // alert('Transaction completed by full Name ' + details.payer.address.country_code);

    //alert('Transaction completed by full Name1 ' + details.payer.payer_info.phone_number);
    //alert('Transaction completed by full Name2 ' + details.payer.payer_info.phone);
    //('Transaction completed by full Name3 ' + details.payer.payer_info.email_address);

    window.location.replace('ReservePayment.aspx?Type=1');
    document.getElementById("loading").src = "picture/loading2.gif";

    
    });
    
  return actions.payment.execute().then(function() {

  //window.location.replace('ReservePayment.aspx?Type=1&fN=');
      
       
     // document.getElementById("loading").src="picture/loading2.gif";
    });
}
}, '#paypal-button-container');

</script>
    

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server action="https://www.paypal.com/cgi-bin/webscr" method="post">

									d<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
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
																	                   
																	                   <<< PLEASE READ CAREFULLY >>>   <br>
																	                     While doing the transaction, be sure you provide correct info; <u>your First Name, Last Name, Email, Phone number and Country</u> should match your data in <a href='profile.aspx' title='your Profile' target=_blank>profile</a> section <br>
																	                                      We will send to your phone a passcode to verify that you are making the transaction. We will review the transaction before sending you the bitcoins<br> if  
																	                                      something suspicious we will refund your payment. Your security is our priority
																	                     </asp:Label>
																	                    
																	                    </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  align=center height=140 >
																	                
																	                <table border=0 bordercolor=000000>
																	                
																	                    <tr>
																	                    <td height=100% valign=top align=left>
																	                    <table  height=140>
																	                    
																	                    
																	                     <tr>
																	                    
																	                        <td class="head09_13" valign=top>
																	                            PAY WITH CREDIT CARD
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                   
																	                    
																	                    <tr>
																	                    
																	                        <td>
																	                        <div id="paypal-button-container"></div>
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                    
																	                    
																	                      <tr>
																	                    
																	                        <td align=center>
																	                        <img  id="loading" >
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                    
																	                     
																	                    </table>
																	                    </td>
																	                   
																	                    
																	                    
																	                   <%--  <td >
																	                      <table  height=140>
																	                    
																	                    
																	                     <tr>
																	                    
																	                        <td class="head09_13" align=center height=20 valign=top>
																	                             Pay to our paypal account
																	                        </td>
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                   
																	                    
																	                    <tr>
																	                    
																	                        <td align=center>
																	                       
																	                       
																	                       <table>
																	                      
																	                       <tr>
																	                        <td align=center height=20 class="redtextbold">
																	                              <a href="http://www.paypal.me/rpchost" class="redtextbold" target=_blank>Pay us here</a>
																	                        </td>
																	                       </tr>
																	                          <tr>
																	                        <td align=center height=20 class="redsmalltext">
																	                               <a href= "#" onclick="window.open('picture/paypal.jpg','_blank')" > [See an Example]</a>
																	                        </td>
																	                       </tr>
																	                       
																	                       
																	                      
																	                         <tr>
																	                        <td align=center class="bluetext" height=40>
																	                             
																	                             You're sending to Rpchost : <asp:label runat=server ID=lblPyToRpc ></asp:label>
																	                             <br> in the note section please copy/paste the following
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                         <tr>
																	                        <td align=center class="head00_8_5" >
																	                           
																	                             UserID :
																	                             
																	                              <asp:label runat=server ID=lblUSerID  ></asp:label>
																	                        
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                        <tr>
																	                        <td align=center class=head00_8_5>
																	                           
																	                             Amount to pay :
																	                             
																	                              <asp:label runat=server ID=lblAmount ></asp:label>
																	                        
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                        <tr>
																	                        <td align=center class=head00_8_5>
																	                           
																	                             BTC to get :
																	                             
																	                              <asp:label runat=server ID=lblAmountBtc ></asp:label>
																	                        
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                        <tr>
																	                        <td align=center class=head00_8_5>
																	                           
																	                             Wallet :
																	                             
																	                              <asp:label runat=server ID=lblWallet></asp:label>
																	                        
																	                              
																	                        </td>
																	                       </tr>
																	                       
																	                       </table>
																	                          
																	                          
																	                        
																	                        
																	                        </td>
																	                        
																	                        
																	                      
																	                        
																	                       
																	                        
																	                        
																	                    </tr>
																	                    
																	                    
																	                    
																	                    
																	                     
																	                    </table>
																	                    </td>
																	                    --%>
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
																	      
																	      
																	      <tr> 
																	                <td  height=15>
																	                
																	                 																	                
																	              
																	                    
																	                    </td>
																	            </tr>
																	            
																	         <tr> 
																	                <td   align=center>
																	                
																	                 																	                
																	              <a href=BuyBitcoins_CC.aspx class="inputbutton" width=150>&nbsp; Back &nbsp;</a>
																	                
																	                    
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
