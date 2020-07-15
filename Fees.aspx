<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Fees.aspx.vb" Inherits="Fees" %>


<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<meta name="verify-admitad" content="2504a66eeb" />	

  

</head>
	<body leftMargin=0 topmargin=0 > 
								<form id="Form1" runat=server>
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
														<td Width="100%" Class="inputtitletext" height=25 valign=middle >
																		<!-- Content goes here -->
																		 <asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																	
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
																	          <td class="head05" width="100%" height=150 align=center>
																	           
        																	          FEES
        																	          
        																	  </TD>
																	              
															                 
																	   </tr>
																	      
																	   <%--   <tr>
																	          <td class="head06">
        																	          <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>
															                  </TD>
																	      </tr>--%>
																	      
																	      
																	     
																	      
																	       
																	      
																	       <tr>
																	          <td align=center>
																	           <table border=1 cellpadding=0 height=320 cellspacing=0 bordercolor=000000>
																	           
																	            <tr>
																	                <td width=170 class="head07" height=30>
																	          
        																	           FEES
        																	      
        																	        </TD>
        																	        
        																	       <%-- <td width=30><img src="picture/PM.jpg" width=150/></TD>
        																	        <td  width=30><img src="picture/Payeer.png" width=150 /></TD>
        																	         <td width=30 align=center><img src="picture/WU.jpg" width=120 /></TD>--%>
        																	         <td  width=130 class=head09_13 >CREDIT CARD</TD>
        																	         <td  width=130 class=head09_13 >BANK TRANSFER</TD>
        																	         <td  width=130 class=head09_13 >PAYPAL</TD>
        																	         
        																	         <td  width=130 class=head09_13 >REVOLUT</TD>
        																	         <td  width=130 class=head09_13 >BITCOIN</TD>
        																	        <%-- <td  width=120 align=center><img src="picture/Bitcoin1.jpg" width=100 /></TD>--%>
        																	        
																	              </tr>
																	           
																	             <tr>
																	                <td width=20 class=head09_13>
																	          
        																	                  DEPOSIT
        																	      
        																	        </TD>
        																	           
        																	       <%-- <td width=30 align=center class="head10">
        																	            2%
        																	        </TD>
        																	        <td  width=30 align=center class="head10">
        																	            2%         																	        </TD>
        																	        
        																	        <td  width=30 align=center class="head10">
        																	        Normal Western <br> Union fee  --%>      																	        </TD>
        																	         <td  width=30 align=center class=head01_9_normal>
        																	              1 to 4 %</TD>
        																	          <td  width=30 align=center class=head01_9_normal>
        																	              FREE
        																	         </TD>
        																	          <td  width=30 align=center class=head01_9_normal>
        																	          1 to 4 % <br>Paypal fee
        																	         </TD>
        																	         
        																	         <td  width=30 align=center class=head01_9_normal>
        																	             FREE</TD>
        																	             
        																	              <td  width=30 align=center class=head01_9_normal>
        																	             FREE</TD>
        																	        <%--  <td  width=30 align=center class="head10">
        																	          0%
        																	         </TD>--%>
        																	         
																	              </tr>
																	              
																	              <tr>
																	                <td width=20 class=head09_13>
																	                    WITHDRAW</TD>
        																	          
        																	        <%--<td class="head10">5%</TD>
        																	        <td  class="head10">5%</TD>
        																	        <td  class="head10">Normal Western<br> Union fee    </TD>--%>
        																	        <td  class=head01_9_normal align=center>  
        																	        
        																	            Not available</TD>
        																	        <td  class=head01_9_normal align=center>
        																	        
        																	           <%-- SEPA:
        																	        
        																	            We do not charge any transfer<br> fees from our side.<br> Only your bank fees (if applicable)<br> will be charged
        																	        <br><br>
        																	        
        																	            International wire: Beneficiary will<br> be charged the transfer fees --%>
        																	            
        																	            EU zone :
        																	            
        																	            FREE<br />
&nbsp;Swift zone : Wire transfer
                                                                                        <br />
                                                                                        fees</TD>
        																	        <td  class=head01_9_normal align=center>1 to 4 % <br>Paypal fee</TD>
        																	        
        																	        
        																	         <td  class=head01_9_normal align=center>FREE</TD>
        																	         
        																	           
        																	         <td  class=head01_9_normal align=center>FREE</TD>
        																	         
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
</script></td>
                                                                              </tr>


                                        <tr>
                                                                              <td align="center">
                                                                                  <script type="text/javascript">
	atOptions = {
		'key' : '10b7f767e2a3a6373ac4b54d0ba8bef4',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
	document.write('<scr' + 'ipt type="text/javascript" src="http' + (location.protocol === 'https:' ? 's' : '') + '://www.hiprofitnetworks.com/10b7f767e2a3a6373ac4b54d0ba8bef4/invoke.js"></scr' + 'ipt>');
</script></td>
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