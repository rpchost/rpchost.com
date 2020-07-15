<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StrategyManager.aspx.vb" Inherits="Rpchost.StrategyManager" ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtID" runat="server" Width="59px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button4" runat="server" Height="19px" Text="..." />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Link Text"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtStrategyLink" runat="server" Width="273px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Date Issued"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtDateIssued" runat="server" Width="271px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Strategy Text"></asp:Label>
&nbsp;<asp:TextBox ID="txtStrategyText" runat="server" Height="52px" 
            TextMode="MultiLine" Width="307px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Strategy Video"></asp:Label>
&nbsp;<asp:TextBox ID="txtStrategyVideo" runat="server" Height="54px" 
            TextMode="MultiLine" Width="297px"></asp:TextBox>
        <br />
        <br />
        <br />
        URL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtURL" runat="server" Width="298px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Edit" Width="105px" />
    
    &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Add" Width="85px" />
    
    &nbsp;
        <asp:Button ID="Button3" runat="server" Text="Delete" />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="AccessDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="StrategyLink" HeaderText="StrategyLink" 
                    SortExpression="StrategyLink" />
                <asp:BoundField DataField="DateIssued" HeaderText="DateIssued" 
                    SortExpression="DateIssued" />
                <asp:BoundField DataField="StrategyText" HeaderText="StrategyText" 
                    SortExpression="StrategyText" />
                <asp:BoundField DataField="StrategyVideo" HeaderText="StrategyVideo" 
                    SortExpression="StrategyVideo" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/DB/db_maindata.mdb" 
            SelectCommand="SELECT [ID], [StrategyLink], [DateIssued], [StrategyText], [StrategyVideo] FROM [Strategy]">
        </asp:AccessDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
