<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FXAS_Automatic_Trading_System_Demo.aspx.vb" Inherits="rpchost.FXAS_Automatic_Trading_System_Demo" %>

<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   		<title>Automatic Forex Trading System, FX Auto Trader Software </title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Automatic Software, Trading Robot">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best online forex trading robot, executes signals automatically in FXCM.">
		<META NAME="KEYWORDS" CONTENT="forex, trading, Automatic, Auto, robot, software">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

  </head>
	<body leftMargin="0" topmargin="0">
     
  <form id="Form2" method="post" runat="server">
			<TABLE borderColor="#000000" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="1">
				<TR>
					<TD width="100%" colSpan="3">
						<uc2:right runat="server" id="Right1"></uc2:right>
					</TD>
				</TR>
				<TR>
					<TD colSpan="3"></TD>
				</TR>
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
												<!--#include file = "headers/headerbutton.htm"-->
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
							<TR>
								<td height="2"></td>
							</TR>
							<tr>
								<td align="left" colSpan="4">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
										<tr>
											<td>
												<!-- Content goes here -->
												<table width="100%" cellspacing="0" cellpadding="0" border="0">
													<tr>
														<td class="INPUTBUTTON" colspan=3>
															&nbsp;<H8>FXAS Demonstration Videos</H8>
														</td>
													</tr>
													<tr>
														<td height="10"></td>
													</tr>
													<tr>
														<td class="BlackSmallText9" valign="top">
															<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
															
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackTextBold" height=50>
																		Click the videos below explaining how FXAS and JoeChalhoub_FxCrusher indicator work together :
																	</td>
																</TR>
																
																<tr>
													        	    <td height="10"></td>
													        	    <td></td>
													            </tr>
													
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9">
																	
                                                                        <asp:HyperLink ID="HyperLink1" CssClass="BlueText" runat="server" ToolTip="FXAS Automatic trading system" NavigateUrl="Auto_Trading_Video1.aspx">1 - Video showing how to install FXAS software and JoeChalhoub_FxCrusher in your computer.
                                                                            </asp:HyperLink>
																	</td>
																</TR>
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9"  height=20   
																		
																	</td>
																</TR>
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9">
																	
                                                                        <asp:HyperLink ID="HyperLink2" CssClass="BlueText" runat="server" ToolTip="FXAS Auto trader robot" NavigateUrl="Auto_Trading_Video2.aspx">2 - Video showing how FXAS works and how to create an FXCM UK live account and what are the benefits.
                                                                            </asp:HyperLink>
																	</td>
																</TR>
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9"  height=70>
																		
																	</td>
																</TR>
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9" >
																		&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDesc" runat="server" CssClass="BlackTextBold" Text=""></asp:Label>
																	</td>
																</TR>
																
																
																
														<TR>
																	<td width="2"></td>
																	<TD valign=top>
																		<hr />
																	</td>
																</TR>
																
																
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top height=50>
																		
																	</td>
																</TR>
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top height=10 class="BlackTextBold">
																		For any question or feedback please send me an email at :
                                                                        <a href="mailto:webmaster@rpchost.com">webmaster@rpchost.com</a>
																	</td>
																</TR>
																															
																
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9" >
																		
                                                                        
																		
																	</td>
																</TR>
																
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top height=20>
																		
																		
																	    &nbsp;</td>
																</TR>
																															
																
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9" >
																		
                                                                        <br />
																		
																	</td>
																</TR>
																
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top height=30>
																		
																		
																	</td>
																</TR>
																															
																
																
																<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9" >
																		
                                                                        <asp:Label ID="lblText" runat="server"></asp:Label>
																		
																	</td>
																</TR>
							
																
																
															</TABLE>
														</td>
														
														<TD width=5 valign=top align=right>
			<script type="text/javascript"><!--
                                                                                            google_ad_client = "pub-6183127703818516";
                                                                                            //120x600, created 12/1/07
                                                                                            google_ad_slot = "6564101641";
                                                                                            google_ad_width = 160;
                                                                                            google_ad_height = 600;
                                                                                            //--></script>
                                                                                            <script type="text/javascript"
                                                                                            src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                                                                                        </script>
		</TD>
													</tr>
												</table>
													<!-- End Content -->
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
			

		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->


	</body>
</HTML>