<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TransactionsHistory.aspx.vb" Inherits="TransactionsHistory" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
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
																		<div class=head09 >TRANSACTIONS HISTORY</div>
																	
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
																	
																	 <asp:Panel id="pnlContents" runat = "server">
																	
																	  <table width="100%">
																	  
																	  
																	   <tr>
																	          <td class="head05" width="100%" align=center>
																	           
        																	          Creating Money Since 2006 
																	              
															                  </TD>
																	      </tr>
																	      
																	      <tr>
																	          <td class="head06" align=center>
        																	          <asp:label runat=server ID=txtMonthlyProfit CssClass="head06">Be your own bank</asp:label>
															                  </TD>
																	      </tr>
																	      
                                                                     
                                                                          <tr>
																	          <td height=50>
															                  </TD>
																	      </tr>
																	      
																	      
																	       
            													      
                                                                    
																	      
																	   <tr>
                                                                        <td>
                                                                                   
                                                                                    
                                                                                    
                                                                                     <table border=0 width=100%>
                                                                                     
                                                                                      <tr>
                                                                                       <td>
                                                                                            Exchange History
                                                                                       </td>
                                                                                      </tr> 
                                                                                       
                                                                                       
                                                                                       <tr>
                                                                                       <td>
                                                                                       
                                                                                                <asp:GridView ID="grdHistory" runat="server" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" AutoGenerateColumns="False" CssClass="head01" DataSourceID="AccessDataSource1" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:BoundField DataField="USDAmountToBTC" HeaderText="USD Amount"
                                                                                                                          SortExpression="USDAmountToBTC" ItemStyle-HorizontalAlign=Center />
                                                                                                                          
                                                                                                                     <asp:BoundField DataField="BtcAmountToUsd" HeaderText="BTC Amount" ItemStyle-HorizontalAlign=Center SortExpression="BtcAmountToUsd" />
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="AskPrice" ItemStyle-HorizontalAlign=Center HeaderText="Ask Price" 
                                                                                                                         SortExpression="AskPrice" />
                                                                                                                           <asp:BoundField DataField="BidPrice" ItemStyle-HorizontalAlign=Center HeaderText="Bid Price" 
                                                                                                                         SortExpression="BidPrice" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="dateRequest" ItemStyle-HorizontalAlign=Center HeaderText="Date Exchange Request" 
                                                                                                                         SortExpression="dateRequest" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="DoneByAdmin" ItemStyle-HorizontalAlign=Center HeaderText="Exchanged" 
                                                                                                                         SortExpression="DoneByAdmin" />
                                                                                                                           
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server"  
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
                                                                                       
                                                                                       </td>
                                                                                       </tr>
                                                                                       
                                                                                       
                                                                                        <tr>
                                                                                       <td height=40>
                                                                                      
                                                                                       </td>
                                                                                      </tr> 
                                                                                      
                                                                                      
                                                                                       <tr>
                                                                                       <td>
                                                                                            Withdrawal History
                                                                                       </td>
                                                                                      </tr> 
                                                                                      
                                                                                      
                                                                                         <tr>
                                                                                       <td>
                                                                                       
                                                                                                <asp:GridView ID="grdWithdraw" runat="server" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" AutoGenerateColumns="False" CssClass="head01" DataSourceID="AccessDataSource2" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:BoundField DataField="WithdrawBtc" HeaderText="BTC Amount"
                                                                                                                          SortExpression="WithdrawBtc" ItemStyle-HorizontalAlign=Center />
                                                                                                                          
                                                                                                                     <asp:BoundField DataField="WithdrawUsd" HeaderText="USD Amount" ItemStyle-HorizontalAlign=Center SortExpression="WithdrawUsd" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="dateRequest" ItemStyle-HorizontalAlign=Center HeaderText="Date withdraw Request" 
                                                                                                                         SortExpression="dateRequest" />
                                                                                                                         
                                                                                                                         
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="WithdrawMethod" ItemStyle-HorizontalAlign=Center HeaderText="Withdrawal Method" 
                                                                                                                         SortExpression="WithdrawMethod" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="DoneByAdmin" ItemStyle-HorizontalAlign=Center HeaderText="Withdrew" 
                                                                                                                         SortExpression="DoneByAdmin" />
                                                                                                                           
                                                                                                                           
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource2" runat="server"  
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
                                                                                       
                                                                                       </td>
                                                                                       </tr>
                                                                                       
                                                                                       
																	                 </table>
																	                 
																	               
                                                                                    
                                                                        </TD>
                                                                        </tr>
                                                                        
                                                                        
                                                                          
																	     </table>
																		  </asp:Panel>
																		
																	</TD>
																	
																</TR>
																
																
																<tr>
                                                                                        <td height=40></TD>
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