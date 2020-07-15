<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Offers.aspx.vb" Inherits="Offers" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
	
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
		<META NAME="KEYWORDS" CONTENT="Buy, Sell, Cryptocurrency, Bitcoin">
		<META NAME="ABSTRACT" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
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
																	          <td class="head05" height=150 align=center>
																	           
        																	        OFFERS </TD>
																	              
															                  </TD>
																	      </tr>
                                                                                       
                                                                                       
                                                                                       <tr>
                                                                                       <td>
                                                                                       
                                                                                                <asp:GridView ID="grdOffers" runat="server" DataKeyNames="ID" HeaderStyle-BackColor=Silver   AutoGenerateColumns="False" emptydatatext="No offers for now .. please wait" CssClass="head01_9" DataSourceID="AccessDataSource1" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:TemplateField HeaderText="ID" ItemStyle-Width=70 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" runat="server"  Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-Width=70 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Amount" runat="server"  Text='<%# Bind("Amount") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                            
                                                                                                                         
                                                                                                                              <asp:TemplateField HeaderText="Cryptocurrency" ItemStyle-Width=10 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="BuyCurrency" runat="server"  Text='<%# Bind("BuyCurrency") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                            <asp:TemplateField HeaderText="Price" ItemStyle-Width=70 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="SellPrice" runat="server"  Text='<%# Bind("SellPrice") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                              <asp:TemplateField HeaderText="You get" ItemStyle-Width=70 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ClientGet" runat="server"  Text='<%# Bind("ClientGet") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                                                   
                                                                                                                          
                                                                                                                              <asp:TemplateField HeaderText="Currency" ItemStyle-Width=70 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="SellCurrency" runat="server"  Text='<%# Bind("SellCurrency") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                             <%--  <asp:TemplateField HeaderText="Rate" ItemStyle-Width=70 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="SellRate" runat="server"  Text='<%# Bind("SellRate") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>--%>
                                                                                                                                                                                                                                                
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="DateOffer" ItemStyle-Width=150 ItemStyle-HorizontalAlign=Center HeaderText="Offer Date" 
                                                                                                                         SortExpression="DateOffer" />
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="Status" ItemStyle-Width=150 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Status" runat="server"  Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                           <asp:TemplateField HeaderText="Wallet" ItemStyle-Width=240>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:TextBox width=240 ID="Wallet" Text='<%# Bind("Wallet") %>' AutoPostBack=true  onClick="OpenBuy" runat="server" CssClass=INPUTTEXT_CENTER_1 ></asp:TextBox>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                              
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                          <asp:TemplateField ItemStyle-Width=20 ItemStyle-HorizontalAlign=Center>
                                                                                                                        <ItemTemplate>
                                                                                                                       <asp:Button ID="btnBuy" runat="server" Text='Buy' 
                                                                                                                          CommandArgument="btnBuy" OnClick="btnOffers_Click" cssClass=INPUTBUTTON />    
                                                                                                                         
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
                                                                        
                                                                        
                                                                          
																	     </table>
																		  </asp:Panel>
																		
																	</TD>
																	
																</TR>
																
																
																<tr>
                                                                                        <td height=40></TD>
                                                                                         <td>
                                                                                         
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
