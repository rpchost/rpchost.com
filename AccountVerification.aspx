<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountVerification.aspx.vb" Inherits="AccountVerification" %>

<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
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
		
		
<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>

<script type="text/javascript">


    function Redisplay() {
        document.getElementById("loading").src = "picture/loading2.gif"
    }

    </script>
    
    
		<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
            .auto-style1 {
                width: 178px;
            }
        </style>

		<script language="javascript" >

	function ClientValidate(sender, args)     
    {
        if (args.Value == "0" || args.Value == "-1")
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }



        </script>
    
    
	    </HEAD>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="0">
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
											<TD align=left bgcolor="#3366cc">
												<uc4:right runat="server" id="headerbutton"></uc4:right>
											</TD>
										</TR>
										
										<TR><td height=1></td></tr>
										
										<TR>
														<td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		 <asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																	
																	
																	</td>
													</TR>
													
									</TABLE>
								</td>
							</tr>
							<tr>
																	<td class="head05" height=60 width="100%" colspan=3 align=center>
																	           
        																	         ACCOUNT VERIFICATION </TD>
																	              
															                  </TD>
																</tr>
							<tr>
								<td align="center" colSpan="4"  width="100%">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
										<tr>
											<td>
												<!-- Content goes here -->
												<TABLE WIDTH="100%" BORDER="0" CELLSPACING="00" CELLPADDING="0">
												
													<TR>
														<TD  colspan=3 align=center   class="head06">
														  &nbsp;</TD>
													</TR>
													
													<TR>
														<TD height=20 >
														  
														</TD>
													</TR>
													
														<TR>
														<TD   height=20 class=head01_9 align=center>
														    We know it is annoying , but we promise it will take 5 minutes to get verified. it is very important to secure your accounts and to stop any fraudulant payment</TD>
													</TR>
													
													<TR>
														<TD   height=50 align=center>
														 <asp:Label runat=server ID=lblVerMess></asp:Label>
														</TD>
													</TR>
													
													<TR>
														<TD colspan=3 align=center>
														
														<table>
														<TR>
														<TD width=30>
														    	
														</TD>
														<TD>
														    <asp:label id="Label29" runat="server" CssClass="head09">Upload only 1 Document</asp:label>	
														</TD>
														<TD>
														    <input id="MyFile" class="inputbutton" type="file" size="50" name="File1" runat="server" />
																
														</TD>
														
														
														
														
														<TD class="auto-style1">
														    <%--<asp:Image ID="Image2" ToolTip="Please take a picture of your valid (Passport or Identity) near to it your credit card that you will use to buy bitcoin and near to it a small Note" imageUrl ="picture/exclamation.jpg" runat=server  />
															<a href= "#" onclick="window.open('picture/Verification_.jpg','_blank')" class="bluesmalltext8" > [See an Example]</a>--%>
														</TD>
														
														<TD width=30>
														   
														</TD>
														
														<TD align=center>
														    
															
															
														</TD>
													</TR>
													
													
													
													<TR>
														
														<TD colspan=6 align=center height=30>
														    
															<asp:Label runat=server ID=lblVerificationMessage CssClass="greentext"></asp:Label>
															
														</TD>
													</TR>
													
														
														</table>
															
														
															
															
															
														
														
													</TR>
													
													<TR>
														<TD  colspan=3><hr />
															
															
														</TD>
													</TR>
													
													<TR>
														<TD  colspan=3 class=head01_9 align=center>
															
															<span class=RednormalText>
															
															<b><strong>To get verified in less then 5 minutes, we only need 1 document and be sure you do the following</a></strong> </b> <br />
                                                            <br />
                                                            1 - Take a clear photo of your Passport or National Identity; Edges appear clearly and not photoshoped. <u>(Only .Pdf, .Jpg, .Gif)</u><br />
                                                            <br />
                                                                                                                        2 - Make sure your Name on your Passport/Identity is the same in 
                                                            your profile section<br />
                                                                                                                        <br />
                                                           
                                                            3 - Make sure all your document data is VALID CLEAR READABLE</TD>
													</TR>
													
													
														<TR>
														<TD   height=20 align=center>
														   <%--<a href= "#" onclick="window.open('picture/Verification_.jpg','_blank')" class="bluesmalltext8" > [See an Example]</a>--%>
														</TD>
													</TR>
													
													
													
													
													
													<TR>
														<TD  colspan=3>
														    <hr />
														</TD>
													</TR>
															
															<TR>
														<TD  align=center>
														 <img id="loading" />
													
														</TD>
														
													</TR>	
																									
															<TR>
														<TD height="80" colspan=3  align=center>
														
														<asp:Button id="btnSubmit" CssClass=INPUTBUTTON Runat="server" Text="Send for verification" 
                                                                Width="200" Height=50 onclientclick="Redisplay()"></asp:Button>
														</TD>
														
													</TR>	
													
													
													
													
													
													<TR>
														<TD  align=center colspan=2>
														
														<asp:Label runat=server ID=lblMess CssClass=RednormalTextBold></asp:Label>
														</TD>
														
													</TR>	
                                                    

                                                     <tr>
                                                                        
                                                                         <td align="center" width=100% colspan=2>
                                                                    
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

													
												</TABLE> <!-- End Content -->
											</td>
										</tr>
										
										 
										
										
									</TABLE>
								</td>
							</tr>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			</TD></TR></TABLE>
		</form> </TD></TR>
		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
	</body>
</HTML>
