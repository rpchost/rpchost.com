<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ValidatePhone.aspx.vb" Inherits="ValidatePhone" %>


<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
	<head>
   <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131430617-1"></script>

   	
   	<script>
   	
   	function load() {
   	    document.getElementById("loading").src = "picture/loading2.gif";
         }
   	
   	</script>
   	
   	<script type="text/javascript">


   	    function Redisplay() {
   	        document.getElementById("loading").src = "picture/loading2.gif"
   	    }

    </script>



   		
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

      function myFunction() {
             document.getElementById('someid').value = document.getElementById('txtDepositAmount').value;
      }
  </script>
    
    	<script type="text/javascript">


   	    function Redisplay() {
   	        document.getElementById("loading").src = "picture/loading2.gif"
   	    }

    </script>

</head>
	<body leftMargin=0 topmargin=0 > 
	
								<form id="Form1" runat=server method="POST">
								
								
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
																
																	<TD valign="top"  align=center Class="head05">
																	
																	Phone Validation
																	
																	</TD>
																	
																	
														
																</TR>
																
																
																<TR>
																
																<td  height=70></td>
																
																	<TD valign="top"  align=center >
																	
																	   
																	
																	</TD>
																	
																</TR>
																
																
																<td  ></td>
																
																	<TD valign="top"  align=center >
																	
																	   <asp:Label ID=lblTransID runat=server Cssclass=RednormalText></asp:Label> 
																	
																	</TD>
																	
																</TR>
																
																
																<TR>
																
																<td  height=20></td>
																
																	<TD valign="top"  align=center >
																	
																	   
																	
																	</TD>
																	
																</TR>
																
																<TR>
																
																<td  height=20></td>
																
																	<TD valign="top"  align=center class=head01_9 >
																	
																	Phone verification is to protect your purchases and to trace any fraud<br><br>
																	
																	  
																	    We sent you a PassCode to your phone  
																	 
																	 <asp:Label ID=lblPhone runat=server CssClass="rednormaltext"></asp:Label>  <%--<asp:hyperlink runat=server ID=lblChange class=RedTextBold NavigateURL='profile.aspx' text="[Change Phone]"/> --%> <br><br>
																	</TD>
																	
																</TR>
																<TR>
																<td  height=50></td>
																
																	<TD valign="top"  align=center >
																	
																	 <asp:Button runat=server Text="Submit Code" visible=false width=150 Height=25 ID=btnSubmit onclientclick="Redisplay()" CssClass="inputbutton" />
																	</TD>
																	
																</TR>
																
																
																
																
																<TR>
																<td></td>
																
																	<TD valign="center"  height=30 align=center class=head01_9 >
																	
																	Enter the PassCode that arrived to your phone and press validate
																	
																	</TD>
																	
																</TR>
																
																<TR>
																<td  ></td>
																
																	<TD valign="top"  align=center >
																	
																	<asp:TextBox runat=server ID=txtCode MaxLength=6 CssClass="inputtext_center" ></asp:TextBox>
																	
																	</TD>
																	
																</TR>
																
																<TR>
																<td  height=50></td>
																
																	<TD valign="middle"  align=center >
																	
																	 <asp:Button runat=server Text="Validate" Visible=false width=150 Height=25 ID=btnValidate onclientclick="Redisplay()" CssClass="inputbutton" />
																	</TD>
																	
																</TR>
																
																<TR>
																<td></td>
																
																	<TD valign="center"  height=30 align=center >
																	
																	
																	<asp:Label runat=server ID=lblMess CssClass="rednormaltext"></asp:Label>
																	</TD>
																	
																</TR>
																
																<TR>
																<td  height=50></td>
																
																	<TD valign=middle align=center class=RednormalText >
																	
																	Whatever problem happened please <a href=contact.aspx title="Contact Us" target=_blank>contact us</a>
																	</TD>
																	
																</TR>
																<TR>
																<td></td>
																
																	<TD  align="center">
																	
																	 <img  id="loading"  >
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
