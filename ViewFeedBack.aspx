<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewFeedBack.aspx.vb" Inherits="ViewFeedBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VIEW ALL FEEDBACKS</title>
    
    <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
    
</head>
<body>
    <form id="form1" runat="server">

        <table>
            <tr>
                <td>
                    
                    <asp:GridView CssClass=BlackSmallText8 ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="AccessDataSource1" Width="472px">
                        <Columns>
                            <asp:BoundField DataField="IndicatorMessages" HeaderText="FeedBack" 
                                SortExpression="IndicatorMessages" />
                            <asp:BoundField DataField="dtDate" HeaderStyle-Width=60 HeaderText="Date" 
                                SortExpression="dtDate" >
<HeaderStyle Width="60px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                SortExpression="UserID"  HeaderStyle-Width=40>
<HeaderStyle Width="40px"></HeaderStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/DB/db_maindata.mdb" 
                        SelectCommand="SELECT [IndicatorMessages], [dtDate], [UserID] FROM [indMess]">
                    </asp:AccessDataSource>
                    
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
