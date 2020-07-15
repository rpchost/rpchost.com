<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LendingProgram.aspx.vb" Inherits="LendingProgram" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<meta name="verify-admitad" content="2504a66eeb" />	

  </head>
	<body leftMargin=0 topmargin=0 > 
	<form id="Form1" runat=server>
								
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
										border="0">
																				
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
														<td align="center" >
															
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<td Width="100%" Class="INPUTTITLETEXT" valign=middle Height="25">
																		<!-- Content goes here -->
																		
																	<asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
														</td>
													</TR>
													<TR>
														<td height="20">
														</td>
													</TR>
													
													  <tr>
																	          <td class="head05" width="100%" align=center>
																	           
        																	          LENDING PROGRAM</TD>
																	      </tr>
																	      
																	      
																	      
																	      <tr>
																	          <td class="head06">
																	             22% Monthly Profit
															                  </TD>
																	      </tr>
																	      
																	      <TR>
														<td height="50">
														</td>
													</TR>
																	      
																	      
													<TR>
														<td Height="115" valign="top" align=center>
															<TABLE width="100%" height="130"  BORDER="0" CELLSPACING="3" CELLPADDING="0">
																<TR>
																																	
																	<td  align=left>
																	    <img src="picture/Lending.jpg" width=450 height=350 />
																	</td>
																	
																	
																	<td  width=100% valign=top>
																	    <table border=0 width=100% bordercolor=black>
																	       <tr>
																	                        <td class=head10  width=200 >
																	                           USD Lending
																	                        </td> 
																	                       
																	                        <td width=200 >
																	                        
																	                        <table>
																	                            <tr>
																	                                <td>
																	                                     <asp:RadioButtonList CssClass=head10_Left runat=server ID = RdLend  RepeatColumns=3>
                                                                                                        <asp:ListItem Text="Starter[100]" Value="100" Selected></asp:ListItem>
                                                                                                        <asp:ListItem Text="PRO [500]" Value="500" ></asp:ListItem>
                                                                                                        </asp:RadioButtonList>
																	                                </td>
																	                                 <td>
																	                                    <asp:Button runat=server ID=btnLend  Width=100 Height=25 Enabled=false CssClass=INPUTBUTTON Text="LEND"></asp:button>
																	                                </td>
																	                            </tr>
																	                            
																	                        </table>
                                                                                               
                                                                                                
																	                        </td> 
																	                        
																	                       
																	                        
																	                    </tr>
																	                    
																	                    
																	                     <tr>
																	                    
																	                   
																	                        
																	                         <td class=head10>
																	                           BTC Lending
																	                        </td> 
																	                        
																	                        <td width=200>
																	                        
																	                        <table>
																	                            <tr>
																	                                <td>
																	                                 <asp:RadioButtonList CssClass=head10_Left runat=server ID = RdBtcLending RepeatColumns=3>
                                                                                                    <asp:ListItem Text="Starter [100]" Value="100" Selected></asp:ListItem>
                                                                                                    <asp:ListItem Text="PRO [500]" Value="500"  ></asp:ListItem>
                                                                                                     </asp:RadioButtonList>
																	                                </td>
																	                                
																	                                <td>
																	                                 <asp:Button runat=server ID=btnBtcLend  Width=100 Height=25 Enabled=false CssClass=INPUTBUTTON Text="LEND"></asp:button>
																	                                </td>
																	                            </tr>
																	                        </table>
																	                           
                                                                                                
                                                                                                 
																	                        </td> 
																	                        </tr>
																	                        
																	                        <tr>
																	                            <td height=50>
																	                            </td>
																	                        </tr>
																	                        
																	                            <tr>
																	                            <td colspan=3>
																	                            
																	                          
																	                             <asp:Button runat=server ID=btnInvest  Width=150 Height=25 CssClass=INPUTBUTTON Text="Invest / Withdraw"></asp:button>
																	                          
																	                             &nbsp;&nbsp;&nbsp;
																	                          
																	                             <asp:Button runat=server ID=btnHistory  Width=150 Height=25 CssClass=INPUTBUTTON Text="Investment History"></asp:button>
																	                            </td>
																	                        </tr>
																	                        
																	                         <tr>
																	                            <td height=50>
																	                            </td>
																	                        </tr>
															
															                                <tr>
																	                            <td  class=RedTextBold colspan=3>
																	                            
																	                           We are only managing our 2017 registered clients 
																	                           in our lending program. When we reopen the lending program
																	                           we will post it in the News section
																	                            
																	                            </td>
																	                        </tr>
																
																
															
																
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




		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type=text/javascript></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
</form>

	</body>
</HTML>