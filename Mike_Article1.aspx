<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Mike_Article1.aspx.vb" Inherits="Mike_Article1" %>

<%@ Register TagPrefix="uc1" TagName="right" Src="headers/Mikerightheader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Mike Chalhoub, Sport reporting and journalism</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <table bordercolor="#000000" height="100%" cellspacing="0" cellpadding="0" width="100%"
        align="center" border="1">
        <tr>
            <td width="100%" colspan="3">
                <!--#include file = "headers/Mikeupperheader.htm"-->
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td valign="top" height="100%">
                <table cellspacing="0" cellpadding="0" height="100%">
                    <tr>
                        <td>
                            <uc1:right runat="server" ID="RightHeader"></uc1:right>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="100%" height="100%">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td height="2">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="4">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0" height="100%">
                                <tr>
                                    <td valign="top">
                                        <!-- Content goes here -->
                                        
                                                <!--#include file = "Article1.htm"-->
                                        
                                        <!-- End Content -->
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </TD> </TR> </TABLE>
    </form>
    </TD> </TR>
    <!-- Start of eWebCounter Code -->

    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>

    <script type="text/javascript" src="eWebCounter.js"></script>

    <!-- End of eWebCounter Code -->
</body>
</html>
