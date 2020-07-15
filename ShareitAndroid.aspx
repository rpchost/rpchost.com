<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShareitAndroid.aspx.vb" Inherits="ShareitAndroid" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

<link rel="stylesheet" type="text/css" href="StyleSheet.css" />

    <title></title>
</head>
<body topmargin=0 leftmargin=0>
    <form id="form1" runat="server">
   	<!-- Content goes here -->
												<TABLE WIDTH="100%" height=100% BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor=black>
												
												
													<%--<TR>
														<TD  colspan=3 height=30 valign=bottom align=center>
															&nbsp;&nbsp;
															<asp:label id="lblMess" runat="server" CssClass=WhiteText><font face=arial color=red> THIS MEMBERSHIP IS FOR 12 MONTHS. $75 / YEAR <br> PAYMENT METHOD IS HIGHLY SECURED  </font></asp:label></TD>
														
													</TR>--%>
													
														<TR>
														<TD  colspan=3 height=30 valign=bottom>
														
														<iframe src="https://secure.shareit.com/shareit/checkout.html?PRODUCT[300614914]=1&ADD[300614914][ANDROIDID]=<%=Request.querystring("AndroidID") %>&COMPANY=<%=Request.querystring("AndroidID") %>&FIRSTNAME=<%=strFName %>&LASTNAME=<%=strLName %>&EMAIL=<%=strEmail %>&EMAIL_CONFIRM=<%=strEmail%>&D_COUNTRY_ID=<%=strCountryID %>&D_CITY=<%=strCountry%>&D_STREET1=<%=strCountry%>&D_CITY=<%=strCity%>&D_POSTALCODE=<%=strPostalCode%>&D_POSTALCODE=10111&PAYMENTTYPE_ID=CCA&languageid=1&js=-1" height="300" width="100%" scrolling="auto" frameborder="no"></iframe>
														
														</td>	
													</TR>
												
													
																									
													
												</TABLE> <!-- End Content -->
    </form>
</body>
</html>
