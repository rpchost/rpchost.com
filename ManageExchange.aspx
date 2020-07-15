<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="ManageExchange.aspx.vb" Inherits="ManageExchange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>

</head>
<body>
    <form id="form1" runat="server">
     <table width=100%>
    
    
      <tr>
        <td align=center class=head09 >
               
               
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
        <td align=center>
            
            
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
                            
                         
                                   <asp:TemplateField HeaderText="UserID">
                                <ItemTemplate>
                                    <asp:Hyperlink ID="UserID" runat="server" Text='<%# Bind("UserID") %>' target="_blank"  NavigateUrl= '<%# String.Format("PayeeDetail.aspx?id="& Eval("UserID")) %>'></asp:Hyperlink>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                 
                              <asp:TemplateField HeaderText="BalanceUSD">
                                <ItemTemplate>
                                    <asp:Label ID="USDBalance" runat="server" Text='<%# Bind("USDBalance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="USDBalance" runat="server" Text='<%# Bind("USDBalance") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="BalanceBTC">
                                <ItemTemplate>
                                    <asp:Label ID="BTCBalance" runat="server" Text='<%# Bind("BTCBalance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BTCBalance" runat="server" Text='<%# Bind("BTCBalance") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                  
                               
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                             
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Exchange] " DeleteCommand="delete from Exchange where ID=?"  UpdateCommand="update [Exchange] set [UserID] = ? where ID = ?">
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
        <td class=head09 align=center>
               
               
Add New Account
    
        </td>
    </tr>    
    
    
     <tr>
        <td class=head09 align=center width=100%>
               
               
                 <table>
    
                    <tr>
                        <td align=center>
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


         	<tr>
                                                                              <td align="center">
                                                                                  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></td>
                                                                              </tr>
   
   </table>
    </form>
</body>
</html>
