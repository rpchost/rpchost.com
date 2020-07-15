<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MT4Indicators.aspx.vb" Inherits="MT4Indicators" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   		<title>Forex Indicators, MT4, Metatrader</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Indicators, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best online forex MT4 Indicatprs - Rpchost.com provides 1000 custom indicators to all forex traders.">
		<META NAME="KEYWORDS" CONTENT="forex, Indicator, MT4, Custom, Metatrader Indicator">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

  </head>
	<body leftMargin=0 topmargin=0 > 
		
					<form id="Form2" method="post" runat="server">
						
									<TABLE borderColor="#000000" height="100%" cellSpacing="0" cellPadding="0" width="100%" align="center"
										border="1">
										<TR>
											<TD width="100%" colSpan="3">
												<!--#include file = "headers/upperheader.htm"-->
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
													<TR><td height=2></td></tr>
													<tr>
														<td align="left" colSpan="4">
															<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
														
													<TR>
														<TD colspan="3" style="WIDTH: 100%"><asp:label id="Label11" runat="server" CssClass="inputtextbtn" Height="18" Width="100%">&nbsp;Forex MT4 Indicators</asp:label></TD>
														
													</TR>
													<TR>
														<TD height="10" class="style1">
														</TD>
														<TD></TD>
														<TD></TD>
													</TR>
														
														
																<tr>
																	<td>
															<!-- Content goes here -->
															
														
																		
																		 <asp:DataGrid runat="server" id="articleList" Font-Name="Verdana"
                                                                        AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#eeeeee"
                                                                        HeaderStyle-BackColor="Navy" HeaderStyle-ForeColor="White"
                                                                        HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True">
                                                                      <Columns>
                                                                        
                                                                        
                                                                        <asp:BoundColumn DataField="Length" HeaderText="File Size"
		                                                                    ItemStyle-HorizontalAlign="Right" 
		                                                                    DataFormatString="{0:#,### bytes}" />
                                                                      </Columns>
                                                                    </asp:DataGrid>  
																		
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

