<%@ Page Language="VB" Theme="theme" EnableViewState="false" AutoEventWireup="false" CodeFile="Transactions.aspx.vb" Inherits="Transactions" %>


<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head id="Head1" runat="server">
   
   <link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
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
<div id="Div1" runat="server">
<script type = "text/javascript">

        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    
    <script>

        function Redisplay() {
            document.getElementById("loading").src = "picture/loading2.gif";
        }
   	
   	</script>
</div>
</head>
	<body leftMargin=0 topmargin=0 > 
								<form id="Form1" runat=server>
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
										border="0">
										<TR>
											<TD width="100%" colSpan="3">
											
												
											</TD>
										</TR>
										
										<TR>
											<TD colSpan="3"></TD>
										</TR>
										
										<TR>
											<TD vAlign="top" height="100%" width=100%>
												<table cellSpacing="0" cellPadding="0" height="100%" width=100%>
													<tr>
														<td >
															<uc1:right runat="server" id="RightHeader"></uc1:right>
														</td>
													</tr>
												</table>
											</TD>
											<TD vAlign="top" width="100%" height="100%">
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<tr>
														<td vAlign="top" align=left>
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
															
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		
																		<asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																	
																	</td>
													</TR>
													
													<TR>
														<td Height="115" valign="top" >
															<TABLE width="100%" height="130" class="BlackSmallText10" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																<TR>
																
																<td width=6></td>
																
																	<TD valign="top" >
																	
																	 <asp:Panel id="pnlContents" runat = "server">
																	
																	  <table width="100%">
																	
																	   <tr>
                                                                        <td>       
                                                                                     <table border=0 width=100%>
                                                                                     
                                                                                      <tr>
																	          <td class="head05" height=100 align=center>
																	           
        																	         TRANSACTIONS HISTORY </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	      
																	      <tr>
																	          <td align=center class=head01_9 height=40>
																	           
        																	        <u> Deposits operations </u> </TD>
																	              
															                  </TD>
																	      </tr>
																	      
                                                                                       
                                                                                       
                                                                                       <tr>
                                                                                       <td align=center>
                                                                                       
                                                                                                <asp:GridView ID="grdHistory" SkinID=grdTrans  runat="server" emptydatatext="You have no Deposits in your list" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7"  AutoGenerateColumns="False"  DataSourceID="AccessDataSource1" Width=800 >
                                                                                                                 <Columns>
                                                                                                                 
                                                                                                               
                                                                                                               
                                                                                                                <asp:TemplateField HeaderText="Deposit ID"  ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" Width=40 runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
            
                                                                                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="AmountUSD"  runat="server" Text='<%# Bind("AmountUSD") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                           <asp:BoundField DataField="Currency" HeaderText="Currency"
                                                                                                                          SortExpression="Currency" ItemStyle-HorizontalAlign=Center HeaderStyle-Width=10 ItemStyle-Width=10/>
                                                                                                                          
                                                                                                                     <asp:BoundField DataField="AmountBTC"  HeaderText="Amount BTC" ItemStyle-HorizontalAlign=Center SortExpression="Amount BTC" />
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="BUY_Price" ItemStyle-HorizontalAlign=Center visible=false HeaderText="Ask Price" 
                                                                                                                         SortExpression="BUY_Price" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="SELL_Price" ItemStyle-HorizontalAlign=Center visible=false HeaderText="Bid Price" 
                                                                                                                         SortExpression="SELL_Price" />
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="dtDatePayment" ItemStyle-HorizontalAlign=Center ItemStyle-Width=110 HeaderText="Deposit Date" 
                                                                                                                         SortExpression="dtDatePayment" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="BtcAddress" visible=false ItemStyle-HorizontalAlign=Center HeaderText="BTC Address" 
                                                                                                                         SortExpression="BtcAddress" />
                                                                                                                         
                                                                                                                         
                                                                                                                          
                                                                                                                         <asp:TemplateField HeaderText="Deposit Method" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="PaymentMethod" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="WithDrawMethod" visible=false ItemStyle-HorizontalAlign=Center HeaderStyle-Width=90 HeaderText="Withdraw Method" 
                                                                                                                         SortExpression="WithDrawMethod" />
                                                                                                                         
                                                                                                                         
                                                                                                                             <asp:TemplateField HeaderText="Order type" visible=false ItemStyle-HorizontalAlign=Center HeaderStyle-Width=10 ItemStyle-VerticalAlign=Middle>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Ordertype" runat="server" Text='<%# Bind("Ordertype") %>'></asp:Label>
                                                                                                                                </ItemTemplate> 
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                            
                                                                                                                             <asp:TemplateField HeaderText="PassCode" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                     <asp:TextBox ID="ClientPassCode" TextMode="password"  width=60 CssClass=bluetext MaxLength=8  runat="server" Text='<%# Bind("ClientPassCode") %>'></asp:TextBox>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                             <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Status" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                          <%--  <asp:TemplateField HeaderText="Trace payment"  ItemStyle-HorizontalAlign=Center HeaderStyle-Width=10 >
                                                                                                                                <ItemTemplate>
                                                                                                                                <asp:HyperLink runat=server ID=lnkTrace  Text='Trace' Target=_blank NavigateUrl='<%# Bind("BlockChain") %>' ></asp:HyperLink>
                                                                                                                                   
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>--%>
                                                                                                                            
                                                                                                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                <asp:Button ID="btnConfirm" runat="server" Text="Confirm WU paid"
                                                                                                                                      CommandArgument="btnConfirm" OnClick="btnConfirm_Click"  cssClass=INPUTBUTTON />   
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign=Center ItemStyle-Width=10>
                                                                                                                                <ItemTemplate>
                                                                                                                                <asp:Button ID="btnConfirmOmt" runat="server" Text="OMTN"
                                                                                                                                      CommandArgument="btnConfirmOmt" OnClick="btnConfirmOmt_Click"  cssClass=INPUTBUTTON />   
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                         
                                                                                                                           <asp:TemplateField ItemStyle-HorizontalAlign=Center ItemStyle-Width=10>
                                                                                                                             <ItemTemplate>
                                                                                                                                    <asp:Button ID="btnPass" runat="server" Text="Validate PassCode"
                                                                                                                                      CommandArgument="btnPass" OnClick="btnPass_Click" onclientclick="Redisplay()" height=20 cssClass=INPUTBUTTON_10 />
                                                                                                                         
                                                                                                                           </ItemTemplate> 
                                                                                                                        </asp:TemplateField>
                                                                                                                        
                                                                                                                       
                                                                                                                        
                                                                                                                         
                                                                                                                          <asp:TemplateField ItemStyle-Height=22  ItemStyle-Width=10>
                                                                                                                        <ItemTemplate>
                                                                                                                        <asp:Button ID="Button1" runat="server" Text='Cancel'
                                                                                                                          CommandArgument="Button1" OnClick="Button1_Click"  cssClass=INPUTBUTTON_10 />
                                                                                                                         
                                                                                                                           </ItemTemplate> 
                                                                                                                        </asp:TemplateField>
                                                                                                                           
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server"  
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
                                                                                       
                                                                                       </td>
                                                                                       </tr>
                                                                                      
																	                 </table>
																	                 
																	               
                                                                                    
                                                                        </TD>
                                                                        </tr>
                                                                        
                                                                       <%--  <tr>
																	          <td height=10>
																	           <br>
        																	       <span class=RednormalTextBold>In Case you make a payment with your Credit Card, 
                                                                                   we will send a Passcode to your phone for verification.<br />
                                                                                   Passcode is an OTP(One Time Password) sent by our payment gateway company to 
                                                                                   your phone. <br> Once you get the Passcode, write it and click [Validate Passcode]. <br>Expiry time is 5 minutes. If it is expired click [ReIssue Passcode] and a new Passcode is sent to your phone. </span>
																	              
															                  </TD>
																	      </tr>--%>
																	      
                                                                        
                                                                          <tr>
																	          <td height=60 align=center>
																	           
        																	       <img  id="loading">  
																	              
															                  </TD>
																	      </tr>
                                                                        
                                                                     <%--   
                                                                          <tr>
																	          <td align=Left class=head01_9 height=40>
																	           
        																	         <u>Your Offers operations</u> <span class=BlackSmallText>(The offer will be returned to public in 5 minutes if not paid)</span>
																	              
															                  </TD>
																	      </tr>
																	      
																	       <tr>
                                                                                       <td>
                                                                                       
                                                                                                <asp:GridView ID="grdOffers" runat="server" width=100% DataKeyNames="ID" HeaderStyle-BackColor=Silver emptydatatext="You have no offers in your list" AutoGenerateColumns="False"  CssClass="head01_9" DataSourceID="AccessDataSource2"  >
                                                                                                                 <Columns>
                                                                                                                     <asp:TemplateField HeaderText="ID" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" runat="server"  Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                         
                                                                                                                       <asp:TemplateField HeaderText="Amount" ItemStyle-Width=30 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Label ID="Amount" runat="server"  Text='<%# Bind("Amount") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>  
                                                                                                                       
                                                                                                                          <asp:TemplateField HeaderText="Crypto Type" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Label ID="CryptoType" runat="server"  Text='<%# Bind("CryptoType") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>  
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="Price" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Label ID="SellPrice" runat="server"  Text='<%# Bind("SellPrice") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                       
                                                                                                                           
                                                                                                                            <asp:TemplateField HeaderText="Currency" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Label ID="SellCurrency" runat="server"  Text='<%# Bind("SellCurrency") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                                                                                                                                                
                                                                                                                         
                                                                                                                             <asp:TemplateField HeaderText="date of posting" ItemStyle-Width=130 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Label ID="DateOffer" runat="server"  Text='<%# Bind("DateOffer") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                           <asp:TemplateField HeaderText="Wallet" ItemStyle-Width=280 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Label ID="Wallet" runat="server"  Text='<%# Bind("Wallet") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="Status" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Status" runat="server"  Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                        
                                                                                                                        
                                                                                                                        
                                                                                                                            
                                                                                                                         
                                                                                                                          <asp:TemplateField  ItemStyle-HorizontalAlign=Center ItemStyle-Width=110>
                                                                                                                        <ItemTemplate>
                                                                                                                       <asp:Button ID="btnOffers" runat="server" Text='Cancel'
                                                                                                                          CommandArgument="btnOffers" OnClick="btnOffers_Click" cssClass=INPUTBUTTON />    
                                                                                                                          
                                                                                                                           <asp:Button ID="btnBuy" runat="server" Text='Buy'
                                                                                                                          CommandArgument="btnBuy" OnClick="btnBuy_Click" cssClass=INPUTBUTTON />    
                                                                                                                         
                                                                                                                           </ItemTemplate> 
                                                                                                                        </asp:TemplateField>
                                                                                                                        
                                                                                                                                                                                  
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource2" runat="server"  
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
                                                                                       
                                                                                       </td>
                                                                                       </tr>
                                                                        
                                                                        --%>
                                                                          
																	     </table>
																		  </asp:Panel>
																		
																	</TD>
																	
																</TR>
																
																
																                        <tr>
                                                                                        <td height=50></TD>
                                                                                         <td>
                                                                                         
                                                                                         </TD>
                                                                                       </tr>
                                                                                       
                                                                                       
                                                                                      
                                                                                       
																
																                        <tr>
                                                                                        <td></TD>
                                                                                         <td>
                                                                                         <asp:Button ID="btnPrint" runat="server" Width = 200 Height=30 Text="Print Report" CssClass=INPUTTEXTbtn OnClientClick = "return PrintPanel();" />
                                                                                         </TD>
                                                                                       </tr>
                                                                                       
															</TABLE>
														</td>
													</TR>
												</TABLE>
											</td>
										</tr>
										
										
													
													
												</TABLE>
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
	
	
	
</TD>
</TR>




</form>
	</body>
</HTML>
