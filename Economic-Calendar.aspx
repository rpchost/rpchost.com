<%@ Page Language="vb" AutoEventWireup="false" Inherits="EconomicCalendar" CodeFile="Economic-Calendar.aspx.vb" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   		<title>Economic calendar | Forex news | News trade</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="Rpchost features the best Global Economic Calendar, and user-rated Forex news.">
		<META NAME="KEYWORDS" CONTENT="Economic calendar, trade news, signal">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signal, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

</head>
<body leftMargin=0 topmargin=0 > 
    	<form id="Form1" method="post" runat="server">
						
									<TABLE borderColor="#000000" height="100%" cellSpacing="0" cellPadding="0" width="100%" align="center"
										border="0">
										
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
													<TR><td height=2></td></tr>
													<tr>
														<td align="left" colSpan="4">
															<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
																<tr>
																
																<td width=2></td>
																	<td>
																	<!-- Content goes here -->
																		
																		<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
                                                                    <TR vAlign="top">
	                                                                    <TD width="8" height="24"></TD>
	                                                                    <TD width="726">
		                                                                    <asp:label id="Label10" runat="server" Font-Names="Arial" ForeColor="Maroon" Font-Bold="True"><H8>Economic Calendar</H8></asp:label></TD>
                                                                    </TR>
                                        							
                                        							
                                                                    <TR vAlign="top">
	                                                                    <TD colspan=2 align =left><HR width="673" SIZE="1"></TD>
	                                                                    <TD>
                                        									
	                                                                    </TD>
                                                                    </TR>
                                        							
                                        							
                                                                    <TR vAlign="top">
                                                                    								
                                                                    <TD width=100% colspan=2>

                                                                    <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	                                                                    <TR rowspan=3>
		                                                                    <TD height="6"></TD>
                                                                    		
		                                                                    <TD valign=top>
                                                                    		
		                                                                    <table>
                                                                         <tr>
                                                                           <td Class="BlackSmallText9">
                                                                             This <b>Economic Calendar</b> helps traders in their trades; At a specific time it displays a set of economic reports, trading news and signal reflecting how the fx news influences a specific currency. At the moment of releasing a report, this global economic calendar displays 
                                                                             the economic data. My FX Automated software uses the analysis displayed by this economic calendar to <b>trade the news</b> and generates Fundamental signals. [<a href=freeforexsignal.aspx title="Free Forex Signal" target=new>Access Free Fundamental signal </a>]
                                                                             <br><br>
                                                                             
                                                                             
                                                                             
                                                                             
                                                                           </td>
                                                                         </tr>
                                                                         
                                                                         <tr>
                                                                           <td height = 3></td>
                                                                         </tr>
                                                                         
                                                                         <tr>
                                                                           <td>
                                                                               
                                                                               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ID" DataSourceID="AccessDataSource1" Width="638px">
                        <Columns>
                            <asp:BoundField DataField="ReportName" HeaderText="ReportName" 
                                SortExpression="ReportName" />
                            <asp:BoundField DataField="TimeRelease" HeaderText="TimeRelease" 
                                SortExpression="TimeRelease" />
                            <asp:BoundField DataField="Pair" HeaderText="Pair" SortExpression="Pair" />
                            <asp:BoundField DataField="TradingPair" HeaderText="TradingPair" 
                                SortExpression="TradingPair" />
                        </Columns>
                    </asp:GridView>
                    
                    
                      <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/DB/db_maindata.mdb" DeleteCommand="delete from ReportAnalysis where ID=?"
                        SelectCommand="SELECT [ReportName], [TimeRelease], [Pair], [TradingPair], [isTradable], [ID] FROM [ReportAnalysis]">
                    </asp:AccessDataSource>
                                                                               
                                                                           </td>
                                                                         </tr>
                                                                         
                                                                         <tr>
                                                                           <td class=RednormalText> 
                                                                                <br />
                                                                                <br />
                                                                                This Global economic calendar refreshes itself every 10 seconds and displays the economic data within seconds of the news release, this forex calendar is a great tool for traders who trade the news.   
                                                                           </td>
                                                                         </tr>
                                                                         
                                                                         <tr>
                                                                           <td  height=5> 
                                                                                
                                                                           </td>
                                                                         </tr>
                                                                         
                                                                         <tr>
                                                                         <td>
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
                                                                         
                                                                         
                                                                        </table>	

		                                                                    </TD>
                                                                    		
		                                                                    <TD width=5 valign=top>
		                                                                    </TD>
	                                                                    </TR>
                                                                    	
	                                                                    <tr><td height=10></td>
	                                                                    <td></td>
                                                                    	
	                                                                    </tr>
                                                                    </TABLE>

                                                                    </TD>
                                                                    						
	                                                                    </TR>
	                                                                                                                            				
                                                        				
                                                                    </TABLE>
																		
																		<!-- End Content -->
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
					</form>
					
					
</body>
</html>
