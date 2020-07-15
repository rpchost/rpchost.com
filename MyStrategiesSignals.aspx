<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MyStrategiesSignals.aspx.vb" Inherits="MyStrategiesSignals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <table>
    
    
    
    <tr>
        <td>
            <asp:DropDownList runat=server ID=ddStrategyList Width=400 AutoPostBack=true>
                <asp:ListItem Value=0>Select strategy</asp:ListItem>
            </asp:DropDownList>
            
            
            <br><br><br><br><br>
              <asp:GridView ID="GridView1" runat="server" SkinID=grdTimesheet AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                         
                          <asp:BoundField DataField="MyStrategyID" HeaderText="MyStrategyID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="MyStrategyID" />
                                 
                             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="ID" />
                                 
                                   <asp:BoundField DataField="Signal" HeaderText="Signal" 
                                 SortExpression="Signal" />
                                 
                             <asp:BoundField DataField="Status" HeaderText="Status" 
                                 SortExpression="Status" />
                                 
                                   <asp:BoundField DataField="dtDateSignal" HeaderText="dtDateSignal" 
                                 SortExpression="dtDateSignal" />
                                 
                                      <asp:BoundField DataField="dtDateClose" HeaderText="dtDateClose" 
                                 SortExpression="dtDateClose" />
                                 
                                   <asp:BoundField DataField="curr" HeaderText="curr" 
                                 SortExpression="curr" />
                                 
                                    <asp:BoundField DataField="Entry" HeaderText="Entry" 
                                 SortExpression="Entry" />
                                 
                                  <asp:BoundField DataField="SL" HeaderText="SL" 
                                 SortExpression="SL" />
                                 
                                  <asp:BoundField DataField="Target" HeaderText="Target" 
                                 SortExpression="Target" />
                                 
                                 
                                  <asp:BoundField DataField="Profit" HeaderText="Profit" 
                                 SortExpression="Profit" />
                                 
                                 
                               
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" DeleteCommand="delete from [MyStrategySignals] where ID=?" UpdateCommand="update [MyStrategySignals] set [Signal] = ?,[Status] = ?,[dtDateSignal] = ?,dtDateClose=?,[curr] = ?,[Entry] = ?,[SL] = ?,[Target] = ?,[Profit] = ? where ID = ?">
                     </asp:AccessDataSource>
                     
              <br />
              <br />
            
            
                    Signal  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtSignal" Width=500></asp:TextBox> <br>
                    Status &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtStatus"></asp:TextBox> <br>
                    Date Open&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtdtDateSignal"></asp:TextBox><br> 
                    Date Close&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtdtDateClose"></asp:TextBox> <br>
                    Currency&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtCurr"></asp:TextBox> <br>
                    Entry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtEntry"></asp:TextBox> <br>
                    SL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtSL"></asp:TextBox> <br>
                    Target&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat=server ID="txtTarget"></asp:TextBox> <br>
                    
            <asp:Button ID="btnNew" runat="server" Text="New Signal" />
                     
        
            
        </td>
    </tr>
   
   </table>
    </form>
</body>
</html>
