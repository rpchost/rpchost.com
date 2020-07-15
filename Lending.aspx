<%@ Page Language="VB" EnableEventValidation="false" Theme="theme" AutoEventWireup="false" CodeFile="Lending.aspx.vb" Inherits="Lending" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD id="Head1" runat="server">
	
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
																	           
        																	          LENDING CONTRACTS </TD>
																	              
															                  </TD>
																</tr>
													
							<tr>
								<td align="left" colSpan="4">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
									
									<tr>
										    <td align=center class=head06_small>
										    
										        Lending contract is an amount of bitcoin you send to Rpchost.com who is commited to return you the same amount of bitcoin + profit within 1 to 
                                                2 weeks maximum. Profit vary between 1% to 3%. You can lend 0.0067 to 0.014 bitcoin per contract. You can reserve many contracts.
										
											</td>
											
									</tr>
									
									<tr>
										    <td height=20>
										    
										       
											</td>
											
									</tr>
											
										<tr>
											<td align=center width="100%">
												<!-- Content goes here -->
												<table cellSpacing="0" cellPadding="0" border="0" width="100%">
													
													<tr>
														<td width="50">&nbsp;</td>
														<td align=center>
															<table cellpadding="0" cellspacing="0" border="0" width="600">
																
																<tr>
																	<td width="73" align=left class=head01_9  height=30>User ID</td>
																	<td><asp:textbox id="txtUserID" enabled=false Runat="server" CssClass="INPUTTEXT_12"></asp:textbox></td>
																</tr>
																
																<tr>
																	<td width="73" align=left class=head01_9  height=30>Full Name</td>
																	<td><asp:textbox id="txtFullName" enabled=false Runat="server" CssClass="INPUTTEXT_12"></asp:textbox></td>
																</tr>
																
																<tr>
																	<td width="140" class="head01_9" align=left height=30>Bitcoin amount to lend</td>
																	<td><asp:textbox id="txtBtcLend"  Runat="server" CssClass="INPUTTEXT_12" autopostback=true></asp:textbox>
																	<asp:RequiredFieldValidator id="RequiredFieldValidator1"  runat="server" ErrorMessage="*" ControlToValidate="txtBtcLend"></asp:RequiredFieldValidator>
																	
																	</td>
																</tr>
																<tr>
																	<td class="head01_9" align=left height=30>Minimum profit you get </td>
																	<td><asp:textbox id="txtProfit" enabled=false Runat="server" CssClass="INPUTTEXT_12"></asp:textbox>
																	
																	
																	</td>
																</tr>
																<%--<tr>
																	<td class="head01_9" height=30>Maximum date to return you bitcoin</td>
																	<td><asp:textbox id="txtMaxDate" Runat="server" CssClass="INPUTTEXT_12"></asp:textbox></td>
																</tr>--%>
																
																
																<tr>
																	<td class="head01_9" height=30>Your Bitcoin address</td>
																	<td><asp:TextBox ID="txtAddress" Runat="server" width=320 CssClass="INPUTTEXT" MaxLength=50 ></asp:TextBox>
																	<asp:RequiredFieldValidator id="RequiredFieldValidator2"  runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
																	
																	</td>
																	
																	
																</tr>
																
																<tr>
																	<td class="head01_9" height=30>Send bitcoin to Rpchost wallet</td>
																	<td><asp:Label ID="txtRpcAddress" Runat="server" CssClass="INPUTTEXT" width=320 MaxLength=100 >3KkqpDGGNxQrh2FBKcLucncbxRdXcWhRH6</asp:Label></td>
																</tr>
																
																<tr>
																	<td colspan="2" height="20"></td>
																</tr>
																<tr>
																	<td  align="center"><asp:Button ID="btnSubmit" Runat="server" Text="Reserve Contract" width=200 Height=35 CssClass="inputtextbtn"></asp:Button>
																	
																	</td>
																		<td  align="left"><asp:Label ID=lblMess runat=server CssClass=RednormalTextBold></asp:Label>
																	
																	</td>
																	
																</tr>
																
																<tr>
																	<td colspan="2" height="40" class=BlueSmallText>
																	<a href=BuyBitcoins.aspx title="Buy Bitcoin"><b>Need bitcoin? Buy bitcoin here</b></a>
																	</td>
																</tr>
																
																
															
															</table>
														</td>
													</tr>
													
													<tr>
																	<td colspan="3" height=30 valign=bottom>
																	
																	    <asp:GridView  Width=100% ID="grdContract" SkinID=grdTrans runat="server" AutoGenerateColumns="False"  emptydatatext="You have no contracts" HeaderStyle-BackColor=Silver  RowStyle-BackColor="#F8F7F7"
                                                                                                                  DataSourceID="AccessDataSource1" >
                                                                                                                 <Columns>
                                                                                                                     
                                                                                                                    
                                                                                                                          <asp:TemplateField HeaderText="Contract ID" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                           <asp:BoundField DataField="StartDate" ItemStyle-Width=350 HeaderText="Start Date" ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="StartDate" ItemStyle-CssClass=BlacknormalText/>
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="EndDate" ItemStyle-Width=350 HeaderText="End Date" ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="EndDate" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                         <asp:BoundField DataField="LendingValue" ItemStyle-Width=700 HeaderText="Lending Amount"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="LendingValue" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="Curr" ItemStyle-Width=700 HeaderText="CryptoCurrency"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="Curr" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                         <asp:BoundField DataField="MinimumReturningVal" ItemStyle-Width=700 HeaderText="Minimum Returning Amount"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="MinimumReturningVal" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="WalletAddress" ItemStyle-Width=700 HeaderText="Wallet Address"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="WalletAddress" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Status" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                          <asp:TemplateField>
                                                                                                                        <ItemTemplate>
                                                                                                                        <asp:Button ID="Button1" runat="server" Text='Cancel'
                                                                                                                          CommandArgument="Button1" OnClick="Button1_Click" causesvalidation=false height=20 cssClass=INPUTBUTTON_10 />
                                                                                                                         
                                                                                                                           </ItemTemplate> 
                                                                                                                        </asp:TemplateField>
                                                                                                                        
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
																		
																	</td>
																</tr>
																
																<tr>
																<td height=20>
																
																  
																
																</td>
																
																<tr>
																<td width=100% colspan=2 class=RednormalText>
																
                                                                    <br />
                                                                   <b> Please read carefully:</b><br /><br />
																    Status Pending  :  Rpchost is waiting bitcoin to arrive to its wallet<br>
																    Status Process  :  Bitcoin arrived and contract is in process, and profit is accumulating<br>
																    Status Finished :  End of contract is reached and bitcoin + profit is sent back to your wallet<br />
                                                                    <br />
                                                                    Start Date : Date when Rpchost received the bitcoin<br />
                                                                    End Date&nbsp; : Date when you will get your bitcoin + profit. It usually takes 
                                                                    1 week before the contract reach its target<br /><br />
                                                                    Your profit may vary between 1% and 3% depending on network difficulties and 
                                                                    miner fees, most of times your contract will hit 3% profit
                                                                    <br />
                                                                    Wallet address is your bitcoin address where we will return bitcoin + profit to 
                                                                    it. Wrong address is not refundable<br>
																    
																
																</td>
																</tr>


                                                     <tr>
                                                                        
                                                                         <td align="center" width=100% colspan=2>
                                                                    
                                                                             <div align="center">
                                                                             <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
                                                                                 </div>

                                                                            </td>

                                                                    </tr>


                                                       <tr>
                                                                        
                                                                         <td align="center" width=100% colspan=2>
                                                                    
                                                                             <div align="center">
                                                                            <script type="text/javascript">
	atOptions = {
		'key' : '10b7f767e2a3a6373ac4b54d0ba8bef4',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
	document.write('<scr' + 'ipt type="text/javascript" src="http' + (location.protocol === 'https:' ? 's' : '') + '://www.hiprofitnetworks.com/10b7f767e2a3a6373ac4b54d0ba8bef4/invoke.js"></scr' + 'ipt>');
</script>
                                                                                 </div>

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

		</form>
		
		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
	</body>
</HTML>
