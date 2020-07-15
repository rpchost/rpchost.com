<%@ Page Language="VB" Theme="theme"  AutoEventWireup="false" CodeFile="Traders.aspx.vb" Inherits="FXAS_Traders" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $("[src*=plus]").live("click", function () {
        $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
        $(this).attr("src", "../picture/pics/minus.gif");
    });
    $("[src*=minus]").live("click", function () {
    $(this).attr("src", "../picture/pics/plus.gif");
        $(this).closest("tr").next().remove();
    });
</script>
</head>
<body topmargin=0 leftmargin=0>
    <form id="form1" runat="server" >
   
                <table border=0 cellpadding=0 cellspacing=0 height=100% width=100% >
                
                    <tr>
                        <td valign=top>

                          <anthem:GridView ID="GridView1" runat="server" DataSourceID=AccessDataSource1 OnRowDataBound="OnRowDataBound" HeaderStyle-CssClass=INPUTHeaderAnthGridV RowStyle-CssClass=BlackTextBold7 RowStyle-BackColor="#F1F1F0" AutoGenerateColumns="false" 
                         DataKeyNames="TraderID" Width=100%>
                         <Columns>
                         
                         
                        <asp:TemplateField>
                            <ItemTemplate>
                                <img alt = "" style="cursor: pointer" src="../picture/pics/plus.gif" />
                                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                
                                
                                    <asp:GridView ID="gvSignals" Width=579 CssClass=INPUTChildGridV RowStyle-CssClass=BlackTextBold7 RowStyle-BackColor="#ffffff" runat="server" AutoGenerateColumns="false" >
                                        <Columns>
                                             <%-- <asp:BoundField DataField="TraderID" HeaderText="TraderID" ItemStyle-Height=14 InsertVisible="False" 
                                 ReadOnly="True" SortExpression="TraderID" />--%>
                                 
                             <asp:BoundField DataField="Currency" HeaderText="Currency" HeaderStyle-Width=50 InsertVisible="False" 
                                 ReadOnly="True" SortExpression="Currency" />
                                 
                                   <asp:BoundField DataField="Type"  HeaderText="Type" 
                                 SortExpression="Type" />
                                 
                             <asp:BoundField DataField="Lots" HeaderText="Lots" 
                                 SortExpression="Lots" />
                                 
                                   <asp:BoundField DataField="DateOpen" HeaderStyle-Width=110 HeaderText="DateOpen" 
                                 SortExpression="DateOpen" />
                                 
                                      <asp:BoundField DataField="Open" HeaderText="Open" 
                                 SortExpression="Open" />
                                 
                                   <asp:BoundField DataField="Stop" HeaderText="Stop" 
                                 SortExpression="Stop" />
                                 
                                    <asp:BoundField DataField="Limit" HeaderText="Limit" 
                                 SortExpression="Limit" />
                                 
                                   <asp:BoundField DataField="Profit" HeaderText="Profit" 
                                 SortExpression="Profit" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
        
        
                         
                                   <asp:BoundField DataField="TraderID" HeaderText="TraderID" ItemStyle-Height=14 InsertVisible="False" 
                                 ReadOnly="True" SortExpression="TraderID" />
                                 
                                   <asp:BoundField DataField="Rank" HeaderText="Rank" HeaderStyle-Width=50 InsertVisible="False" 
                                 ReadOnly="True" SortExpression="Rank" />
                                 
                                   <asp:BoundField DataField="UserName" HeaderStyle-Width=100 HeaderText="UserName" 
                                 SortExpression="UserName" />
                                 
                                   <asp:BoundField DataField="AmountFollowing" HeaderText="Amount Following" 
                                 SortExpression="AmountFollowing" />
                                 
                                   <asp:BoundField DataField="Roi" HeaderStyle-Width=40 HeaderText="ROI" 
                                 SortExpression="Roi" />
                                 
                                   <asp:BoundField DataField="AvgDD" HeaderText="Avg DD" 
                                 SortExpression="AvgDD" />
                                 
                                   <asp:BoundField DataField="Weeks" HeaderText="Weeks No." 
                                 SortExpression="Weeks" />
                                 
                                    <asp:BoundField DataField="LiveFollProfit" HeaderText="Live Follow Profit" 
                                 SortExpression="LiveFollProfit" />
                                 
                                   <asp:BoundField DataField="AvgTradeTime" HeaderText="Avg Trade Time" 
                                 SortExpression="AvgTradeTime" />
                                 
                                  <asp:BoundField DataField="Trades" HeaderStyle-Width=40 ItemStyle-BackColor="#BDF4A9" HeaderText="Trades" 
                                 SortExpression="Trades" />
                                 
                                  <asp:BoundField DataField="Win" HeaderStyle-Width=50 HeaderText="Winning" 
                                 SortExpression="Win" ItemStyle-BackColor="#BDF4A9" />
                                 
                                  <asp:BoundField DataField="Pips" HeaderStyle-Width=50 HeaderText="Pips" 
                                 SortExpression="Pips" ItemStyle-BackColor="#BDF4A9" />
                     
                                   <asp:BoundField DataField="LastSeen"  HeaderStyle-Width=100 HeaderText="Last Seen" 
                                 SortExpression="LastSeen" ControlStyle-CssClass=BlacknormalText ItemStyle-CssClass=BlackSmallText />
                                 
                                 
                                   <asp:CommandField ShowSelectButton="True" SelectText="Follow" />
                             

                         </Columns>
                        </anthem:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [TraderRanking] order by Rank ASC" >
                     </asp:AccessDataSource>
                            
                        </td>
                        
                        
                      <%--  <td valign=top>
                           
                              <anthem:GridView ID="GridView2" runat="server" HeaderStyle-Height=27 DataSourceID= "AccessDataSource2" HeaderStyle-CssClass=INPUTHeaderAnthGridV RowStyle-CssClass=BlackTextBold7 RowStyle-BackColor="#F1F1F0" AutoGenerateColumns="false" 
                         DataKeyNames="ID" >
                         <Columns>
                                 
                                  <asp:BoundField DataField="TraderID" HeaderText="TraderID" ItemStyle-Height=14 InsertVisible="False" 
                                 ReadOnly="True" SortExpression="TraderID" />
                                 
                             <asp:BoundField DataField="Currency" HeaderText="Currency" HeaderStyle-Width=50 InsertVisible="False" 
                                 ReadOnly="True" SortExpression="Currency" />
                                 
                                   <asp:BoundField DataField="Type"  HeaderText="Type" 
                                 SortExpression="Type" />
                                 
                             <asp:BoundField DataField="Lots" HeaderText="Lots" 
                                 SortExpression="Lots" />
                                 
                                   <asp:BoundField DataField="DateOpen" HeaderStyle-Width=110 HeaderText="DateOpen" 
                                 SortExpression="DateOpen" />
                                 
                                      <asp:BoundField DataField="Open" HeaderText="Open" 
                                 SortExpression="Open" />
                                 
                                   <asp:BoundField DataField="Stop" HeaderText="Stop" 
                                 SortExpression="Stop" />
                                 
                                    <asp:BoundField DataField="Limit" HeaderText="Limit" 
                                 SortExpression="Limit" />
                                 
                                   <asp:BoundField DataField="Profit" HeaderText="Profit" 
                                 SortExpression="Profit" />
                                 
                                
                             

                         </Columns>
                        </anthem:GridView>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [TraderSignals] order by ID ASC " >
                     </asp:AccessDataSource>
                            
                        </td>--%>
                    </tr>
                </table>
            </td>
        </tr>
       
           
       
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
                <anthem:Timer ID="Timer1"  Interval="1000" Enabled=false runat="server" OnTick="Timer1_Tick">
    </anthem:Timer>
        
    
    </form>
</body>
</html>
