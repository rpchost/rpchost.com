<%@ Page  Language="VB" AutoEventWireup="false" CodeFile="Invest.aspx.vb" Inherits="Invest" %>


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
																		<div class=head09 >INVEST / WITHDRAW</div>
																	
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
																	          <td class="head05" width="100%" align=center>
																	           
        																	          Creating Money Since 2006 
																	              
															                  </TD>
																	      </tr>
																	      
																	      <tr>
																	          <td class="head06">
																	          <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>
        																	         <%-- <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>--%>
															                  </TD>
																	      </tr>
																	      
                                                                     
                                                                          <tr>
																	          <td height=50>
															                  </TD>
																	      </tr>
																	      
            													      
                                                                          <tr>
                                                                             <td>
                                                                                    
                                                                                     <table border=0>
                                                                                     
                                                                                       <tr>
                                                                                        <td Class=head09>Investment ID</TD>
                                                                                         <td><asp:TextBox runat=server ID=txtInvestmentID Enabled=false CssClass=INPUTTEXT ></asp:TextBox>
                                                                                         <asp:Label runat=server ID= lblMess CssClass=RednormalTextBold ></asp:Label>
                                                                                         </TD>
                                                                                       </tr>
                                                                                       
                                                                                       <tr>
                                                                                             <td width=250 Class=head09>Balance</TD>
                                                                                        
                                                                                             <td  >
                                                                                         <table cellpadding=0 cellspacing=0>
                                                                                             <tr> 
                                                                                                 <td>  </td>
                                                                                                 <td><asp:TextBox runat=server ID=txtBalance Enabled=false CssClass=INPUTTEXT></asp:TextBox> </td>
                                                                                                  <td width=20>  </td>
                                                                                                 <td >  <asp:Button runat=server ID=btnInvest  Width=120 Height=25 CssClass=INPUTBUTTON Text="INVEST"></asp:Button> </td>
                                                                                                 <td width=20> </td>
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                              </tr>
                                                                                         </table>    
                                                                                         </TD>
                                                                                         
                                                                                       </tr>
                                                                                       
                                                                                     
                                                                                       
                                                                                       <tr>
                                                                                        <td width=250 Class=head09>Month</TD>
                                                                                         <td width=200 ><asp:TextBox runat=server ID=txtMonth Enabled=false CssClass=INPUTTEXT></asp:TextBox></TD>
                                                                                       </tr>
                                                                                       
                                                                                         <tr>
                                                                                        <td  Class=head09> Profit </TD>
                                                                                        
                                                                                        <td>
                                                                                        
                                                                                            <table cellpadding=0 cellspacing=0>
                                                                                                    <tr>
                                                                                                    
                                                                                                        
                                                                                                         <td> <asp:TextBox runat=server ID=txtProfit Enabled=false CssClass=INPUTTEXT></asp:TextBox></TD>
                                                                                                    <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                    <td>  <asp:Button runat=server ID=btnWithdraw  Width=120 Height=25 CssClass=INPUTBUTTON Text="WITHDRAW"></asp:Button></td>
                                                                                                 
                                                                                                 
                                                                                               
                                                                                               <td>  
                                                                                               
                                                                                                    <table runat=server id=tblWithdraw visible=false>
                                                                                                        <tr>
                                                                                                        
                                                                                                         <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                        
                                                                                                            <td>
                                                                                                               <img src="picture/arrow.jpg"
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                                <asp:RadioButtonList CssClass=BlackTextBold10 runat=server ID = RdWithdraw  RepeatColumns=3>
                                                                                                                    <asp:ListItem Text="PM" Value="PM" Selected></asp:ListItem>
                                                                                                                    <asp:ListItem Text="PAYEER" Value="PAYEER" ></asp:ListItem>
                                                                                                                    <asp:ListItem Text="BITCOIN" Value="BITCOIN"></asp:ListItem>
                                                                                                                </asp:RadioButtonList>
                                                                                                            </td>
                                                                                                            
                                                                                                             <td width=20>
                                                                                                              
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                               <asp:Button runat=server ID=btnConfirm  Width=60 Height=25 CssClass=INPUTBUTTON Text="Confirm"/>
                                                                                                            </td>
                                                                                                             <td width=10>
                                                                                                              
                                                                                                            </td>
                                                                                                             <td>
                                                                                                               <asp:Button runat=server ID=btnCancel  Width=60 Height=25 CssClass=INPUTBUTTON Text="Cancel"/>
                                                                                                            </td>
                                                                                                            
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                        <tr>
                                                                                                        
                                                                                                         <td>
                                                                                                               
                                                                                                            </td>
                                                                                                            
                                                                                                            <td colspan=6>
                                                                                                               <asp:Label runat=server ID="lblWithdrawMess" CssClass=Rednormaltext></asp:Label>
                                                                                                            </td>
                                                                                                            
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                    </table>
                                                                                               
                                                                                               </td>
                                                                                               
                                                                                               
                                                                                                    </tr>
                                                                                             </table>
                                                                                             
                                                                                        </TD>
                                                                                        
                                                                                        
                                                                                      
                                                                                        
                                                                                    
                                                                                       </tr>
                                                                                       
                                                                                       
                                                                                       <tr>
                                                                                        <td></TD>
                                                                                         <td>
                                                                                         </TD>
                                                                                       </tr>
                                                                                       
                                                                                       <tr>
                                                                                        <td Class=head09>Invested Amount</TD>
                                                                                         <td><asp:TextBox runat=server ID=txtInvestedAmount Enabled=false CssClass=INPUTTEXT></asp:TextBox></TD>
                                                                                       </tr>
                                                                                       
                                                                                      <%-- <tr>
                                                                                        <td Class=head09>Date of Investment</TD>
                                                                                         <td><asp:TextBox runat=server ID=txtDateOfInvestment Enabled=false CssClass=INPUTTEXT ></asp:TextBox></TD>
                                                                                       </tr>--%>
                                                                                       
                                                                                      
                                                                                       
                                                                                       
                                                                                       
																	                 </table>
                                                                                    
                                                                             </TD>
                                                                             
                                                                        </tr>
                                                                        
                                                                        
																	    <tr>
                                                                             <td height=20>

                                                                             </TD>
                                                                        </tr>
            	
																	      
																	       <tr>
                                                                             <td>
                                                                                    
                                                                                     <table border=0 width=100%>
                                                                                       <tr>
                                                                                       <td>
                                                                                       
                                                                                                 <asp:GridView ID="grdInvest" runat="server" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" AutoGenerateColumns="False" CssClass="head01" DataSourceID="AccessDataSource1" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:BoundField DataField="InvestmentMonth" HeaderText="Month"
                                                                                                                          SortExpression="InvestmentMonth" ItemStyle-HorizontalAlign=Center />
                                                                                                                     <asp:BoundField DataField="Capital" HeaderText="Balance" ItemStyle-HorizontalAlign=Center SortExpression="Capital" />
                                                                                                                          <asp:BoundField DataField="Rate" HeaderText="Interest Rate %"  ItemStyle-HorizontalAlign=Center
                                                                                                                          SortExpression="Rate" />

                                                                                                                          <asp:BoundField DataField="DateOfInvestment" ItemStyle-HorizontalAlign=Center HeaderText="Date Of Investment" 
                                                                                                                          SortExpression="DateOfInvestment" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="DueDate" ItemStyle-HorizontalAlign=Center HeaderText="Due Date" 
                                                                                                                          SortExpression="DueDate" />
                                                                                                                           <asp:BoundField DataField="ElapsedDays" ItemStyle-HorizontalAlign=Center HeaderText="Remaining Days" 
                                                                                                                          SortExpression="ElapsedDays" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="Profit" HeaderText="Profit"  ItemStyle-HorizontalAlign=Center
                                                                                                                          SortExpression="Profit" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-ForeColor="#336600"  ItemStyle-HorizontalAlign=Center
                                                                                                                          SortExpression="Status" />
                                                                                                                    
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
                                                                        
																	     </table>
																		
																		
																	</TD>
																	
																	
														
																</TR>
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