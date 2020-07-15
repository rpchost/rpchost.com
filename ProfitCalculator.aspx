<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="ProfitCalculator.aspx.vb" Inherits="ProfitCalculator" %>


<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
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

<meta name="verify-admitad" content="2504a66eeb" />	

  

</head>
	<body leftMargin=0 topmargin=0 > 
								<form id="Form1" runat=server>
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0"  width="100%" align="center"
										border="0">
										<TR>
											<TD width="100%" colSpan="3">
											
												<%--<uc2:right runat="server" id="Right1"></uc2:right>--%>
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
																	          <td class="head05" width="100%" align=center>
																	           
        																	          PROFIT CALCULATOR
																	              
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
																	          <td align=center>
																	           
        																	          <table border=0 width=100%>
        																	          
        																	          
        																	            <tr>
        																	                <td class=head09 height=40>
        																	                STARTER PLAN
        																	                </TD>
																	                   
        																	                <td>
        																	                </TD>
																	                  
        																	                <td class=head09>
        																	                PRO PLAN
        																	                </TD>
																	                    </tr>
        																	          
        																	          
        																	            <tr>
        																	                <td>
        																	                  <asp:GridView ID="grdStarterPlan" runat="server" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" AutoGenerateColumns="False" CssClass=head09_13
                                                                                                DataSourceID="AccessDataSource1" Width=100% >
                                                                                                <Columns>
                                                                                               
                                                                                               
                                                                                                <asp:BoundField DataField="MonthProfit" HeaderText="Month"  ItemStyle-HorizontalAlign=Center
                                                                                                SortExpression="MonthProfit" />
                                                                                                
                                                                                                <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign=Center
                                                                                                SortExpression="Amount" />
                                                                                               

                                                                                                <asp:BoundField DataField="InterestRate" ItemStyle-HorizontalAlign=Center HeaderText="Interest Rate %" 
                                                                                                SortExpression="Interest Rate" />

                                                                                                <asp:BoundField DataField="Investment" ItemStyle-HorizontalAlign=Center HeaderText="Investment" 
                                                                                                SortExpression="Investment" />
                                                                                              

                                                                                                </Columns>
                                                                                                </asp:GridView>
                                                                                                <asp:AccessDataSource ID="AccessDataSource1" runat="server"  SelectCommand="Select * From ProfitCalculator where plan=100"
                                                                                                DataFile="~/DB/db_maindata.mdb" >
                                                                                                </asp:AccessDataSource>
        																	                </td>
        																	                <td width=200>
        																	                
        																	                </td>
        																	                <td>
        																	                <asp:GridView ID="grdProPlan" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#F8F7F7" HeaderStyle-BackColor=Silver  CssClass=head09_13
                                                                                            DataSourceID="AccessDataSource2" Width=100% >
                                                                                            <Columns>
                                                                                           
                                                                                           
                                                                                            <asp:BoundField DataField="MonthProfit" HeaderText="Month"  ItemStyle-HorizontalAlign=Center
                                                                                            SortExpression="MonthProfit" />
                                                                                            
                                                                                            <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign=Center
                                                                                            SortExpression="Amount" />
                                                                                           


                                                                                            <asp:BoundField DataField="InterestRate" ItemStyle-HorizontalAlign=Center HeaderText="Interest Rate %" 
                                                                                            SortExpression="InterestRate" />

                                                                                            <asp:BoundField DataField="Investment" ItemStyle-HorizontalAlign=Center HeaderText="Investment" 
                                                                                            SortExpression="Investment" />
                                                                                          

                                                                                            </Columns>
                                                                                            </asp:GridView>
                                                                                            <asp:AccessDataSource ID="AccessDataSource2" runat="server"  SelectCommand="Select * From ProfitCalculator where plan=500"
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