<%@ Page Language="VB" AutoEventWireup="false" CodeFile="statistics.aspx.vb" Inherits="FXAS_statistics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table >
                        <tr>
                            <td width=200>
                                Currency</td>
                            <td>
                                <asp:DropDownList Width=150 ID="ddCurrency" runat="server">
                                <asp:ListItem Value="EURUSD">EURUSD</asp:ListItem>
                                <asp:ListItem Value="GBPUSD">GBPUSD</asp:ListItem>
                                <asp:ListItem Value="NZDUSD">NZDUSD</asp:ListItem>
                                <asp:ListItem Value="USDCAD">USDCAD</asp:ListItem>
                                <asp:ListItem Value="GBPJPY">GBPJPY</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="125px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
