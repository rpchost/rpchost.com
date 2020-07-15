<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="ListSignals.aspx.vb" Inherits="ListSignals" %>

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
            
            
              <asp:GridView ID="GridView1" runat="server" SkinID=grdTimesheet AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                         
                          <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="OrderID" />
                                 
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
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Signal] order by ID DESC  " DeleteCommand="delete from [Signal] where ID=?" UpdateCommand="update [Signal] set [Signal] = ?,[Status] = ?,[dtDateSignal] = ?,dtDateClose=?,[curr] = ?,[Entry] = ?,[SL] = ?,[Target] = ?,[Profit] = ? where ID = ?">
                     </asp:AccessDataSource>
                     
              <br />
              <br />
                     
           <%-- <asp:Button ID="Button1" runat="server" Text="Delete ALL Signals" />--%>
            
        </td>
    </tr>
    
    <tr>
        <td>
        
        <table>
            <tr>
                <td>
                    Signal
                </td>
                 <td>
                    <asp:TextBox ID=txtSignal runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Status
                </td>
                 <td>
                    <asp:TextBox ID=txtStatus runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Date Signal
                </td>
                 <td>
                    <asp:TextBox ID=txtDateSignal runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Date Close
                </td>
                 <td>
                    <asp:TextBox ID=txtDateClose runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Currency
                </td>
                 <td>
                    <asp:TextBox ID=txtCurr runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Entry
                </td>
                 <td>
                    <asp:TextBox ID=txtEntry runat=server></asp:TextBox>
                </td>
                
                <td>
                    SL
                </td>
                 <td>
                    <asp:TextBox ID=txtSL runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Target
                </td>
                 <td>
                    <asp:TextBox ID=txtTarget runat=server></asp:TextBox>
                </td>
                
                 <td>
                    Profit
                </td>
                 <td>
                    <asp:TextBox ID=txtProfit runat=server></asp:TextBox>
                </td>
                
                   <td>
                    
                </td>
                 <td>
                    <asp:Button ID="btnInsertSignal" runat="server" Text="Insert Signal" />
                </td>
                
            </tr>
        </table>
        
        </td>
    </tr>
    
    <tr><td> <asp:Label runat=server ID=lblMess></asp:Label> </td></tr>
   
   </table>
    </form>
</body>
</html>
