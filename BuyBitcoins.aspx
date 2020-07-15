<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuyBitcoins.aspx.vb" Inherits="BuyBitcoins" %>

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

   	<script type="text/javascript">
   	    function Redisplay() {
   	        document.getElementById("loading").src = "picture/loading.gif"
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
    
    

        <style type="text/css">
            .auto-style1 {
                height: 136px;
            }
        </style>
    
    

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
																	           
        																	          BUY BITCOIN 
        																	          
															                  </TD>
																	      </tr>
																	      
																	   
                                                                            <tr>
																	          <td  height=50 align=center>
																	           
        																	        <img  id="loading"  >
																	              
															                  </TD>
																	      </tr>
																	      
																	        <tr>
																	          <td  align=center class="head00_8_5">
																	           
																	           
																	            If you are in US, UK, Spain, or Australia. You can buy bitcoin by making transfer with <a href="https://www.riamoneytransfer.com" title="Ria Money Transfer" target=_blank>Ria Money Transfer</a>
        																	        
																	              
															                  </TD>
																	      </tr>
																	      
																	         <tr>
																	          <td  align=center class="head00_8_5">
																	           
																	           
																	           If you have TransferWise, Revolut or WorldRemit account, you can buy bitcoin easily with us</a>
																	               
																	              
															                  </TD>
																	      </tr>
																	      
																	       <tr>
																	          <td  align=center class="head00_8_5">
																	           
																	           
																	          <%-- You can buy bitcoin by making a transfer from any country in world thru <a href="https://www.WorldRemit.com" target=_blank title="WorldRemit"> WorldRemit</a>. [Pay with your Credit Card]
																	             
																	             <br>--%>
																	             
																	              <span class=RednormalText> <a href=contact.aspx title="Contact us" target="_blank"> Contact us </a> 
                                                                                  if it suits you any of the above payments types</span><br><br><br>
                                                                                     
                                                                                    <span class="head00_8_5"> You have to <a href=AccountVerification.aspx title="Verify your account">verify</a> your account to buy bitcoin with credit card and Paypal</span>            
															                  </TD>
																	      </tr>
																	      
																	      
																	        <tr>
																	          <td  height=20>
																	           
																	            
															                  </TD>
																	      </tr>
																	      
																	      
																	       <tr>
																	          <td align=center width="900">
																	           
																	                  <table border=1 bordercolor=black width="1000" height=200>
																	          
																	          
																	          
																	                        <tr>
																	                          <td align=center valign=top>
                																	           
                																	                 <asp:Button id="btnPayCC" runat="server" Text="Pay with Credit Card" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class="head00_8_5">Between 1 and 4%(Depending on your country)</span><br>
                																	           
                																	           <asp:hyperlink runat=server ID=lblVerMessage ></asp:hyperlink>
                																	           <br><br> 
                																	           <asp:Label runat=server ID=lblCrPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                   <td align=center valign=top>
                																	           
                																	                 <asp:Button id="btnPayPaypal" runat="server" Text="Pay with Paypal" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           <br><br>
                																	           
                																	           <span class="head00_8_5">1 to 4% [Paypal fee]</span><br>
                																	            <asp:hyperlink runat=server ID=lblPaypalMessage ></asp:hyperlink>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblPayplPendingPaymnt CssClass="rednormaltextbold"></asp:Label>
                																	           
															                                  </TD>
															                                  
															                                   <td align=center valign=top>
                																	           
                																	                 <asp:Button id="btnPayBankTransfer" runat="server" Text="Pay with Bank Transfer" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	                 <span class="head00_8_5">0% Fee</span>
                																	                 
                																	                  
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblBnkPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
                																	           
                																	           
															                                  </TD>
																	                        </tr>
																	                        
																	                        
																	                        
																	                           <tr>
																	                          <td align=center height=10 colspan=3  >
                																	           
                																	          
                																	           
															                                  </TD>
															                                  
																	                        </tr>
																	                        
																	                       
																	                        
																	                        
																	                        
																	                         <tr>
																	                          <td align=center>
                																	           
                																	                 <asp:Button id="btnPayPerf" runat="server" Text="Pay with PerfectMoney" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class="head00_8_5">1 to 4% [PerfecMoney fee]</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblPMPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                   <td align=center>
                																	           
                																	                  <asp:Button id="btnPayMoneyGram" runat="server" Text="Pay with WesterUnion" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class=head00_8_5>
                																	           0% Fee
                																	          </span>
                																	           
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblWesterPendingPaymnt CssClass="rednormaltextbold"></asp:Label>
                																	           
															                                  </TD>
															                                  
															                                  
															                                   
															                                    <td align=center>
                																	           
                																	                  <asp:Button id="btnPayRevolut" runat="server" Text="Pay with REVOLUT" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class=head00_8_5>
                																	           0% Fee
                																	           </span>
                																	           
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblRevolutPendingPaymnt CssClass="rednormaltextbold"></asp:Label>
                																	           
															                                  </TD>
															                                  
																	                        </tr>
																	              
																	             <tr>
																	                          <td align=center height=10 colspan=3  >
                																	           
                																	          
                																	           
															                                  </TD>
															                                  
																	                        </tr>
																	            
																	                <tr>
																	                          <td align=center class="auto-style1">
                																	           
                																	                 <asp:Button id="btnOmt" runat="server" Text="Pay with OMT" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class="head00_8_5">0% Fee</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblOMTPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                   <td align=center class="auto-style1">
                																	           
                																	                 <asp:Button id="btnWise" runat="server" Text="Pay with TransferWise" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
															                                  
															                                    <br><br>
                																	           
                																	           <span class="head00_8_5">0% Fee</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblWisePendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                  
															                                   
															                                    <td align=center class="auto-style1">
                																	           
                																	                 
															                                  </TD>
															                                  
																	                        </tr>
																	                        
																	      
																	             
																	                  </table>
																	           
															                  </TD>
																	            </tr>
																	      
                                                                          <tr>
                                                                              <td align="center">
                                                                                  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
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
