<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Crd.aspx.vb" Inherits="Crd" %>

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
   	    document.getElementById("loading").src = "picture/loading1.gif";
         }
   	
   	</script>
    

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server >

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
																	      

																	       
																	          <td align=center height="50">
																	          
																	               

																		
																		
																	            </TD>
																	
																
																	
																	
														
																</TR>

                                                                <tr>
																	      

																	       
																	          <td align=center height="50" class="head10">
																	          
																	               
                                                                                  We will send you a payment link to your phone, this link will
                                                                                  ask you to register with paysend, few easy steps and you will be able
                                                                                  to make the payment with your credit card, easily, securely and quickly<br />
                                                                                  <br />
                                                                                  Once we receive the payment it will appear directly in your account</TD>
																	
																
																	
																	
														
																</TR>


                                                                <tr>
																	       <td align=center height="50">
																	          
																	           
																	            </TD>
																	
																</TR>

                                                                  <tr>
																	          <td align=center class="head06_small">
																	          
                                                                                  Amount to deposit
																	           
																	            </TD>
																</TR>

                                                                 <tr>
																	          <td align=center height="50">
																	          
                                                                                  <asp:TextBox ID="txtAmount" runat="server" Width="100" Height="35" CssClass="INPUTTEXT_CENTER" ></asp:TextBox> &nbsp;eur
																	           
																	            </TD>
																</TR>

                                                                 <tr>
																	       <td align=center height="50">
																	          
																	           
																	            </TD>
																	
																</TR>

                                                                  <tr>
																	          <td align=center class="head06_small">
																	          
                                                                                  We will send you the payment link to your phone
																	           
																	            </TD>
																</TR>

                                                                 <tr>
																	          <td align=center>
																	          
                                                                                  <asp:TextBox ID="txtPhone" runat="server" Height="35" Enabled="FALSE" CssClass="INPUTTEXT_CENTER" ></asp:TextBox>
																	           
																	            </TD>
																</TR>

                                                                 <tr>
																	          <td align=center>
																	          
                                                                                  <a href="profile.aspx" class="BlueSmallText">Change your phone number here</a>
																	           
																	            </TD>
																</TR>


                                                                 <tr>
																	       <td align=center height="50">
																	          
																	           
																	            </TD>
																	
																</TR>

                                                                  

                                                                 <tr>
																	          <td align=center>
																	          
                                                                                  <asp:button ID="btnSubmit" runat="server" Height="50" Text="Send me the payment link" CssClass="INPUTTEXTbtn" onclientclick="Redisplay()"></asp:button>
																	           
																	            </TD>
																</TR>

                                                                  <tr>
																	          <td align=center>
																	          
                                                                                  <img  id="loading">
																	           
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

