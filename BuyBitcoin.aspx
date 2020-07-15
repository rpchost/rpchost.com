<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" EnableViewState="false" CodeFile="BuyBitcoin.aspx.vb" Inherits="BuyBitcoin" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
		<head id="Head1" runat="server">
		
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
   <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131430617-1"></script>

   	<script type="text/javascript">
   	    function Redisplay() {
   	        document.getElementById("loading").src = "picture/loading.gif"
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
																	          <td class="head05" width="100%" align=center>
																	           
        																	          DEPOSIT</TD>
																	      </tr>
																	      
																	   
                                                                            <tr>
																	          <td  height=50 align=center>
																	           
        																	        <img  id="loading"  >
																	              
															                  </TD>
																	      </tr>
																	      
																	      
																	      <%-- <TR>
																	            
																	                <TD align=center class=head06>
																	                    HISTORY
																	                </TD>
																	                
																	            </TR>
																	            
																	            <TR>
																	            
																	                <TD height=10>
																	                    
																	                </TD>
																	                
																	            </TR>--%>
																	            
																	             <TR>
																	            
																	                <TD align=center>
																	                
                                                                                               <asp:GridView ID="grdHistory" SkinID=grdTrans  runat="server" emptydatatext="You have no Deposits in your list" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7"  AutoGenerateColumns="False"  DataSourceID="AccessDataSource1" Width=800 >
                                                                                                                 <Columns>
                                                                                                                 
                                                                                                               
                                                                                                               
                                                                                                                <asp:TemplateField HeaderText="Deposit ID"  ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" Width=40 runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
            
                                                                                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="AmountUSD"  runat="server" Text='<%# Bind("AmountUSD") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                           <asp:BoundField DataField="Currency" HeaderText="Currency"
                                                                                                                          SortExpression="Currency" ItemStyle-HorizontalAlign=Center HeaderStyle-Width=10 ItemStyle-Width=10/>
                                                                                                                          
                                                                                                                     <asp:BoundField DataField="AmountBTC"  HeaderText="Amount BTC" ItemStyle-HorizontalAlign=Center SortExpression="Amount BTC" />
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="BUY_Price" ItemStyle-HorizontalAlign=Center visible=false HeaderText="Ask Price" 
                                                                                                                         SortExpression="BUY_Price" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="SELL_Price" ItemStyle-HorizontalAlign=Center visible=false HeaderText="Bid Price" 
                                                                                                                         SortExpression="SELL_Price" />
                                                                                                                         
                                                                                                                           <asp:BoundField DataField="dtDatePayment" ItemStyle-HorizontalAlign=Center ItemStyle-Width=110 HeaderText="Deposit Date" 
                                                                                                                         SortExpression="dtDatePayment" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="BtcAddress" visible=false ItemStyle-HorizontalAlign=Center HeaderText="BTC Address" 
                                                                                                                         SortExpression="BtcAddress" />
                                                                                                                         
                                                                                                                         
                                                                                                                          
                                                                                                                         <asp:TemplateField HeaderText="Deposit Method" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="PaymentMethod" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="WithDrawMethod" visible=false ItemStyle-HorizontalAlign=Center HeaderStyle-Width=90 HeaderText="Withdraw Method" 
                                                                                                                         SortExpression="WithDrawMethod" />
                                                                                                                         
                                                                                                                         
                                                                                                                             <asp:TemplateField HeaderText="Order type" visible=false ItemStyle-HorizontalAlign=Center HeaderStyle-Width=10 ItemStyle-VerticalAlign=Middle>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Ordertype" runat="server" Text='<%# Bind("Ordertype") %>'></asp:Label>
                                                                                                                                </ItemTemplate> 
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                            
                                                                                                                             <asp:TemplateField HeaderText="PassCode" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                     <asp:TextBox ID="ClientPassCode" Visible="false" TextMode="password"  width=60 CssClass=bluetext MaxLength=8  runat="server" Text='<%# Bind("ClientPassCode") %>'></asp:TextBox>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                             <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Status" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                          <%--  <asp:TemplateField HeaderText="Trace payment"  ItemStyle-HorizontalAlign=Center HeaderStyle-Width=10 >
                                                                                                                                <ItemTemplate>
                                                                                                                                <asp:HyperLink runat=server ID=lnkTrace  Text='Trace' Target=_blank NavigateUrl='<%# Bind("BlockChain") %>' ></asp:HyperLink>
                                                                                                                                   
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>--%>
                                                                                                                            
                                                                                                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                <asp:Button ID="btnConfirm" runat="server" Text="Confirm WU paid"
                                                                                                                                      CommandArgument="btnConfirm" OnClick="btnConfirm_Click"  cssClass=INPUTBUTTON />   
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign=Center ItemStyle-Width=10>
                                                                                                                                <ItemTemplate>
                                                                                                                                <asp:Button ID="btnConfirmOmt" runat="server" Text="OMTN"
                                                                                                                                      CommandArgument="btnConfirmOmt" OnClick="btnConfirmOmt_Click"  cssClass=INPUTBUTTON />   
                                                                                                                                </ItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                         
                                                                                                                         
                                                                                                                           <asp:TemplateField ItemStyle-HorizontalAlign=Center ItemStyle-Width=10>
                                                                                                                             <ItemTemplate>
                                                                                                                                    <asp:Button ID="btnPass" runat="server" Text="Validate PassCode"
                                                                                                                                      CommandArgument="btnPass" Visible="false" OnClick="btnPass_Click" onclientclick="Redisplay()" height=20 cssClass=INPUTBUTTON_10 />
                                                                                                                         
                                                                                                                           </ItemTemplate> 
                                                                                                                        </asp:TemplateField>
                                                                                                                        
                                                                                                                       
                                                                                                                        
                                                                                                                         
                                                                                                                          <asp:TemplateField ItemStyle-Height=22  ItemStyle-Width=10>
                                                                                                                        <ItemTemplate>
                                                                                                                        <asp:Button ID="Button1" runat="server" Text='Cancel'
                                                                                                                          CommandArgument="Button1" OnClick="Button1_Click"  cssClass=INPUTBUTTON_10 />
                                                                                                                         
                                                                                                                           </ItemTemplate> 
                                                                                                                        </asp:TemplateField>
                                                                                                                           
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server"  
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
																	                
																	                </TD>
																	                
																	            </TR>
																	            
																	      
																	      
																	      
																	      
																	        <tr>
																	          <td  height=20>
																	           
																	            
															                  </TD>
																	      </tr>
																	      
																	      
																	       <tr>
																	          <td align=center width="900">
																	           
																	                  <table border=1 bordercolor=black width="800" height=100>
																	          
																	          
																	          
																	                       
																	                        
																	                        
																	                        
																	                           <tr>
																	                          <td align=center height=10 colspan=3  >
                																	           
                																	          
                																	           
															                                      </TD>
															                                  
																	                        </tr>
																	                        
																	                       
																	                        
																	                        
																	                        
																	                         <tr>
																	                          <td align=center valign=top>
                																	           
                																	          
                																	           
                																	                 <asp:Button id="btnPayBankTransfer" runat="server" Text="Deposit with Bank Transfer" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	                 <br><br>
                																	           
                																	           <span class="head00_8_5">0% Fee</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblBnkPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                   <td align=center valign=top>
                																	           
                																	                  <asp:Button id="btnPayCreditCard" runat="server" Text="Deposit with Credit Card" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class=head00_8_5>
                																	           0% Fee
                																	          </span>
                																	           
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblCardPendingPaymnt CssClass="rednormaltextbold"></asp:Label>
                																	           
															                                  </TD>
															                                  
															                                  
															                                   
															                                    <td align=center valign=top>
                																	           
                																	                  <asp:Button id="btnPayRevolut" runat="server" Text="Deposit with REVOLUT" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class=head00_8_5>
                																	           0% Fee
                																	           </span>
                																	           
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblRevolutPendingPaymnt CssClass="rednormaltextbold"></asp:Label>
                																	           
															                                  </TD>
															                                  
																	                        </tr>
																	              
																	             <tr>
																	                          <td align=center height=10 colspan=3  >
                																	           
                																	          
                																	           
															                                  </TD>
															                                  
																	                        </tr>
																	            
																	                <tr>
																	                          <td align=center>
                																	           
                																	                 <asp:Button id="btnOmt" runat="server" Text="Deposit with OMT" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class="head00_8_5">0% Fee</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblOMTPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                   <td align=center valign=top>
                																	           
                																	                 <asp:Button id="btnWise" runat="server" Text="Deposit with TransferWise" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
															                                  
															                                    <br><br>
                																	           
                																	           <span class="head00_8_5">0% Fee</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblWisePendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                  
															                                   
															                                      <td align=center valign=top>
                																	           
															                                   
                																	           
                																	                 <asp:Button id="btnPayPerf" runat="server" Text="Deposit with PerfectMoney" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
                																	           
                																	                   <br><br>
                																	           
                																	           <span class="head00_8_5">1 to 4% [PerfecMoney fee]</span>&nbsp;
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblPMPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
																	                        </tr>
																	                        
																	                          <tr>
																	                          <td align=center height=10 colspan=3  >
                																	           
                																	          
                																	           
															                                      </TD>
															                                  
																	                        </tr>
																	                        
																	                        
																	                         <tr>
																	                          <td align=center valign=top>
                																	           
                																	                 <asp:Button id="btnCrypto" runat="server" Text="Deposit with Cryptocurrency" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class="head00_8_5">0% Fee</span>
                																	           <br>
                																	           
                																	           <br>
                																	           <asp:Label runat=server ID=lblCryptoPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
															                                  </TD>
															                                  
															                                   <td align=center valign=top>
                																	           
                																	               
															                                  
                                                                                                      
                																	                 <asp:Button id="btnBtc" runat="server" Text="Deposit with Bitcoin" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()" ></asp:Button>
															                                  
                																	           <br><br>
                																	           
                																	                 <span class="head00_8_5">0% Fee</span>
                																	                 
                																	                  
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblBtcPendingPaymnt CssClass="rednormaltextbold" ></asp:Label>
                																	           
                																	           </td>
															                                   
															                                       
                                                                                                    <td align=center valign=top>
                																	           
                																	                  <asp:Button id="btnPayMoneyGram" runat="server" Text="Deposit with WesterUnion" Width="280"  Height=43 CssClass="INPUTBUTTON" onclientclick="Redisplay()"></asp:Button>
                																	           
                																	           <br><br>
                																	           
                																	           <span class=head00_8_5>
                																	           0% Fee
                																	          </span>
                																	           
                																	           <br><br>
                																	           <asp:Label runat=server ID=lblWesterPendingPaymnt CssClass="rednormaltextbold"></asp:Label>
                																	           
															                                  </TD>


															                                  
																	                        </tr>
																	                        
																	                        
																	                        
																	                        
																	                        
																	      
																	             
																	                  </table>
																	           
															                  </TD>
																	            </tr>
																	            
																	          <%--  <TR>
																	            
																	                <TD align=center height=40>
																	                
																	                </TD>
																	                
																	            </TR>--%>
																	            
																	            
																	        <tr>
																	          <td  align=center class="head00_8_5">
																	           
																	           
																	              We accept deposits with the payment method you find it suitable for you 
																	              <br>
																	              
																	               <span class=RednormalText> <a href=contact.aspx title="Contact us" target="_blank"> Contact us 
                                                                                  to discuss your deposit </a> 
																	               
																	              
																	              </TD>
																	      </tr>
																	      
																	         
																	      
																	       <tr>
																	          <td  align=center class="head00_8_5">
																	           
																	           
																	       
                                                                                     
                                                                                  
															                  </TD>
																	      </tr>
																	    
																	      
																	     </table>
																		
																		
																	</TD>
																	
																	
														
																</TR>


                                                                    <tr>

                                                                         <td >
                                                                             </td>
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

                                                                         <td >
                                                                             </td>
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
