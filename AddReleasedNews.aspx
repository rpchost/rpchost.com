<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddReleasedNews.aspx.vb" Inherits="rpchost.AddReleasedNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
   
         <table>
         
         <tr>
                <td>
                
                 
                 
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ID" DataSourceID="AccessDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ReportName" HeaderText="ReportName" 
                                SortExpression="ReportName" />
                            <asp:BoundField DataField="TimeRelease" HeaderText="TimeRelease" 
                                SortExpression="TimeRelease" />
                            <asp:BoundField DataField="Pair" HeaderText="Pair" SortExpression="Pair" />
                            <asp:BoundField DataField="TradingPair" HeaderText="TradingPair" 
                                SortExpression="TradingPair" />
                            <asp:CheckBoxField DataField="isTradable" HeaderText="isTradable" 
                                SortExpression="isTradable" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    
                    
                    
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/DB/db_maindata.mdb" DeleteCommand="delete from ReportAnalysis where ID=?"
                        SelectCommand="SELECT [ReportName], [TimeRelease], [Pair], [TradingPair], [isTradable], [ID] FROM [ReportAnalysis]">
                    </asp:AccessDataSource>
                    
                    
                    
                </td>
            </tr>
            
            
            <tr>
                <td>
                
                    News
                
                    <asp:TextBox ID="txtNews" runat="server" Width="380px"></asp:TextBox>            
                    
                </td>
            </tr>
            <tr>
                <td>
                    Date Release
                    <asp:TextBox ID="txtDtRelease" runat="server" Width="189px"></asp:TextBox>            
                </td>
            </tr>
            
             
            
             <tr>
                <td>
                    Pair
                    <asp:TextBox ID="txtPair" runat="server" Width="90px"></asp:TextBox>            
                </td>
            </tr>
            
             <tr>
                <td>
                    Trading Pair
                    <asp:TextBox ID="txtTradingPair" runat="server" Width="90px"></asp:TextBox>            
                </td>
            </tr>
            
            <tr>
                <td>
                     <asp:Button id="btnMain" runat="server" Text="Submit" Width="112px" CssClass="INPUTBUTTON" ></asp:Button>
                </td>
               
            </tr>
            
         </table>
    
    
   
         
    
    </form>
</body>
</html>
