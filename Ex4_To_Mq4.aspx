<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Ex4_To_Mq4.aspx.vb" Inherits="Ex4_To_Mq4" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   		<title> 
	        EX4 TO MQ4 Decompiler
        </title><meta http-equiv="keywords" content="Free EX4 TO MQ4 Decompile Service" /><meta name="description" content="ex4 to mq4, ex4 decompiler, ex4 decompile,Free EX4 TO MQ4 ,ex4tomq4, ex4tomql4, ex4tomq4 decompiler, ex4 to mq4 223,ex4 to mq4 224,ex4 to mq4 225,, ex4 convertor,free ex4 to mql4 ,exe4 to mql4, exe4 to mq4 ,free ex4 decompiler ,ex4 convert, ex4 convert to mq4, ex4 decode, ex4 decoder, ex4 to mq4 convertor ,ex4 to mql4, ex4 to mql4 decompiler, expert, expert advisor, expert decoder, expert advisor decoder,ex4-to-mq4, ex4-to-mql4,exe4-to-mql4, ex4-to-mq4-decompiler,Ex4 к mq4, Ex4 до mq4, ex4 да mq4, ex4以mq4, ex4 na mq4, EX4 zu mq4, ex4 mq4 करने के लि, ex4 mq4に, Ex4 декомпілятор, ex4闪客, Ex4 декомпилятор " /> 
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		
		<META NAME="KEYWORDS" CONTENT="forex, technical, analysis, alerts, free forex, accurate signals, free fx signals, Rpchost.com, trading forex platforms, forex USA, forex middle east, forex Europe, forex Asia, forex trading alerts, Cheap Forex signals, Forex Trader, Automated Forex System, fx market, forex signals">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

  </head>
	<body leftMargin=0 topmargin=0 > 
		
					<form id="Form1" method="post" runat="server">
						
									<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%" align="center"
										border="0">
										<TR>
											<TD width="100%" colSpan="3">
												
											</TD>
										</TR>
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
																		<uc4:right runat="server" id="headerbutton"></uc4:right>
																	</TD>
																</TR>
															</TABLE>
														</td>
													</tr>
													<TR><td height=1></td></tr>
													
													<tr>
																							<td Width="100%" Class="INPUTTITLETEXT" valign=middle Height="25">
																		                                    <!-- Content goes here -->
																		                                    <div class=head09 >Ex4 TO MQ4</div>
                                    																	
														                                    </td>
														                                    
																						</tr>
																						
																						
																							<tr>
																							<td height="25"></td>
																						</tr>
																						
																						
																						<tr>
																							<td height="25" class="BlackTextBold">Upload Ex4 File for automatic Decompilation <font face=arial color=red>[In case you didn't get the mq4 file in 48 hours it means the ex4 is protected and can't be decompiled]</font></td>
																						</tr>
																						
																						<tr>
																							<td height="25"></td>
																						</tr>
																						
																						
																						<tr>
																							<td>
																							  <table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
                                                                                                 
                                                                                                 <tr>
                                                                                                    <td width=110 class="BlackTextBold">Ex4 File</td>
                                                                                                    <td><input id="MyFile"   class="inputbutton" type="file" size="40" name="File1" runat="server" onclick="return MyFile_onclick()" /></td>
                                                                                                 </tr>
                                                                                                 
                                                                                                  <tr>
                                                                                                    <td valign=top width=110 class="BlackTextBold">Your Email</td>
                                                                                                    <td>  <asp:TextBox ID="txtEmail" CssClass="inputtext" Width=270 runat="server"></asp:TextBox>
                                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate=txtEmail runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                                                                    
                                                                                                    
                                                                                                    <br><br>
                                                                                                     <asp:Button id="btnSubmit" runat="server" Text="Decompile" Width="139px"  OnClick="btnSubmit_Click" CssClass="inputbutton"></asp:Button>
                                                                                                                         <asp:Label id="lbl"   runat="server" Width="402px" Height="33px" CssClass="rednormaltext"></asp:Label>
                                                                                                 
                                                                                                 </td>
                                                                                                 </tr>
                                                                                                 
                                                                                                 
                                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        </table>
                                                                                                                         
                             
                             
																							</td>
																							
																							
																						</tr>
																						
																						<tr>
																    <td align=center height=150>
																   
																    </td>
																</tr>
																						
																						
																						    
																						<tr>
																						    <td  align=center>
																						    																								    <script type="text/javascript"><!--
																						    																								        google_ad_client = "pub-6183127703818516";
																						    																								        /* 728x90, created 2/13/08 */
																						    																								        google_ad_slot = "1725916647";
																						    																								        google_ad_width = 728;
																						    																								        google_ad_height = 90;
																						    																								        function MyFile_onclick() {

																						    																								        }

                                                                                //-->
                                                                                                                                                                                                </script>
                                                                                <script type="text/javascript"
                                                                                src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                                                                                </script>
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
				</TD>
			</TR>
			

		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->


	</body>
</HTML>
