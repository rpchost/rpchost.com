<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="Exchange.aspx.vb" Inherits="Exchange" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>



<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<head id="Head1" runat="server">
   
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

<script language=javascript>

    function DefaultValue() {


        var txtbtn = window.document.getElementById('lblBtcUsdAsk');
        txtbtn.value = "TEST";
        
    }

</script>

<script type="text/javascript">


    function Redisplay() {
        document.getElementById("loading").src = "picture/loading4.gif"
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
																	          <td class="head05" height=80 width="100%" align=center>
																	           
        																	          BUY / SELL
																	              
															                  </TD>
																	      </tr>
																	      
																	      
																	      
																	     <%-- <tr>
																	          <td class="head06">
																	          <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>
        																	         <asp:label runat=server ID=txtMonthlyProfit CssClass="head06"></asp:label>
															                  </TD>
																	      </tr>--%>
																	      
                                                                     
                                                                          <tr>
																	          <td height=40 class=RedTextBold align=center>
																	          
																	          
																	          BTCEUR Trend&nbsp;&nbsp; <asp:Image runat=server ID=imgSignal></asp:Image>
																	          
																	         
															                  </TD>
																	      </tr>
																	      
																	      
																	       <tr>
																	          <td width=100% align=center>
																	          
																	        <table>
																	        <tr>
																	            <td>
																	            
																	            </td>
																	            
																	             <td>
																	            
																	            
																	            <table>
																	            
																	            
                                                                       
                                                                   
                                                                       
                                                                         <tr>
																	          <td>
																	          
																	                <table>
																	                    <tr>
																	                        <td class=head10>
																	                            EUR Balance
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                           <asp:TextBox runat=server ID=txtUsdBalance Width=150 Enabled=false  CssClass=INPUTTEXT_CENTER ></asp:TextBox>
																	                        </td> 
																	                         <td align=center>
																	                            <%-- <asp:Button ID="btnTransferUSD" runat="server" CssClass="INPUTBUTTON" 
                                                                                                     Height="25" Text="Transfer to USD MAIN Balance" OnClientClick = "return confirm('Are you sure you want to transfer all USDs to MAIN USD balance ?')" Width="200" />--%>
                                                                                            </td> 
																	                    </tr>
																	                    
																	                    <tr>
																	                        <td class=head10>
																	                            EUR to BTC
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                             <asp:TextBox runat=server ID=txtUsdAmountToExchange onclientclick="Redisplay()" AutoPostBack=true Width=150 CssClass=INPUTTEXT_CENTER ></asp:TextBox>
																	                        </td> 
																	                        
																	                         <td width=10>
																	                           <asp:Button runat=server ID=btnExchangeUSDtoBTC onclientclick="Redisplay()" Width=200 Height=25 CssClass=INPUTBUTTON_Buy Text="BUY BTC"></asp:button>
																	                        </td> 
																	                        <td>
																	                            
																	                        </td> 
																	                         <td>
																	                            <asp:Label runat=server ID="lblUsdMess" CssClass=RednormalText></asp:Label>
																	                        </td> 
																	                          
																	                             
																	                    </tr>
																	                    
																	                    
																	                     <tr>
																	                        <td >
																	                            
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                            
																	                               
                                                                                                    
                                                                                          
                                                                                                    <asp:Label ID="lblUsdToBtcValue" CssClass=RednormalTextBold runat="server"/>
                                                                                            
																	                            </td> 
																	                        
																	                         <td width=10 align=center>
																	                           
																	                          <%-- <asp:Label runat=server ID=lblBtcUsdBid Enabled=false CssClass=RednormalText ></asp:Label>
																	                           --%>
																	                        </td> 
																	                        <td>
																	                            
																	                        </td> 
																	                        
																	                        <td>
																	                           
																	                             
																	                             
																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                    
																	                </table>
																	          
															                  </TD>
															             
															              
																	      </tr>
																	      
																	           <tr>
																	          <td height=30>
															                      
															                  </TD>
																	      </tr>
																	      
																	      
																	        <tr>
            													       
            													      
																	          <td>
																	          
																	                <table>
																	                    <tr>
																	                    
																	                     
																	                        <td class=head10>
																	                            BTC Balance
																	                        </td> 
																	                         <td width=10>
																	                           
																	                        </td> 
																	                        <td>
																	                           <asp:TextBox runat=server ID=txtBtcBalance Width=150 Enabled=false CssClass=INPUTTEXT_CENTER ></asp:TextBox>
																	                        </td> 
																	                        
																	                          <td align=center>
																	                          <%-- <asp:Button runat=server ID=btnTransferBTC  Width=200 Height=25 OnClientClick = "return confirm('Are you sure you want to transfer all bitcoins to MAIN BTC balance ?')" CssClass=INPUTBUTTON Text="Transfer to BTC MAIN Balance"></asp:button>--%>
																	                        </td> 
																	                    </tr>
																	                    
																	                    <tr>
																	                        <td class=head10>
																	                            BTC to EUR
																	                        </td> 
																	                         <td width=10>
																	                            
																	                        </td> 
																	                        <td>
																	                              <asp:TextBox ID="txtBtcAmountToExchange" onclientclick="Redisplay()" CssClass=INPUTTEXT_CENTER AutoPostBack=true OnTextChanged="txtBtcAmountToExchange_TextChanged" MaxLength=9 ClientIDMode="Static" Width=150 runat="server"></asp:TextBox>
																	                        </td> 
																	                        
																	                         <td width=10>
																	                            <asp:Button runat=server ID=btnExchangeToUSD  Width=200 Height=25 onclientclick="Redisplay()" CssClass=INPUTBUTTON_SELL Text="SELL BTC"></asp:button>
																	                        </td> 
																	                        <td>
																	                        </td> 
																	                        <td>
																	                             <asp:Label runat=server ID="lblBtcMess" CssClass=RednormalText></asp:Label>
																	                        </td> 
																	                        
																	                        <td height=10 width=10>
																	                        </td>
																	                        
																	                    </tr>
																	                    
																	                    
																	                     <tr>
																	                        <td >
																	                            
																	                        </td> 
																	                         <td width=10>
																	                          
																	                        </td> 
																	                        <td height=20>
																	                            
                                                                                               <%-- <anthem:Label ID="lblBtcToUsdValue" AutoUpdateAfterCallBack=true CssClass=RednormalTextBold runat="server"></anthem:Label>--%>
                                                                                                
                                                                                                     
                                                                                                    
                                                                                        
                                                                                                    <asp:Label ID="lblBtcToUsdValue" CssClass=RednormalTextBold runat="server"/>
                                                                                              

																	                            
																	                            </td> 
																	                        
																	                         <td width=10 align=center>
																	                        </td> 
																	                        <td>
																	                            
																	                        </td> 
																	                        
																	                        <td>
																	                           
																	                             
																	                             
																	                        </td> 
																	                        
																	                    </tr>
																	                    
																	                </table>
																	          
															                  </TD>
															             
															              
																	      </tr>
																	      
																	      
																	      
																	            
																	            </table>
																	            
																	            
																	            </td>
																	            
																	             <td>
																	            
																	            </td>
																	        </tr>    
																	        
																	        
																	        </table>
																	        
															                  </TD>
																	      </tr>
																	      
																	      
																	      
            													     
                                                                        
																	     </table>
																		
																		
																	</TD>
																	
																	
														
																</TR>
																
																<tr>
																    <td height=10>
																        
															                     
															                
																    </td>
																     <td align=center>
																      <asp:label runat=server id="lblMess" cssclass=rednormaltext></asp:label>
																     </td>
																 </TR>   
																
																<tr>
																    <td height=40>
																        
															                     
															                
																    </td>
																     <td align=center>
																      <img id="loading" />
																     </td>
																 </TR>    
																
																<tr>
																    <td>
																        
																    </td>
																     <td align=center>
																     
								
								   
                                 <%--              <asp:scriptmanager runat="server"  ID="ScriptManager1"></asp:scriptmanager>                                                     
                                  <asp:UpdatePanel runat="server" id="UpdatePanel1" ChildrenAsTriggers="false" updatemode="Conditional">
                                    <ContentTemplate>
                                				        
							           <asp:Timer ID="Timer1" runat="server" OnTick="BindGridView" Interval="1000" />		 --%>
																        
              <asp:GridView ID="grdExchange" runat="server" SkinID=grdTrans AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=800 emptydatatext="You have no buy/sell transactions">
                         <Columns>
                                 
                            <asp:TemplateField HeaderText="Exchange ID" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID0" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                              <asp:TemplateField HeaderText="EUR Balance" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="MainUsdBalance" runat="server" Text='<%# Bind("MainUsdBalance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="MainUsdBalance" runat="server" 
                                        Text='<%# Bind("MainUsdBalance") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="BTC Balance" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="MainBtcBalance" runat="server" Text='<%# Bind("MainBtcBalance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="MainBtcBalance" runat="server" 
                                        Text='<%# Bind("MainBtcBalance") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                              <asp:TemplateField HeaderText="EUR to pay" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="UsdAmountToBtc" runat="server" Text='<%# Bind("UsdAmountToBtc") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UsdAmountToBtc0" runat="server" Text='<%# Bind("UsdAmountToBtc") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                  <asp:TemplateField HeaderText="BTC to get" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="BtcAmountReserved" runat="server" text='<%# Bind("BtcAmountReserved") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="BtcAmountReserved0" runat="server" 
                                        checked='<%# Bind("BtcAmountReserved") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 <asp:TemplateField HeaderText="BTC to pay" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="BtcAmountToUsd" runat="server" Text='<%# Bind("BtcAmountToUsd") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BtcAmountToUsd0" runat="server" 
                                        Text='<%# Bind("BtcAmountToUsd") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="EUR to get" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="EurAmountReserved" runat="server" text='<%# Bind("EurAmountReserved") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="EurAmountReserved0" runat="server" 
                                        checked='<%# Bind("EurAmountReserved") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                          
                            
                                  
                            <asp:TemplateField HeaderText="Date Exchange" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="DateRequest" runat="server" Text='<%# Bind("DateRequest") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateRequest0" runat="server" Text='<%# Bind("DateRequest") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                           
                            <asp:TemplateField HeaderText="BTCEUR" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="BTCEUR" runat="server" text='<%# Bind("BTCEUR") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="BTCEUR0" runat="server" checked='<%# Bind("BTCEUR") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                           
                            
                             <asp:TemplateField HeaderText="Executed" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="DoneByAdmin" runat="server" text='<%# Bind("DoneByAdmin") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="DoneByAdmin0" runat="server" 
                                        checked='<%# Bind("DoneByAdmin") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                               
                         </Columns>
                                                
               
        
                        </asp:GridView>
                        
                        
                         <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [InternalExchangeRequests] order by ID desc" UpdateCommand="update InternalExchangeRequests set UserID=? where ID=?" DeleteCommand="delete from InternalExchangeRequests where ID=?"  >
                     </asp:AccessDataSource>
                     
                     
                     <%--  </ContentTemplate>

                   <Triggers>

<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />

</Triggers>

                    </asp:UpdatePanel>--%>
																        
																            
																        
																    </td>

                                                                     <tr>
                                                                         <td>
                                                                   
                                                                            </td>
                                                                         <td height="40" >
                                                                   

                                                                            </td>

                                                                    </tr>

                                                                      <tr>
                                                                         <td>
                                                                   
                                                                            </td>
                                                                         <td align="center">
                                                                    
                                                                             <div align="center">
                                                                           <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
                                                                                 </div>

                                                                            </td>

                                                                    </tr>




                                                                    <tr>
                                                                         <td>
                                                                   
                                                                            </td>
                                                                         <td align="center">
                                                                    
                                                                             <div align="center">
                                                                          <script type="text/javascript">
	atOptions = {
		'key' : '10b7f767e2a3a6373ac4b54d0ba8bef4',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
	document.write('<scr' + 'ipt type="text/javascript" src="http' + (location.protocol === 'https:' ? 's' : '') + '://www.hiprofitnetworks.com/10b7f767e2a3a6373ac4b54d0ba8bef4/invoke.js"></scr' + 'ipt>');
</script>
                                                                                 </div>

                                                                            </td>

                                                                    </tr>

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
