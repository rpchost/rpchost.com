<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="Withdraw.aspx.vb" Inherits="Withdraw" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>



<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head id="Head1" runat="server">
   
   		<title>Cryptocurrency trading | Online forex trading | free forex signals</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best online forex signals - Rpchost.com provides real time free fx trading signals, technical and fundamental alerts, the best online resource for automated forex trading.">
		<META NAME="KEYWORDS" CONTENT="forex, forex trading, foreign exchange, forex signals, online forex trading, currency, free, technical analysis, forex trading signals">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<script language=javascript>

    function DefaultValue() {


        var txtbtn = window.document.getElementById('lblBtcUsdAsk');
        txtbtn.value = "TEST";
        
    }

</script>

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
														<td height="15">
														</td>
													</TR>
													<TR>
														<td Height="115" valign="top" >
															<TABLE width="100%" height="130" class="BlackSmallText10" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																<TR>
																
																<td width=6></td>
																
																	<TD valign="top" >
																	
																	  <table width="100%">
																	  
																	  
																	   <tr>
																	          <td class="head05" height=80 width="100%" align=center>
																	           
        																	          WITHDRAW
																	              
															                  </TD>
																	      </tr>
																	      
																	
                                                                          <tr>
																	          <td height=40 class=RedTextBold>
																	          
																	         
															                  </TD>
																	      </tr>
																	      
            													       <tr>
																	          <td>
																	          
																	                <table>
																	                    <tr>
																	                        <td class=head10>
																	                            BTC Balance
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                           <asp:TextBox runat=server ID=txtBtcBalance Width=150 Enabled=false CssClass=INPUTTEXT ></asp:TextBox>
																	                        </td> 
																	                        
																	                          <td align=center>
																	                          <%-- <asp:Button runat=server ID=btnTransferBTC  Width=200 Height=25 OnClientClick = "return confirm('Are you sure you want to transfer all bitcoins to MAIN BTC balance ?')" CssClass=INPUTBUTTON Text="Transfer to BTC MAIN Balance"></asp:button>--%>
																	                        </td> 
																	                    </tr>
																	                    
																	                    <tr>
																	                        <td class=head10>
																	                            BTC to Withdraw
																	                        </td> 
																	                         <td width=10>
																	                            
																	                        </td> 
																	                        <td>
																	                              <asp:TextBox ID="txtBtcAmountToExchange"  OnTextChanged="txtBtcAmountToExchange_TextChanged" ClientIDMode="Static" Width=150 runat="server"></asp:TextBox>
                                                                                              
                                                                                                
																	                        </td> 
																	                        
																	                         <td width=10>
																	                            <asp:Button runat=server ID=btnExchangeToUSD  Width=200 Height=25 CssClass=INPUTBUTTON Text="Withdraw BTC"></asp:button>
																	                        </td> 
																	                        <td>
																	                           
																	                        </td> 
																	                        
																	                        
																	                        <td>
																	                           
																	                             <asp:Label runat=server ID="lblBtcMess" CssClass=RednormalText></asp:Label>
																	                             
																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                    
																	                     <tr>
																	                        <td >
																	                            
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td height=20>
																	                            
                                                                                               <%-- <anthem:Label ID="lblBtcToUsdValue" AutoUpdateAfterCallBack=true CssClass=RednormalTextBold runat="server"></anthem:Label>--%>
                                                                                                
                                                                                                     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                                                    </asp:ScriptManager>
                                                                                                    
                                                                                                
                                                                                                    
                                                                                                    
                                                                                            <asp:UpdatePanel runat="server" id="UpdatePanel" ChildrenAsTriggers="false" updatemode="Conditional">
                                                                                                <ContentTemplate>
                                                                                                
                                                                                                 
                                                                                                    <asp:Label ID="lblBtcToUsdValue" CssClass=RednormalTextBold runat="server"/>
                                                                                                      
                                                                                                
                                                                                                    
                                                                                                </ContentTemplate>

                                                                                                <Triggers>
                                                                                                    <asp:AsyncPostBackTrigger controlid="txtBtcAmountToExchange" EventName="TextChanged" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>

																	                            
																	                            </td> 
																	                        
																	                         <td width=10 align=center>
																	                           
																	                             <%--<asp:Label ID="lblBtcUsdAsk" runat="server" CssClass="RednormalText" 
                                                                                                     Enabled="false"></asp:Label>--%>
																	                           
																	                        </td> 
																	                        <td>
																	                            
																	                        </td> 
																	                        
																	                        <td>
																	                           
																	                             
																	                             
																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                </table>
																	          
															                  </TD>
															             
															              
																	      </tr>
                                                                       
                                                                        <tr>
																	          <td height=10>
															                      </TD>
																	      </tr>
                                                                       
                                                                         <tr>
																	          <td>
																	          
																	                <table>
																	                    <tr>
																	                        <td class=head10>
																	                            EUR Balance
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                           <asp:TextBox runat=server ID=txtUsdBalance Width=150 Enabled=false  CssClass=INPUTTEXT ></asp:TextBox>
																	                        </td> 
																	                         <td align=center>
																	                            <%-- <asp:Button ID="btnTransferUSD" runat="server" CssClass="INPUTBUTTON" 
                                                                                                     Height="25" Text="Transfer to USD MAIN Balance" OnClientClick = "return confirm('Are you sure you want to transfer all USDs to MAIN USD balance ?')" Width="200" />--%>
                                                                                            </td> 
																	                    </tr>
																	                    
																	                    <tr>
																	                        <td class=head10>
																	                            EUR to Withdraw
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                             <asp:TextBox runat=server ID=txtUsdAmountToExchange Width=150 CssClass=INPUTTEXT ></asp:TextBox>
																	                        </td> 
																	                        
																	                         <td width=10>
																	                           <asp:Button runat=server ID=btnExchangeUSDtoBTC  Width=200 Height=25 CssClass=INPUTBUTTON Text="Withdraw to Bank"></asp:button>
																	                        </td> 
																	                        <td>
																	                            
																	                        </td> 
																	                         <td>
																	                            <asp:Label runat=server ID="lblUsdMess" CssClass=RednormalText></asp:Label>
																	                        </td> 
																	                          
																	                             
																	                    </tr>
																	                    
																	                    
																	                     <tr>
																	                        <td >
																	                            
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                            
																	                               
                                                                                                    
                                                                                            <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
                                                                                                <ContentTemplate>
                                                                                                    <asp:Label ID="lblUsdToBtcValue" CssClass=RednormalTextBold runat="server"/>
                                                                                                </ContentTemplate>

                                                                                                <Triggers>
                                                                                                    <asp:AsyncPostBackTrigger controlid="txtUsdAmountToExchange" EventName="TextChanged" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>
                                                                                            
																	                            </td> 
																	                        
																	                         <td width=10 align=center>
																	                           
																	                          <%-- <asp:Label runat=server ID=lblBtcUsdBid Enabled=false CssClass=RednormalText ></asp:Label>
																	                           --%>
																	                        </td> 
																	                        <td>
																	                            
																	                        </td> 
																	                        
																	                        <td>
																	                           
																	                             
																	                             
																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                    
																	                </table>
																	          
															                  </TD>
															             
															              
																	      </tr>
																	      
                                                                        
																	     </table>
																		
																		
																	</TD>
																	
																	
														
																</TR>
															</TABLE>
														</td>
													</TR>
												</TABLE>
											</td>
										</tr>
										
										<tr>
										    <td height=40>
										        
										    </td>
										     
										</tr>
										
										<tr>
										    <td height=40 class=RednormalText align=center>
										        We can withdraw your money to your Bank account or by Cash pickup (to majority of countries) or to your Revolut account or to your TransferWise account or by WesterUnion. <a href='Contact.aspx' target='new'>Contact us</a>
                                                <br />
                                                Money is wathdrawn to accounts with same holder name registered in Rpchost.com</td>
										     
										</tr>
										
										<tr>
										    <td align=center>
										        
										        
										        
										        
              <asp:GridView ID="grdWithdrawRequests" runat="server" SkinID=grdTrans AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=800>
                         <Columns>
                                 
                            <asp:TemplateField HeaderText="Withdraw ID" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID0" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                           
                                 
                              <asp:TemplateField HeaderText="BTC Withdraw" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="WithdrawBtc" runat="server" Text='<%# Bind("WithdrawBtc") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="WithdrawBtc0" runat="server" Text='<%# Bind("WithdrawBtc") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="EUR Withdraw" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="WithdrawUsd" runat="server" Text='<%# Bind("WithdrawUsd") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="WithdrawUsd0" runat="server" Text='<%# Bind("WithdrawUsd") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                  
                            <asp:TemplateField HeaderText="Date Request" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="DateRequest" runat="server" Text='<%# Bind("DateRequest") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateRequest0" runat="server" Text='<%# Bind("DateRequest") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                 
                                   <asp:TemplateField HeaderText="Executed" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="test" runat="server" text='<%# Bind("test") %>'></asp:label>
                                </ItemTemplate>
                               
                            </asp:TemplateField>
                               
                              
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [WithdrawalRequests] order by ID desc" UpdateCommand="update WithdrawalRequests set test=? where ID=?" DeleteCommand="delete from WithdrawalRequests where ID=?"  >
                     </asp:AccessDataSource>
           
            
    
										    </td>
										     
										</tr>

                                                    <tr>
                                                        <td height="30">
                                                        </td>

                                                        </tr>



										    <tr>
                                                                              <td align="center">
                                                                                 <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></td>
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
