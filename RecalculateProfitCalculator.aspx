<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RecalculateProfitCalculator.aspx.vb" Inherits="RecalculateProfitCalculator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>



<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<body>
    <form id="form1" runat="server">
    <table width=100%>
      
      
        <tr>
        <td height=70 align=center class=head09>
            
        Recalculate Profit Plans
        
        </td>
        </tr>
        
        
         <tr>
        <td height=70  class=head09>
            
        Starter Plan
        
        </td>
        </tr>
        
          <tr>
            <td>

                            <asp:GridView ID="grdStarterPlan" runat="server" AutoGenerateColumns="False" skinID = grdTimesheet
                            DataSourceID="AccessDataSource1" Width=100% >
                            <Columns>
                            <asp:BoundField DataField="Plan" HeaderText="Plan"
                            SortExpression="Plan" ItemStyle-HorizontalAlign=Center />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign=Center
                            SortExpression="Amount" />
                            <asp:BoundField DataField="MonthProfit" HeaderText="MonthProfit"  ItemStyle-HorizontalAlign=Center
                            SortExpression="MonthProfit" />


                            <asp:BoundField DataField="InterestRate" ItemStyle-HorizontalAlign=Center HeaderText="InterestRate" 
                            SortExpression="InterestRate" />

                            <asp:BoundField DataField="Investment" ItemStyle-HorizontalAlign=Center HeaderText="Investment" 
                            SortExpression="Investment" />
                          

                            </Columns>
                            </asp:GridView>
                            <asp:AccessDataSource ID="AccessDataSource1" runat="server"  SelectCommand="Select * From ProfitCalculator where plan=100"
                            DataFile="~/DB/db_maindata.mdb" >
                            </asp:AccessDataSource>
            
            </td>
            
            
        </tr>
        
        
        <tr>
        <td height=70>
            
        
        
        </td>
        </tr>
        
        <tr>
        <td>
            
            <asp:Button id="btnRecalculate100" runat="server" Text="Recalculate Starter Plan" Width="220px" Height=43 CssClass="INPUTBUTTON"></asp:Button>
        
        </td>
        </tr>
        
          <tr>
        <td height=70  class=head09>
            
        <hr />
        
        </td>
        </tr>
        
        <tr>
        <td height=70  class=head09>
            
        PRO Plan
        
        </td>
        </tr>
        
          <tr>
            <td>

                            <asp:GridView ID="grdProPlan" runat="server" AutoGenerateColumns="False" skinID = grdTimesheet
                            DataSourceID="AccessDataSource2" Width=100% >
                            <Columns>
                            <asp:BoundField DataField="Plan" HeaderText="Plan"
                            SortExpression="Plan" ItemStyle-HorizontalAlign=Center />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign=Center
                            SortExpression="Amount" />
                            <asp:BoundField DataField="MonthProfit" HeaderText="MonthProfit"  ItemStyle-HorizontalAlign=Center
                            SortExpression="MonthProfit" />


                            <asp:BoundField DataField="InterestRate" ItemStyle-HorizontalAlign=Center HeaderText="InterestRate" 
                            SortExpression="InterestRate" />

                            <asp:BoundField DataField="Investment" ItemStyle-HorizontalAlign=Center HeaderText="Investment" 
                            SortExpression="Investment" />
                          

                            </Columns>
                            </asp:GridView>
                            <asp:AccessDataSource ID="AccessDataSource2" runat="server"  SelectCommand="Select * From ProfitCalculator where plan=500"
                            DataFile="~/DB/db_maindata.mdb" >
                            </asp:AccessDataSource>
            
            </td>
            
            
        </tr>
        
        
        <tr>
        <td height=70>
            
        
        
        </td>
        </tr>
        
        <tr>
        <td>
            
            <asp:Button id="btnRecalculateProPlan" runat="server" Text="Recalculate PRO Plan" Width="220px" Height=43 CssClass="INPUTBUTTON"></asp:Button>
        
        </td>
        </tr>
        
    </table>
    </form>
</body>
</html>
