<%@ Page Language="VB" AutoEventWireup="false" Theme="theme" CodeFile="AccountWithdrawalRequest.aspx.vb" Inherits="AccountWithdrawalRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>

</head>
<body>
    <form id="form1" runat="server">
     <table>
    
    
      <tr>
        <td align=center class=head09>
               
               
               ACCOUNTS MANAGEMENT
    
        </td>
    </tr>   
    
     <tr>
        <td align=center height=50>
               
           
            
    
        </td>
    </tr> 
    <tr>
        <td class=head09>
               
               
                 <table>
    
                    <tr>
                        <td>
                           Filter    
                        </td>
                        
                          <td>
                           
                           <asp:CheckBoxList runat=server ID=chkFilter>
                           <asp:ListItem Value=UsdWithdrawInProcess>UsdWithdrawInProcess</asp:ListItem>
                           <asp:ListItem Value=BtcWithdrawInProcess>BtcWithdrawInProcess</asp:ListItem>
                           </asp:CheckBoxList>
                               
                        </td>
                        
                          <td>
                           
                        <asp:Button runat=server ID=btnSubmit Text=Filter/>
                               
                        </td>
                        
                        
                    </tr>    
                </table>
    
        </td>
    </tr>    
    
    <tr>
        <td>
            
            
              <asp:GridView ID="grdWithdrawal" runat="server" SkinID=grdFxas AutoGenerateColumns="False" 
                         DataKeyNames="ID" onrowupdating="grdWithdrawal_RowUpdating" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                                 
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                          <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="UserID" />
                                 
                              <asp:TemplateField HeaderText="BalanceUSD">
                                <ItemTemplate>
                                    <asp:Label ID="BalanceUSD" runat="server" Text='<%# Bind("BalanceUSD") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BalanceUSD" runat="server" Text='<%# Bind("BalanceUSD") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="BalanceBTC">
                                <ItemTemplate>
                                    <asp:Label ID="BalanceBTC" runat="server" Text='<%# Bind("BalanceBTC") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BalanceBTC" runat="server" Text='<%# Bind("BalanceBTC") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                  
                            <asp:TemplateField HeaderText="Usd Withdrn">
                                <ItemTemplate>
                                    <asp:Label ID="WithdrawUsdAmount" runat="server" Text='<%# Bind("WithdrawUsdAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="WithdrawUsdAmount" runat="server" Text='<%# Bind("WithdrawUsdAmount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                            <asp:TemplateField HeaderText="Usd Withdrn to">
                                <ItemTemplate>
                                    <asp:Label ID="WithdrawUsdAmountTo" runat="server" Text='<%# Bind("WithdrawUsdAmountTo") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="WithdrawUsdAmountTo" runat="server" Text='<%# Bind("WithdrawUsdAmountTo") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                  <asp:TemplateField HeaderText="USD Withdrwn in Process">
                                <ItemTemplate>
                                    <asp:Label ID="UsdWithDrawInProcess" runat="server" Text='<%# Bind("UsdWithDrawInProcess") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:checkbox ID="UsdWithDrawInProcess" runat="server" Checked ='<%# Bind("UsdWithDrawInProcess") %>'></asp:checkbox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                   <asp:TemplateField HeaderText="Withdraw BTC">
                                <ItemTemplate>
                                    <asp:Label ID="WithdrawBTC" runat="server" Text='<%# Bind("WithdrawBTC") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="WithdrawBTC" runat="server" Text='<%# Bind("WithdrawBTC") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                  
                                 
                                  <asp:BoundField DataField="WithdrawBtcToWallet" HeaderText="Withdraw Btc to" 
                                 SortExpression="WithdrawBtcToWallet" />
                                 
                                  <asp:BoundField DataField="WithdrawBtcToUserID" HeaderText="Withdraw Btc to" 
                                 SortExpression="WithdrawBtcToUserID" />
                                 
                                 
                                    <asp:TemplateField HeaderText="Btc Withdrawn in Process">
                                <ItemTemplate>
                                    <asp:Label ID="BtcWithDrawInProcess" runat="server" Text='<%# Bind("BtcWithDrawInProcess") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:checkbox ID="BtcWithDrawInProcess" runat="server" Checked='<%# Bind("BtcWithDrawInProcess") %>'></asp:checkbox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                 
                                
                                 
                                 <asp:BoundField DataField="DateWithdrawalRequest" HeaderText="Date Withdrawl request" 
                                 SortExpression="DateWithdrawalRequest" />
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                             
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Account] " DeleteCommand="delete from Account where ID=?"  UpdateCommand="update [Account] set [BalanceUSD] = ? where ID = ?">
                     </asp:AccessDataSource>
                     
              <br />
              <br />
                     
           <%-- <asp:Button ID="Button1" runat="server" Text="Delete ALL Signals" />--%>
            
        </td>
    </tr>
    
    
     <tr>
        <td height=50>
               
               

    
        </td>
    </tr>   
    
    
    <tr>
        <td class=head09>
               
               
Add New Account
    
        </td>
    </tr>    
    
    
     <tr>
        <td class=head09>
               
               
                 <table>
    
                    <tr>
                        <td>
                          User ID
                        </td>
                        
                          <td>
                           
                          
                               
                        </td>
                        
                          <td>
                           
                        <asp:TextBox runat=server ID=txtUserID></asp:TextBox>
                               
                        </td>
                        
                        
                    </tr>    
                    
                     <tr>
                        <td>
                          USD Balance
                        </td>
                        
                          <td>
                           
                          
                               
                        </td>
                        
                          <td>
                           
                        <asp:TextBox runat=server ID=txtBalanceUSD Text=0></asp:TextBox>
                               
                        </td>
                        
                        
                    </tr>   
                    
                     <tr>
                        <td>
                          BTC Balance
                        </td>
                        
                          <td>
                           
                          
                               
                        </td>
                        
                          <td>
                           
                             <asp:TextBox runat=server ID=txtBalanceBTC Text=0></asp:TextBox>
                               
                        </td>
                        
                        
                    </tr>  
                    
                    
                    
                     <tr>
                        <td>
                          
                        </td>
                        
                          <td>
                           
                          
                               
                        </td>
                        
                          <td  height=50>
                           
                            <asp:Button runat=server ID=btnAdd Height=30 class=INPUTBUTTON Text="Add Account" />
                               
                        </td>
                        
                          <td  height=50>
                           
                            <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                                  Width="84px" />
                               
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
