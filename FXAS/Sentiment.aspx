<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Sentiment.aspx.vb" Inherits="Sentiment" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
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
                    
                    Currency traders direction
                    
                </td>
            </tr>
            <tr>
                <td>
                    <table width=750>
                        <tr>
                            <td>
                            
                                <asp:Label ID="lblCurrencyStudy" runat="server" Text=""></asp:Label>
                                
                                </td>
                            <td>
                                &nbsp;</td>
                            <td>
    <asp:Chart ID="Chart1" runat="server"  Width="146px" Palette="None" 
        PaletteCustomColors="192, 0, 0; 0, 192, 0" >
        <Series>
            <asp:Series  Name="Series1" ChartType=Doughnut   XValueMember="0" 
                YValueMembers="1" ChartArea="ChartArea1" Color="255, 128, 128">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
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
