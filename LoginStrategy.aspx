<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoginStrategy.aspx.vb" Inherits="LoginStrategy" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   		<title>Free Forex Signal | Fundamental Signals | FX signals</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="Rpchost.com live clients can login to the members area and access live forex alerts">
		<META NAME="KEYWORDS" CONTENT="forex, Free Forex Signal, Fundamental, FX signals">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

  </head>
	<body leftMargin=0 topmargin=0 > 
		
					<form id="Form1" method="post" runat="server">
						
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%" align="center"
										border="1">
										<TR>
											<TD width="100%" colSpan="3">
												<%--<uc2:right runat="server" id="Right1"></uc2:right>--%>
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
													<TR><td height=2></td></tr>
													<tr>
														<td align="left" colSpan="4">
															<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
																<tr>
																	<td>
																		<!-- Content goes here -->
																		
																		<asp:Label id="Label1" runat="server" Width="813" CssClass="inputtextbtn" BackColor="#FFCE00"
																				Height="18px">&nbsp;Login</asp:Label>
																			<asp:Label id="Label4" CssClass="BlacknormalText" runat="server" Width="648px">
				
				<br>
				
				Fx traders can provide their UserID and password and access Rpchost <b>Forex strategies</b>, these strategies are exposed for public to share knowledge and forex trading techniques
				for free. To access this free service you must <a href=registercontent.aspx>REGISTER</a> for free and login thru this page.
				<br><br>
				 If you already have a UserID and password in our site, use it to login to the
				forex strategy section.
				
				</asp:Label>
																			<br>
																			<br>
																			<br>
																			<br>
																			<asp:Label id="Label2" runat="server" CssClass="BlackTextBold">UserID</asp:Label>
																			<asp:TextBox id="txtUsrName" runat="server" Width="176px" CssClass="INPUTTEXT"></asp:TextBox>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			<asp:Label id="Label3" runat="server" CssClass="BlackTextBold">Pwd</asp:Label>
																			<asp:TextBox id="txtPsw" runat="server" Width="176px" CssClass="INPUTTEXT" TextMode="Password"></asp:TextBox>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			<asp:Button id="btnLogin" runat="server" CssClass="INPUTTEXTbtn" Width=200 Text="Login to Free Forex Strategies"></asp:Button>
																			<br>
																			<br>
																			<br>
																			<asp:Label id="lblMess" CssClass="RednormalText" runat="server" Width="448px"></asp:Label>
																		<!-- End Content -->
																	</td>
																</tr>
																
																<tr>
																    <td>
																    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                                                    <!-- 728x90, created 11/9/09 -->
                                                                    <ins class="adsbygoogle"
                                                                         style="display:inline-block;width:728px;height:90px"
                                                                         data-ad-client="ca-pub-6183127703818516"
                                                                         data-ad-slot="8323926968"></ins>
                                                                    <script>
                                                                        (adsbygoogle = window.adsbygoogle || []).push({});
                                                                    </script>
																    </td>
																</tr>
															</TABLE>
														</td>
													</tr>
												</table>
											</TD>
										</TR>

</form>
			

	<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->


	</body>
</HTML>

