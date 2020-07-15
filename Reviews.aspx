<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Reviews.aspx.vb" Inherits="Reviews" %>



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
		<META NAME="KEYWORDS" CONTENT="Buy, Cryptocurrency, Bitcoin">
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
																	          <td class="head05" height=80  align=center>
																	           
        																	          REVIEWS 
																	              
															                  </TD>
																	      </tr>
																	      
																	    <%--  <tr>
																	          <td  height=40>
        																	         
															                  </TD>
																	      </tr>--%>
																	      
                                                                     
                                                                          <tr>
																	          <td height=50 Class="rednormaltext" align=center>
																	          
																	          If you are happy with our service, please drop us a good review
																	          
															                  </TD>
																	      </tr>
																	      
																	      
																	       
            													      
                                                                          <tr>
                                                                             <td>
                                                                                    
                                                                                     <table border=0>
                                                                                     
                                                                                     
                                                                                       <tr>
                                                                                        <td Class=head09>User ID</TD>
                                                                                         <td><asp:TextBox runat=server ID=txtUserID  Height=20 Enabled=false CssClass=INPUTTEXT ></asp:TextBox></TD>
                                                                                       </tr>
                                                                                       
                                                                                       <tr>
                                                                                        <td Class=head09>Name</TD>
                                                                                         <td><asp:TextBox runat=server ID=txtUserName Enabled=false Height=20 CssClass=INPUTTEXT ></asp:TextBox></TD>
                                                                                       </tr>
                                                                                       
                                                                                       <tr>
                                                                                        <td width=250 Class=head09>Date</TD>
                                                                                         <td width=200 ><asp:TextBox runat=server ID=txtDate Enabled=false Height=20 CssClass=INPUTTEXT></asp:TextBox></TD>
                                                                                       </tr>
                                                                                       
                                                                                        <tr>
                                                                                        <td Class=head09> Review </TD>
                                                                                         <td><asp:TextBox runat=server ID=txtReview Enabled=true TextMode=MultiLine Width=400 Height=50 MaxLength=300 CssClass=INPUTTEXT_12></asp:TextBox></TD>
                                                                                       </tr>
                                                                                       
                                                                                        <tr>
                                                                                        <td align=center > <asp:button runat=server ID=btnSubmit Enabled=true CssClass=INPUTBUTTON Height=25 Width=140 Text="Post Review"></asp:button> </TD>
                                                                                         <td Class=RednormalTextBold> <asp:label runat=server ID=lblMess Text=""></asp:label> </TD>
                                                                                       </tr>
                                                                                                                                                                             
                                                                                       
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
                                                                                       
                                                                                                <asp:GridView ID="grdReviews" runat="server" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" AutoGenerateColumns="False" HeaderStyle-CssClass="head01" RowStyle-CssClass=head01_9 DataSourceID="AccessDataSource1" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:BoundField DataField="ID" HeaderText="Review ID" HeaderStyle-Width=80
                                                                                                                          SortExpression="ID" ItemStyle-HorizontalAlign=Center Visible=false />
                                                                                                                     <asp:BoundField DataField="UserName" HeaderText="User Name" HeaderStyle-Width=150 ItemStyle-HorizontalAlign=Center SortExpression="UserName" />
                                                                                                                          <asp:BoundField DataField="ReviewDate" HeaderStyle-Width=200 ItemStyle-HorizontalAlign=Center HeaderText="Review Date" 
                                                                                                                         SortExpression="ReviewDate" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="Review" ItemStyle-Width=500 ItemStyle-HorizontalAlign=Left ItemStyle-CssClass=head01_9_normal HeaderText="Review" 
                                                                                                                         SortExpression="Review" />
                                                                                                                          
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server"  SelectCommand="Select * from Reviews where Moderated='yes' order by ReviewDate desc "
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