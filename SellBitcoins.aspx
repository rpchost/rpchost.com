<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SellBitcoins.aspx.vb" Inherits="SellBitcoins" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>


<HTML>
	<head>
	
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
   
   <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131430617-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-131430617-1');
</script>

	<script type="text/javascript">


	    function Redisplay() {
	        document.getElementById("loading").src = "picture/loading2.gif"
	    }

    </script>
   		
   		<title>Cryptocurrency trading | Buy and Sell Bitcoin | Online forex trading </title>
   		
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
		<META NAME="KEYWORDS" CONTENT="Sell, Cryptocurrency, Bitcoin">
		<META NAME="ABSTRACT" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<meta name="verify-admitad" content="2504a66eeb" />	


<style>
body {font-family: Arial, Helvetica, sans-serif;}

#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation */
.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}
</style>

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
																	           
        																	          SELL BITCOIN </TD>
																	              
															                  </TD>
																	      </tr>
																	      
																	     
																	      
                                                                          <tr>
																	          <td height=20>
        																	          
															                  </TD>
																	      </tr>
																	      
																	       <tr>
																	          <td align=center>
																	           
																	                  <table border=0>
																	          
																	          
																	        
																	            
																	              <tr> 
																	                <td  height=20 align=center>
																	                <asp:Label runat=server visible=false ID=lblStatus cssClass=RedTextBold></asp:Label>
																	                 
																	                </td>
																	            </tr>
																	            
																	            
																	             
																	            
																	              <tr> 
																	                <td height=10 align=center>
																	                
																	                <img id="loading" />
																	                
																	                </td>
																	            </tr>
																	            
																	             <%-- <tr> 
																	                <td align=center class=head07>
																	                     
																	                     <asp:Label runat=server ID=lblVerification CssClass=RednormalTextBold></asp:Label>
																	                  
																	                </td>
																	            </tr>--%>
																	            
																	            
																	            
																	              <tr> 
																	                <td align=center class=head06_small>
																	                   <asp:Label runat=server ID=lblAmountToPay>BTC amount to Sell</asp:Label>
																	                  
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtDepositAmount CssClass=INPUTTEXT_CENTER AutoPostBack=true Width=120 MaxLength=10 ></asp:TextBox>
																	               
																	                   
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	              <tr> 
																	                <td align=center>
																	                  <asp:Label runat=server ID=lblUsdAmountToGet cssclass=head06_small>Amount you get</asp:Label>
																	                   
																	                   <br>
																	                   
																	                   <asp:Label runat=server ID=lblAmountLimit cssclass=head00_7></asp:Label>
																	                </td>
																	            </tr>
																	            
																	              <tr> 
																	                <td align=center class=head07>
																	                
																	                    <asp:TextBox runat=server ID=txtUsdAmount CssClass=INPUTTEXT_CENTER AutoPostBack=true Width=120 MaxLength=20 ></asp:TextBox>
																	                 <asp:dropdownlist id="ddlCurrency" Width="80" AutoPostBack=true CssClass="inputtext" Runat="server">
										                                                    <asp:ListItem Value="EUR" Selected="True">EUR</asp:ListItem>
										                                                    <asp:ListItem Value="USD">USD</asp:ListItem>
																	                   </asp:dropdownlist>
																	                </td>
																	            </tr>
																	            
																	             
																	            
																	            
																	             <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center>
																	                  <asp:Label runat=server ID=Label1 cssclass=head06_small>Withdraw method</asp:Label>
																	                   
																	                  
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center class=head07>
																	                
																	                   <asp:dropdownlist id="ddlWithdraw" Width="200px" AutoPostBack=true CssClass="INPUTTEXT_CENTER" Runat="server">
										                                                 
																	                   </asp:dropdownlist>
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	             <tr> 
																	                <td height=20 >
																	                   
																	                </td>
																	            </tr>
																	            
																	            <tr> 
																	                <td height=20 class=RedTextBold align=center>
																	                 <asp:Label runat=server ID=lblPaypalEmail ></asp:Label>
																	                    
																	                </td>
																	            </tr>
																	            
																	            <tr> 
																	                <td height=20 class=RednormalText align=center>
																	                
																	                    Selected withdraw method data should be correct in your <a href=Profile.aspx target=_blank>profile</a> section for quick withdraw
																	                <br>
																	                You can cancel the transaction while it is in Pending mode
																	                 <br>
																	                 Press Reserve Transaction button to get a number that you use as unique ID when sending BTC to our wallet <a href= "#" onclick="window.open('picture/BtcSendExample.gif','_blank')" > [See an Example]</a>
																	                 <br>
																	                 <%--In case for any reason we fail to transfer money to your selected payment method we will refund you the Bitcoin minus Network fee (0.0003 btc)
																	                <br><br>--%>
																	                Whatever problem happen during selling process please <a href=contact.aspx title="Contact us" target=_blank>contact us</a>, 
                                                                                         we will fix it directly
																	                </td>
																	            </tr>
																	            																	            
																	             <tr> 
																	                <td height=5>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td align=center>
																	                
																	                   <asp:Button id="btnSubmit" runat="server" Text="Reserve Transaction" Width="300px" onclientclick="Redisplay()" Height=43 CssClass="INPUTBUTTON"></asp:Button>
																	                
																	                &nbsp;&nbsp;
																	                
																	                <asp:Button id="btnCancelPayment" runat="server" Text="Cancel transaction" Width="150px" onclientclick="Redisplay()" Enabled=false Height=43 CssClass="INPUTBUTTON"></asp:Button>
																	             
																	                </td>
																	            </tr>
																	            
																	            
																	             <tr> 
																	                <td height=10>
																	                
																	                
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	              <tr> 
																	                <td align=center >
																	                
																	                <asp:Label runat=server visible=false ID=lblQueueMsg cssClass=head06_small>Please send </asp:Label>
                                                                                   
																	                
																	                </td>
																	            </tr>
																	            
																	             <tr> 
																	                <td  align=center height=30>
																	                
																	               
																	                <asp:Label runat=server visible=false ID=lbldescNote cssClass=head06_small>  </asp:Label>
																	                
																	                </td>
																	            </tr>
																	            
																	            
																	             <tr> 
																	                <td align=center >
																	                

    
    </td>
    </tr>

    <tr> 
    <td align=center height=30>

                                   
<%--<img id="myImg" src="picture/BtcSendExample.gif" alt="Check this example" style="width:50;max-width:50px">--%>




<!-- The Modal -->
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<script>
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById('myImg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function() {
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
</script>


																	                </td>
																	            </tr>
																	            
																	             
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
