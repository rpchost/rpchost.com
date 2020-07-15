<%@ Page  Language="vb" AutoEventWireup="false" Inherits="contact" CodeFile="contact.aspx.vb" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
	
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
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
	</HEAD>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="0">
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
											<TD align=left bgcolor="#3366cc">
												<uc4:right runat="server" id="headerbutton"></uc4:right>
											</TD>
										</TR>
										
										<TR><td height=1></td></tr>
										
										<tr>
														
														
													   <td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		 <asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																	
																	</td>
																	
																	
													</tr>
													
									</TABLE>
								</td>
							</tr>
							<tr>
																	<td class="head05" height=120 width="100%" colspan=3 align=center>
																	           
        																	          CONTACT US </TD>
																	              
															                  </TD>
																</tr>
													
							<tr>
								<td align="left" colSpan="4">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
										<tr>
											<td align=center>
												<!-- Content goes here -->
												<table cellSpacing="0" cellPadding="0" border="0" width="100%">
													
													<tr>
														<td width="50">&nbsp;</td>
														<td align=center>
															<table cellpadding="0" cellspacing="0" border="0" width="100%">
																
																<tr>
																	<td width="73" class="head10" >User ID</td>
																	<td><asp:textbox id="txtUserID" Enabled=false width=240 CssClass="inputtext" Runat="server"></asp:textbox></td>
																</tr>
																
																<tr>
																	<td width="140" class="head10" >First name</td>
																	<td><asp:textbox id="txtFirst" Enabled=false width=240 CssClass="inputtext" Runat="server" MaxLength=20></asp:textbox></td>
																</tr>
																<tr>
																	<td class="head10" >Last name</td>
																	<td><asp:textbox id="txtLast" Enabled=false width=240 CssClass="inputtext" Runat="server" MaxLength=20></asp:textbox></td>
																</tr>
																<tr>
																	<td class="head10" >Email</td>
																	<td><asp:textbox id="txtEmail" width=240 Enabled=false CssClass="inputtext" Runat="server" MaxLength=60></asp:textbox></td>
																</tr>
																
																
																<tr>
																	<td class="head10" >Comments / Feedback / <br>Questions</td>
																	<td><asp:TextBox ID="txtComment" Runat="server" Rows="5" Columns="70" CssClass="INPUTTEXT_12" TextMode="MultiLine" MaxLength=200 ></asp:TextBox></td>
																</tr>
																<tr>
																	<td colspan="2" height="20"></td>
																</tr>
																<tr>
																	<td  align="center"><asp:Button ID="btnSubmit" Runat="server" Text="Submit" Width=100 Height=35 CssClass="inputtextbtn"></asp:Button>
																	
																	</td>
																		<td  align="left"><asp:Label ID=lblMess runat=server CssClass=RednormalTextBold></asp:Label>
																	
																	</td>
																	
																</tr>
																
																<tr>
																	<td colspan="2" height="40"></td>
																</tr>
																
																<tr>
																	<td colspan="3" height=30 valign=bottom>
																	
																	    <asp:GridView ID="grdContact" runat="server" AutoGenerateColumns="False"   HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" HeaderStyle-CssClass="head01" RowStyle-CssClass=head01_9
                                                                                                                  DataSourceID="AccessDataSource1" >
                                                                                                                 <Columns>
                                                                                                                     
                                                                                                                    
                                                                                                                          <asp:BoundField DataField="FirstName" HeaderText="User"  ItemStyle-Width=130 ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="FirstName" />
                                                                                                                         
                                                                                                                          
                                                                                                                           <asp:BoundField DataField="DateSent" ItemStyle-Width=140 HeaderText="DateSent" ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="DateSent" ItemStyle-CssClass=BlacknormalText/>
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="FeedBack" ItemStyle-Width=700 HeaderText="Comments / FeedBack / Questions"  ItemStyle-HorizontalAlign=left
                                                                                                                         SortExpression="FeedBack" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                        
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
																		
																	</td>
																</tr>
																
																<tr>
																	<td colspan="2" class=head01_9 align=center >
																	        
																	       
																	        
																	        RpcHost
																	        <br /> <br />
																	        Hong Kong (Address : 172-180 Tai Lin Pai Road. Fax : 852-2615-1957 , Business Registration Number : 89760433)
																	                                                                      
                                                                        <br /> <br />
                                                                        General Questions : <a href="mailto:webmaster@rpchost.com">webamster@rpchost.com</a><br />
                                                                        Sales Questions : <a href="mailto:lanamonyuk@gmail.com">lanamonyuk@gmail.com</a><br />
                                                                        Payments/Transactions Questions : <a href="mailto:lanamonyuk@gmail.com">rpchost.payments@gmail.com</a><br />
                                                                         
                                                                       <%-- <br />
                                                                        <br />
Rim al Hadi [UAE]&nbsp;&nbsp;
                                                                        <br />
                                                                        Email : <a href="mailto:Rim.Hadi@rpchost.com">Rim.Hadi@rpchost.com</a><br />
                                                                        <br />
                                                                        Joseph Chalhoub [MIDDLE EAST]&nbsp;
                                                                        <br />
                                                                        Email : <a href="mailto:Rim.Hadi@rpchost.com">rpchost@gmail.com</a><br />
                                                                        <br />
                                                                        Mohamad Labib [MIDDLE EAST]<br />
                                                                        Email : <a href="mailto:Rim.Hadi@rpchost.com">Mohamad.Labib@rpchost.com</a><br />
                                                                        <br />
                                                                        Lana Monyu [Cyprus and Greece]<br />
                                                                        Email : <a href="mailto:Rim.Hadi@rpchost.com">lanamonyuk@gmail.com</a><br />
                                                                        <br />
                                                                        Hary Bolton [Detroit]<br />
                                                                        Email : <a href="mailto:Rim.Hadi@rpchost.com">Hary.Bolton@rpchost.com</a><br />
                                                                        <br />
                                                                        Rimsky Yuen [Hong Kong]<br />
                                                                        Email : <a href="mailto:Rimsky.Yuen@rpchost.com">Rimsky.Yuen@rpchost.com</a><br />
--%>
                                                                    
																	
																	</td>
																</tr>
																
															
																
															</table>
														</td>
													</tr>
												</table>
												<asp:RequiredFieldValidator id="ReqFirst" style="Z-INDEX: 101; LEFT: 16px; POSITION: absolute; TOP: 336px" runat="server"
													ErrorMessage="You must enter your first name" ForeColor="White" ControlToValidate="txtFirst">*</asp:RequiredFieldValidator>
												<asp:RequiredFieldValidator id="ReqLast" style="Z-INDEX: 102; LEFT: 64px; POSITION: absolute; TOP: 336px" runat="server"
													ErrorMessage="You must enter your last name" ForeColor="White" ControlToValidate="txtLast">*</asp:RequiredFieldValidator>
												<asp:RequiredFieldValidator id="ReqEmail" style="Z-INDEX: 103; LEFT: 24px; POSITION: absolute; TOP: 360px" runat="server"
													ErrorMessage="You must enter your email address" ForeColor="White" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator id="RegEmail" style="Z-INDEX: 104; LEFT: 64px; POSITION: absolute; TOP: 352px" runat="server"
													ErrorMessage=" you must enter a valid email address" ForeColor="White" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
												
												fee<!-- End Content --></td>
											
										</tr>
									</TABLE>
								</td>
								
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
					</TD>
				</TR>
			</TABLE>

		</form>
		
		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
	</body>
</HTML>
