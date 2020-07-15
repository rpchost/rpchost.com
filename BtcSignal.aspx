<%@ Page Language="VB"  EnableEventValidation="false" Theme="theme" AutoEventWireup="false" CodeFile="BtcSignal.aspx.vb" Inherits="BtcSignal" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
<HEAD id="Head1" runat="server">
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
	
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
																
																	<TD valign="top" >
																	
																	  <table width="100%">
																	  
																	  
																	    <tr> 
																	                <td  height=20>
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	   <tr>
																	          <td class="head05" width="100%" align=center>
																	           
        																	       
																	              <asp:Label CssClass="head05" ID=lblTitle width="100%" runat=server>BITCOIN PREDICTION SIGNALS</asp:Label>
															                  </TD>
																	      </tr>
																	      
																	   
                                                                         
																	      
																	       <tr>
																	          <td align=center>
																	           
																	                  <table border=0>
																	          
																	          
																	           <tr> 
																	                <td  height=50>
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	             <tr> 
																	                <td class=RednormalText align=center >
																	                
																	                    Our technical analysis team is working hard to predict bitcoin movement<br>
																	                    Please consider this analysis as a mathematic conclusion of technical and fundamental indicators, do not take any Buy or Sell decision unless you completly know what you are doing
																	                
																	                </td>
																	            </tr>
																	      
																	              
																	                <tr> 
																	                <td  height=10>
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	             <tr> 
																	                <td>
																	                
																	                    <asp:GridView  Width=100% ID="grdSignals" SkinID=grdTrans runat="server" AutoGenerateColumns="False"  emptydatatext="There is no signals" HeaderStyle-BackColor=Silver  RowStyle-BackColor="#F8F7F7"
                                                                                                                  DataSourceID="AccessDataSource1" >
                                                                                                                 <Columns>
                                                                                                                     
                                                                                                                    
                                                                                                                          <asp:TemplateField HeaderText="Signal ID" ItemStyle-Width=350 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                           <asp:BoundField DataField="CryptoCurr" ItemStyle-Width=350 HeaderText="CryptoCurrency" ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="CryptoCurr" ItemStyle-CssClass=BlacknormalText/>
                                                                                                                         
                                                                                                                           <asp:TemplateField HeaderText="Trend" ItemStyle-Width=350 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Trend"  runat="server" Text='<%# Bind("Trend") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                         
                                                                                                                         <asp:BoundField DataField="EntryPrice" ItemStyle-Width=700 HeaderText="Entry Price"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="EntryPrice" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="ClosePrice" ItemStyle-Width=700 HeaderText="Exit Price"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="ClosePrice" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                         <asp:BoundField DataField="TrendBeginDate" ItemStyle-Width=700 HeaderText="Trend Begin"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="TrendBeginDate" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="TrendEndDate" ItemStyle-Width=700 HeaderText="Trend End"  ItemStyle-HorizontalAlign=Center
                                                                                                                         SortExpression="TrendEndDate" ItemStyle-CssClass=BlacknormalText />
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="" ItemStyle-Width=350 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                   <asp:Image ID="TrendImg" runat="server"  />
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         

                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
																	                  
																	                
																	                </td>
																	            </tr>
																	            

                                                                                           <tr>
                                                                              <td height="60">
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
																	           
																	              <tr>
                                                                              <td align="center">
                                                                                 <script type="text/javascript">
	atOptions = {
		'key' : '10b7f767e2a3a6373ac4b54d0ba8bef4',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
	document.write('<scr' + 'ipt type="text/javascript" src="http' + (location.protocol === 'https:' ? 's' : '') + '://www.hiprofitnetworks.com/10b7f767e2a3a6373ac4b54d0ba8bef4/invoke.js"></scr' + 'ipt>');
</script></td>
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
