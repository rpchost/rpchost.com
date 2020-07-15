<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OrderPageAndroid.aspx.vb" Inherits="OrderPageAndroid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

<link rel="stylesheet" type="text/css" href="StyleSheet.css" />

    <title></title>
</head>
<body topmargin=0 leftmargin=0 bgcolor=black>
    <form id="form1" runat="server">
   	<!-- Content goes here -->
												<TABLE WIDTH="100%" height=100% BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor=black>
												
												
												
													
													
													
													
													
													<TR>
														<TD align=left>&nbsp;
															<asp:label id="Label6" runat="server" CssClass="WhiteText">USERID</asp:label></TD>
															<TD align=left >
															<asp:label id="lblUserID" runat="server" CssClass="WhiteText"></asp:label></TD>
														
													</TR>
													
													
													<TR>
														<TD align=left>&nbsp;
															<asp:label id="Label8" runat="server" CssClass="WhiteText">PASSWORD</asp:label></TD>
															<TD align=left>
															<asp:label id="lblPwd" runat="server" CssClass="WhiteText"></asp:label></TD>
														
													</TR>
													
													<TR>
														<TD  colspan=2 class=GreenText height=50>
														
														&nbsp;Save this USERID and PASSWORD in a safe place so you can access signals
														online; Login page at : http://www.rpchost.com/Login.aspx <br><br>
														
														
														</TD>
													</TR>
													
													
													
													
													<TR>
														<TD align=left>&nbsp;
															<asp:label id="Label4" runat="server" CssClass =WhiteText></asp:label></TD>
															
															<TD align=left>
															<asp:label id="lblDeviceID" runat="server" CssClass =WhiteText></asp:label></TD>
													
													</TR>
													
													
													<TR>
														<TD align=left>&nbsp;
														
															<asp:label id="Label1" runat="server" CssClass="WhiteText">FIRST NAME</asp:label></TD>
															<TD align=left><asp:label id="lblFName" runat="server" CssClass="WhiteText"></asp:label>
                                                        </TD>
														</TR>
													<TR>
														<TD align=left>&nbsp;
															<asp:label id="Label2" runat="server" CssClass="WhiteText">LAST NAME</asp:label></TD>
															<TD align=left ><asp:label id="lblLName" runat="server" CssClass="WhiteText"></asp:label></TD>
														</TR>
													<TR>
														<TD align=left>&nbsp;
															<asp:label id="Label3" runat="server" CssClass="WhiteText">EMAIL</asp:label></TD>
															<TD align=left>
															<asp:label id="lblEmail" runat="server" CssClass="WhiteText"></asp:label></TD>
													</TR>
												
													<TR>
														<TD align=left>&nbsp;
															<asp:Label id="Label5" runat="server" CssClass="WhiteText">COUNTRY</asp:Label></TD>
															<TD align=left>
															<asp:Label id="lblCountry" runat="server" CssClass="WhiteText"></asp:Label></TD>
													
													</TR>
													
													<TR>
														<TD align=left>&nbsp;
															<asp:Label id="Label9" runat="server" CssClass="WhiteText">CITY</asp:Label></TD>
															<TD align=left>
															<asp:Label id="lblCity" runat="server" CssClass="WhiteText"></asp:Label></TD>
													
													</TR>
													
														<TR>
														<TD align=left>&nbsp;
															<asp:Label id="Label10" runat="server" CssClass="WhiteText">Postal Code</asp:Label></TD>
															<TD align=left>
															<asp:Label id="lblPostalCode" runat="server" CssClass="WhiteText"></asp:Label></TD>
													
													</TR>
													
													
														<TR>
														<TD align=left>&nbsp;
															<asp:Label id="Label7" runat="server" CssClass="WhiteText">COUNTRYID</asp:Label></TD>
															<TD align=left>
															<asp:Label id="lblCountryID" runat="server" CssClass="WhiteText"></asp:Label></TD>
													
													</TR>
													
													
												   </TR>
														<TR>
														<TD align=left colspan=2 height=40>&nbsp;
                                                            
                                                           <%-- <asp:Button ID="Button2" Width=250 Height=30 runat="server" Text="Data correct. Take me to payment page" />--%>
                                                            
														</TD>
															
															
													
													</TR>
													
													</TR>
														<TR>
														<TD align=left colspan=2>&nbsp;
                                                            <%--<asp:Button ID="btnBack" Width=250 Height=30 runat="server" Text="Data Incorrect. Reset Data" /> --%>
														</TD>
															
														
													
													</TR>
													
													
													
													
												
													
													
												
													
																									
													
												</TABLE> <!-- End Content -->
    </form>
</body>
</html>

