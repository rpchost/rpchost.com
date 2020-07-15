<%@ Page Language="vb" AutoEventWireup="false" Inherits="rpchost.shareit" CodeFile="shareit.aspx.vb" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
		<title>Online Forex Trading, Automated fx Signals and free forex signals</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best online forex signals - Rpchost.com provides real time free fx trading signals, technical and fundamental alerts, the best online resource for automated forex trading.">
		<META NAME="KEYWORDS" CONTENT="forex, forex signals, forex alerts, Fx analysis, Fx signals, Fx alerts, currency trading signals, forex trading, Trading foreign exchange, accurate forex signals, forex trading strategy, free forex, rpchost, forex automated signals, cheap forex trading, free forex signals, forex trading signals, technical signals, fundamental signals, trade the news, news trading">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
	</head>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE borderColor="#000000" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="1">
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
							
							<TR>
								<td></td>
							</TR>
							
							<TR>
								<td height="20" Class="inputtextbtn">&nbsp; PAYMENT PROCESS</td>
							</TR>
							<tr>
								<td align="left" colSpan="4">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
										<tr>
											<td>
												<!-- Content goes here -->
													<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
													
														<TR>
															<TD>
																<%--<iframe src="https://secure.shareit.com/shareit/checkout.html?PRODUCT[300165730]=1&DELIVERY[300165730]=EML&languageid=1&stylefrom=300165730&backlink=http%3A%2F%2Frpchost.com%2FapprovedOrder.aspx&currencies=all" height="1400" width="800" scrolling="auto" frameborder="no"></iframe>--%>
																<iframe src="https://secure.shareit.com/shareit/checkout.html?productid=300614914&ADD[300614914][WEBSITE]=RPCHOST&COMPANY=RPCHOST&FIRSTNAME=<%=Request.querystring("FName") %>&LASTNAME=<%=Request.querystring("LName") %>&EMAIL=<%=Request.querystring("Email") %>&EMAIL_CONFIRM=<%=Request.querystring("Email")%>&D_COUNTRY_ID=<%=Request.querystring("CountryID") %>&D_CITY=<%=Request.querystring("Country")%>&D_STREET1=<%=Request.querystring("Country")%>&D_CITY=<%=Request.querystring("City")%>&D_POSTALCODE=<%=Request.querystring("Postal")%>&PAYMENTTYPE_ID=CCA&languageid=1&js=-1" height="1400" width="100%" scrolling="no" frameborder="no"></iframe>
															</TD>
														</TR>
													</TABLE>
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
			</TD> </TR> </TABLE>
		</form>
		</TD> </TR> 
		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js"></script>
		<!-- End of eWebCounter Code -->
	</body>
</HTML>
