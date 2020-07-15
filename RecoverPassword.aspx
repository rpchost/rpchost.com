<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RecoverPassword.aspx.vb" Inherits="RecoverPassword" %>

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
																	<TD>
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
																	          <td class="head05" height=150 align=center>
																	           
        																	         RECOVER PASSWORD 
																	              
															                  </TD>
																	      </tr>
																
																
																
																<tr>
																	<td  align=center>
																		<table >
																		    <tr>
																	            <td >
																		
																		            <asp:Label id="Label2" runat="server" CssClass=head09>Enter your email</asp:Label>
																		        </td>
																		        <td >
																		
																		            <asp:TextBox id="txtEmail" runat="server" CssClass="INPUTTEXT" MaxLength=40></asp:TextBox>
																		        </td>
																            </tr>
																            
																             <tr>
																	            <td  height=13>
																		
																		            
																		        </td>
																		        <td >
																		
																		             <asp:Label id="lblMess" CssClass=RednormalTextBold runat="server" ></asp:Label>
																	
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
																		
																	&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button id="btnLogin" runat="server" Width=200 Height =30 CssClass="INPUTTEXTbtn" Text="Send Password"></asp:Button>
																	
																	</td>
																</tr>
																
																
																
																<tr>
																	<td align=center height=30>
																		
																	
																	</td>
																</tr>
																
																
																<tr>
																	<td align=center class=BlacknormalText > 
																	
																	Not a member yet, 	
																	<a href = "Register.aspx"> Register </a>
																		
																	</td>
																</tr>
																
																																
																
																<%--<tr>
																	<td align=center class=BlacknormalText> 
																	
																	Forgot your password, 	
																	<a href = "ForgotPassword.aspx"> Click here </a>
																		
																	</td>
																</tr>--%>
																		
																
																		
                                                                                
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
					</form>
				</TD>
			</TR>
			



	</body>
</HTML>

