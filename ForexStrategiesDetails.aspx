<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ForexStrategiesDetails.aspx.vb" Inherits="Rpchost.ForexStrategiesDetails" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<HTML>
	<HEAD>
		<title>Forex Strategies | Forex training | Technical Analysis </title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="This section gives traders accurate Forex Strategies and training and analyses the currencies technically and fundamentally">
		<META NAME="KEYWORDS" CONTENT="forex strategies, technical, analysis, training">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
	</HEAD>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="1">
				<TR>
					<TD width="100%" colSpan="3">
						
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
												<uc4:right runat="server" id="headerbutton"></uc4:right>
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
														<td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		<div class=head09 >FOREX STRATEGIES</div>
																	
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
																	<TD valign=top class="BlackSmallText9">
																		
																		<asp:Table ID="tbl" runat="server" Width=100% Height = 300 ></asp:Table>
																		
																	</TD>
																	
																	
																	<td width=5></td>
																	
																	<td valign="top"></td>
																</TR>
																
																	<TR>
																	<td width="2"></td>
																	<TD valign=top class="BlackSmallText9" align=center>
																	
																
																		<br>
																		
																		<asp:Table HorizontalAlign=Center ID="tbl1" runat="server" Width=100% Height="30"  BorderWidth = 1 BorderColor=Black></asp:Table>
																		
																		<br>
																																		
																		
																	</TD>
																	
																	<td width=5></td>
																	
																	<td valign="top"></td>
																</TR>
																
																
															
															</TABLE>
														</td>
													</tr>
												</table>
												<!-- End Content -->
											</td>
										</tr>
									</TABLE>
								</td>
							</tr>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			</TD></TR></TABLE>
		</form>
		</TD></TR> 
<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
	</body>
</HTML>
