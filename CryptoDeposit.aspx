<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" EnableViewState="false" CodeFile="CryptoDeposit.aspx.vb" Inherits="CryptoDeposit" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
		<head id="Head1" runat="server">
		
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
																
																<td width=100% align=center>
																
															
															
															                <table>
															                
															                    <tr>
															                    <td height=20 class=head05> 
															                    DEPOSIT WITH CRYPTOCURRENCY
															                    </td>
															                    
															                    </tr>
															                    
															                      <tr>
															                    <td height=100> 
															                   
															                    </td>
															                    
															                    </tr>
															                    
															                      <tr>
															                    <td height=30  class="head00" align=center> 
															                  <div align=center> Amount to Deposit</div>
															                    </td>
															                    
															                    </tr>
                															  
															                <tr>
															                    <td align=center> 
															                        <asp:RadioButtonList ID="rdDeposit" runat="server"  cssclass="head00"
                                                                                        RepeatDirection="Horizontal" >
                                                                                        <asp:ListItem Text="100 EUR" Value="100" selected />
                                                                                        <asp:ListItem Text="200 EUR" Value="200" />
                                                                                    </asp:RadioButtonList>
															                    </td>
															                </tr>
															                
															                   <tr>
															                    <td> 
															                       
                                                                                    </asp:RadioButtonList>
															                    </td>
															                </tr>
                															
                															 <tr>
															                    <td height=50> 
															                   
															                    </td>
															                    
															                    </tr>
                															
                															   <tr>
															                    <td align=center> 
															                        
															                        <asp:button runat=server ID=btnSubmit Text="Deposit" 
                                                                                        CssClass="INPUTBUTTON" Height="35px" width=120/>
															                        
															                    </td>
															                </tr>
															                
															                  <tr>
															                    <td align=center  class=BlueSmallTextLine> 
															                        
															                       Please provide Full name and Email exactly as registered with Rpchost.com
															                        
															                    </td>
															                </tr>
                															
                															
                														
                															
															                </table>
																	
																	</td>
																	
														
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

