<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CancelTransaction.aspx.vb" Inherits="CancelTransaction" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head id="Head1" runat=server>
   
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

  	<script>
   	
   	function Redisplay() {
   	    document.getElementById("loading").src = "picture/loading1.gif";
         }
   	
   	</script>

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
																		<div class=head09 ></div>
																	
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
																	          <td class="head05" width="100%" height=100 align=center>
																	           
        																	          CANCEL DEPOSIT</TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	     
																	      
																	      
																	      <tr>
																	          <td  align=center  >
																	        
																	        
																	        <table>
																	        
																	        
																	         <tr>
																	            <td align=center class="redtextbold">
																	           <asp:Label id="lblTransaction" runat="server" Text=""  CssClass="rednormaltext"></asp:Label>
																	            </td>
																	        </tr>
																	        
																	        <tr>
																	            <td align=center class="redtextbold">
																	            Are you sure you want to cancel
																	            ?
																	            </td>
																	        </tr>
																	        
																	         <tr>
																	            <td>
																	            
																	            </td>
																	        </tr>
																	        
																	         <tr>
																	            <td align=center>
																	           <asp:RadioButtonList AutoPostBack=true CssClass="BlackTextBold" RepeatDirection=Horizontal ID="rblCancel" runat="server">
                                                                                    <asp:ListItem Text="Yes, I want to cancel transaction" Value="yes" />
                                                                                    <asp:ListItem Selected Text="No, I just want to edit transaction" Value="no" />
                                                                                </asp:RadioButtonList>
																	            </td>
																	        </tr>
																	        
																	        </table>
																	        
        																	          
        																	          
															                  </TD>
																	      </tr>
																	      
																	       <tr>
																	            <td height=40>
																	                
																	            </td>
																	        </tr>
																	      
																	        <tr>
																	            <td align=center>
																	                  <table width="500" runat=server id=tbl1>
        																	           <tr>
																	                        <td  class="head01_9_normal" align=center valign=top>
            																	               Anything you want to update in this transaction. <br>(for example; I need to change my wallet address)
																	                        </td>
																	                        
																	                        
																	                    </tr>
																	                      <tr>
																	                       
																	                        
																	                      <td align=center>
            																	               <asp:TextBox runat=server ID=txtMemo Width=330 Height=70 TextMode=MultiLine />
																	                        </td>
																	                    </tr>
																	                    
																	                     <tr>
																	                       
																	                        
																	                      <td align=center>
            																	                
																	               <asp:Button ID="btnSend" 
                                                                                                     CssClass="INPUTBUTTON" runat="server" 
                                                                                                     Text="Send"  Width="220" Height=25  onclientclick="Redisplay()"/>
																	                        </td>
																	                    </tr>
																	                    
																	                     <tr>
																	                       
																	                        
																	                      <td align=center Class="head01_9_normal">
            																	                
            																	                We will reply you in <a href='contact.aspx'>contact</a> page
            																	                
																	                        </td>
																	                    </tr>
																	                  </table>
																	            </td>
																	        </tr>
																	      
																	      
																	       <tr>
																	            <td align=center>
																	                  <table width="500" runat=server id=tbl2>
        																	           <tr>
																	                        <td  class="head01_9_normal" align=center valign=top>
            																	               
																	                        </td>
																	                        
																	                        
																	                    </tr>
																	                      <tr>
																	                       
																	                        
																	                      <td align=center>
																	                     
            																	                <asp:Button id="btnRefund" runat="server" Text="Cancel" onclientclick="Redisplay()" Width="220" Height=25  CssClass="INPUTBUTTON"></asp:Button>
																	              
																	                        </td>
																	                    </tr>
																	                    
																	                     <tr>
																	                       
																	                        
																	                      <td align=center class="head01_9_normal" height=50>
            																	               When refund finish, we will reply you in <a href='contact.aspx'>contact</a> page

																	                        </td>
																	                    </tr>
																	                  </table>
																	            </td>
																	        </tr>
																	
        																	   </table>     
															                  </TD>
																	      </tr>
																	      
																	      <tr> 
																	      
																	        <td align=center>
            																	              
																	                        </td>   
																	                        
																	                <td height=10 align=center>
																	                
																	                <img  id="loading"  >
																	                
																	                </td>
																	            </tr>
																	      
																	      <tr>
																	                       
																	                       <td align=center>
            																	              
																	                        </td>   
																	                      <td align=center height=50>
            																	                <asp:Button id="brnBack" runat="server" Text="Back" Width="98" Height=25 CssClass="INPUTBUTTON"></asp:Button>
																	               
																	                        </td>
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