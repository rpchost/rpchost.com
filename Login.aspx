<%@ Page Language="vb" AutoEventWireup="false" Inherits="Login" CodeFile="Login.aspx.vb" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   <link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
   		<title>Rpchost.com - Login section for live members; direct access to Fx signals</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="TITLE" CONTENT="Rpchost.com - Login section for live members; direct access to Fx signals">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="Rpchost.com live clients can login to the members area and access live forex alerts">
		<META NAME="KEYWORDS" CONTENT="forex, live forex trading, foreign exchange, trading platform, technical and fundamental Signals">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

  </head>
	<body leftMargin=0 topmargin=0 > 
		
					<form id="Form1" method="post" runat="server">
						
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%" align="center"
										border="0">
									
										<TR>
											<TD vAlign="top" height="100%">
												<table cellSpacing="0" cellPadding="0" height="100%">
													<tr>
														<td>
															<uc1:right runat="server" id="RightHeader"></uc1:right>
														</td>
													</tr>
												</table>
											</TD>
											<TD vAlign="top" width="100%" height="100%">
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<tr>
														<td vAlign="top">
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
															<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
																<tr>
																	<td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		 <asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																		
																	
																	</td>
																</tr>
																
																<tr>
																	<td class="head05" height=170 width="100%" align=center>
																	           
        																	          LOGIN </TD>
																	              
															                  </TD>
																</tr>
																
																
																
																<tr>
																	<td  align=center>
																		<table>
																		    <tr>
																	            <td >
																		
																		            <asp:Label id="Label2" runat="server" CssClass=head09>User ID</asp:Label>
																		        </td>
																		        <td >
																		
																		            <asp:TextBox id="txtUsrName" runat="server" CssClass="INPUTTEXT"></asp:TextBox>
																		        </td>
																            </tr>
																            
																             <tr>
																	            <td  height=13>
																		
																		            
																		        </td>
																		        <td >
																		
																		            
																		        </td>
																            </tr>
																            
																            
																             <tr>
																	            <td >
																		
																		           <asp:Label id="Label3" runat="server" CssClass="head09">Password</asp:Label>
																		        </td>
																		        <td >
																		
																		           <asp:TextBox id="txtPsw" runat="server" CssClass="INPUTTEXT" TextMode="Password"></asp:TextBox>
																		        </td>
																            </tr>
																            
																		</table>
																		
																		</td>
																</tr>
																
																
																<tr>
																	<td align=center height=50>
																		
																	
																		
																	</td>
																</tr>
																
																
															
																
																<tr>
																	<td align=center>
																		
																	&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button id="btnLogin" runat="server" Width=200 Height =30 CssClass="INPUTTEXTbtn" Text="LOGIN"></asp:Button>
																	
																	</td>
																</tr>
																
																<tr>
																	<td align=center>
																		
																	
																		 <asp:CheckBox ID="chkRememberMe" CssClass=BlacknormalText Text="Remember me" runat="server" />	
																	</td>
																</tr>
																
																<tr>
																	<td align=center height=30>
																		
																	 <asp:Label id="lblMess" CssClass=RednormalTextBold runat="server" Width="448px"></asp:Label>
																	
																	</td>
																</tr>
																
																																
																<tr>
																	<td align=center class=BlacknormalText > 
																	
																	Not a member yet, 	
																	<a href = "Register.aspx"> Register </a>
																		
																	</td>
																</tr>
																
																	<tr>
																	<td align=center class=BlacknormalText > 
																	
																	
																	<a href = "RecoverPassword.aspx"> Forgot your password </a>
																		
																	</td>
																</tr>
																<%--<tr>
																	<td align=center class=BlacknormalText> 
																	
																	Forgot your password, 	
																	<a href = "ForgotPassword.aspx"> Click here </a>
																		
																	</td>
																</tr>--%>
																		
																<tr>
																	<td height="50"> 
																	
																	
																	</td>
																</tr>
																		
                                                                                
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
												</table>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</form>
				</TD>
			</TR>
			



	</body>
</HTML>
