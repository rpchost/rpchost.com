<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FXASHistoryUsers.aspx.vb" Inherits="rpchost.FXASHistoryUsers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
  
             <asp:GridView CssClass="BlacknormalText" ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="AccessDataSource1" Width="700">
                        <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" 
                                SortExpression="ID" />
                            <asp:BoundField DataField="Email" HeaderText="AccountID" 
                                SortExpression="Email" />
                            <asp:BoundField DataField="Name" HeaderText="Date" 
                                SortExpression="Name" >
                             </asp:BoundField>   
                             <asp:BoundField DataField="Descr" HeaderText="Status" 
                                SortExpression="Descr" >    

                            </asp:BoundField>
                          

                        </Columns>
                    </asp:GridView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/DB/db_maindata.mdb" 
                        SelectCommand="SELECT * FROM ContactSales order by ID DESC">
                    </asp:AccessDataSource>
    
             <asp:Button ID="Button1" runat="server" Text="Clear All" />
    
    </form>
</body>
</html>
