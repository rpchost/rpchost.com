<%@ Page Language="vb" AutoEventWireup="false" Inherits="rpchost.Renew" CodeFile="Renew.aspx.vb" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Rpchost.com - Renewal section for live members; Renew your account to 
			continue your forex business</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="TITLE" CONTENT="Rpchost.com - Renewal section for live members; Renew your account to continue your forex business">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="Rpchost.com live clients can use this section to renew their accounts and preserve access to the live forex technical and fundamental alerts">
		<META NAME="KEYWORDS" CONTENT="forex, online currency trading, trading forex, trading platform, forex business, fx technical alerts, fx fundamental alerts, forex trading news">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
	</HEAD>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
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
												<asp:Label id="Label1" style="Z-INDEX: 106; LEFT: 0px; TOP: 0px" runat="server" Width="813px"
													CssClass="inputtextbtn" BackColor="#FFCE00" Height="18px">&nbsp;Renew your membership</asp:Label>
												<br>
												<br>
												&nbsp;
												<asp:Label id="Label4" CssClass="BlacknormalText" style="Z-INDEX: 107; LEFT: 26px; TOP: 6px"
													runat="server" Width="648px">
				Dear member, if you are satisfied with our online currency trading signals, you can renew 
                your membership and preserve access to our trading platform and preserve your trading forex business and make it grow day after day using our fx fundamental alerts and fx technical alerts and forex trading news services.
				
				</asp:Label>
												<br>
												<br>
												<br>
												<br>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<asp:Label id="Label2" style="Z-INDEX: 107; LEFT: 160px; TOP: 124px" runat="server" CssClass="BlackTextBold">UserID</asp:Label>
												<asp:TextBox id="txtUsrName" style="Z-INDEX: 101; LEFT: 256px; TOP: 124px" runat="server" Width="176px"
													CssClass="INPUTTEXT"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<asp:Label id="Label3" style="Z-INDEX: 102; LEFT: 160px; TOP: 164px" runat="server" CssClass="BlackTextBold">Pwd</asp:Label>
												<asp:TextBox id="txtPsw" style="Z-INDEX: 103; LEFT: 248px; TOP: 164px" runat="server" Width="176px"
													CssClass="INPUTTEXT" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;&nbsp;
												<asp:Button id="btnLogin" style="Z-INDEX: 104; LEFT: 264px; TOP: 218px" runat="server" CssClass="INPUTTEXTbtn"
													Text="Renew"></asp:Button>
												<asp:Label id="lblMess" style="Z-INDEX: 105; LEFT: 264px; TOP: 196px" runat="server" Width="248px"
													CssClass="RednormalText"></asp:Label>
												<!-- End Content -->
											</td>
										</tr>
										
										
										<tr>
                                                                         <td align=center height=30>
                                                                              
                                                                         </td>
                                                                         </tr>
                                                                         
                                                                         
										<tr>
                                                                         <td align=center>
                                                                                <script type="text/javascript"><!--
                                                                                google_ad_client = "pub-6183127703818516";
                                                                                /* 728x90, created 2/13/08 */
                                                                                google_ad_slot = "1725916647";
                                                                                google_ad_width = 728;
                                                                                google_ad_height = 90;
                                                                                //-->
                                                                                </script>
                                                                                <script type="text/javascript"
                                                                                src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                                                                                </script>
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
