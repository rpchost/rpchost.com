<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PayeeDetail.aspx.vb" Inherits="PayeeDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
  
    
      <table>
        	                 
        	                 
        	                 
        	                 <TR>
														<TD Width=180>&nbsp;
															<asp:label id="Label11" runat="server" CssClass=BlackTextBold >User ID</asp:label></TD>
														<TD height=30>
														
														<asp:label id="lblUserID" runat="server" CssClass=BlackTextBold ></asp:label>
														
															</TD>
														<TD style="WIDTH: 5px; HEIGHT: 31px">
															</TD>
													</TR>
													
													
        	                   <TR>
														<TD Width=180>&nbsp;
															</TD>
														<TD height=30>
															&nbsp;</TD>
														<TD style="WIDTH: 5px; HEIGHT: 31px">
															&nbsp;</TD>
													</TR>
													
													
        	                 <TR>
														<TD Width=180>&nbsp;
															<asp:label id="Label1" runat="server" CssClass="BlackTextBold" >First name</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtFirst" Width="200px" Enabled=false CssClass="INPUTTEXT" Runat="server" MaxLength=50></asp:textbox></TD>
														<TD style="WIDTH: 5px; HEIGHT: 31px">
															&nbsp;</TD>
													</TR>
													
													
													
													
													
													<TR>
														<TD class="style2">&nbsp;
															<asp:label id="Label2" runat="server" CssClass="BlackTextBold">Last name</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtLast" Width="200px" Enabled=false CssClass="INPUTTEXT" Runat="server" MaxLength=50> </asp:textbox></TD>
														<TD style="WIDTH: 5px; HEIGHT: 31px">
															&nbsp;</TD>
													</TR>
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="Label3" runat="server" CssClass="BlackTextBold">Email</asp:label> </TD>
														<TD height=30>
															<asp:textbox id="txtEmail" Width="200px" Enabled=false CssClass="INPUTTEXT" Runat="server" MaxLength=50></asp:textbox>
															
															</TD>
														<TD style="WIDTH: 5px">
															&nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style4">&nbsp;
															<asp:Label id="Label5" runat="server" CssClass="BlackTextBold">Country</asp:Label></TD>
														<TD height=30>
															
															
															<asp:textbox id="txtCountry"  Width="200px" Enabled=false 
                                                                ToolTip="Password must not contain spaces; Alphnumeric characters allowed; minimum 6 characters; maximum 10 characters" 
                                                                CssClass="INPUTTEXT" Runat="server" MaxLength="10"></asp:textbox>
															
															</TD>
														<TD style="WIDTH: 5px; HEIGHT: 30px">
														    &nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style6">&nbsp;
															<asp:label id="Label8" runat="server" CssClass="BlackTextBold">Password</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtPass"  Width="200px" Enabled=false ToolTip="Password must not contain spaces; Alphnumeric characters allowed; minimum 6 characters; maximum 10 characters" CssClass="INPUTTEXT" Runat="server" MaxLength="10"></asp:textbox>
															
															</TD>
														<TD style="WIDTH: 5px; HEIGHT: 36px">
															&nbsp;</TD>
													</TR>
													
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="Label10" runat="server" CssClass="BlackTextBold">Phone</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtPhoneCode" Enabled=false Width="70" CssClass="INPUTTEXT" Runat="server" MaxLength="30"></asp:textbox><asp:textbox id="txtPhone" Enabled=false Width="150" CssClass="INPUTTEXT" Runat="server" MaxLength="30"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblRegisterDate" runat="server" CssClass="BlackTextBold">Register Date</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtRegisterDate" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="30"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													
														<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblWallet" runat="server" CssClass="BlackTextBold">Bitcoin Wallet</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtWallet" Enabled=false Width="330" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													
														<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblBankName" runat="server" CssClass="BlackTextBold">Bank Name</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtBankName" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblIBAN" runat="server" CssClass="BlackTextBold">IBAN</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtIBAN" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblBankAddress" runat="server" CssClass="BlackTextBold">Bank Address</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtBankAddress" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblBankCountry" runat="server" CssClass="BlackTextBold">Bank Country</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtBankCountry" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblSwift" runat="server" CssClass="BlackTextBold">Swift</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtSwift" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="lblBankHolderName" runat="server" CssClass="BlackTextBold">BankHolderName</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtBankHolderName" Enabled=false Width="200px" CssClass="INPUTTEXT" Runat="server" MaxLength="100"></asp:textbox></TD>
														<TD >
														    &nbsp;</TD>
													</TR>
													
													
													
													
													
													<TR>
														<TD class="style7">&nbsp;
															
														<TD height=30>
															
															
															</TD>
														<TD >
															
															
														</TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															
														<TD height=30>
															
															
															</TD>
														<TD >
															 <input type="button" value="<< BACK " onclick="history.go(-1);return false;">
															<asp:Button id="btnVerification" runat="server" Text="Go to Verification"  CssClass="INPUTBUTTON" ></asp:Button>
														</TD>
													</TR>
													
													
													
        	                 </table>
        	                 
    </form>
</body>
</html>
