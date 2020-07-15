<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="ManageExchangingRequests.aspx.vb" Inherits="ManageExchangingRequests" %>


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
               
               
               EXCHANGING REQUESTS MANAGEMENT
    
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
                           <asp:ListItem Value=UsdExchange>USD Exchanging Requests</asp:ListItem>
                           <asp:ListItem Value=BtcExchange>BTC Exchanging Requests</asp:ListItem>
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
            
            
              <asp:GridView ID="grdExchageRequests" runat="server" SkinID=grdFxas AutoGenerateColumns="False" 
                         DataKeyNames="ID" onrowupdating="grdExchageRequests_RowUpdating" DataSourceID="AccessDataSource1" Width=800>
                         <Columns>
                                 
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                              <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                         
                                 
                              <asp:TemplateField HeaderText="Usd Request">
                                <ItemTemplate>
                                    <asp:Label ID="UsdAmountSentFromAccount" runat="server" Text='<%# Bind("UsdAmountSentFromAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UsdAmountSentFromAccount" runat="server" Text='<%# Bind("UsdAmountSentFromAccount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="Btc Request">
                                <ItemTemplate>
                                    <asp:Label ID="BtcAmountSentFromAccount" runat="server" Text='<%# Bind("BtcAmountSentFromAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BtcAmountSentFromAccount" runat="server" Text='<%# Bind("BtcAmountSentFromAccount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                  
                            <asp:TemplateField HeaderText="Date Request">
                                <ItemTemplate>
                                    <asp:Label ID="DateRequest" runat="server" Text='<%# Bind("DateRequest") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateRequest" runat="server" Text='<%# Bind("DateRequest") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                            <asp:TemplateField HeaderText="Done By Admin">
                                <ItemTemplate>
                                   <asp:label ID="DoneByAdmin" runat="server" text='<%# Bind("DoneByAdmin") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="DoneByAdmin" runat="server" checked='<%# Bind("DoneByAdmin") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                               
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                             
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [ExchangeRequest] " UpdateCommand="update ExchangeRequest set UserID=? where ID=?" DeleteCommand="delete from ExchangeRequest where ID=?"  >
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
               
               
            Send Money to Exchage Account
    
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
                          
                        </td>
                        
                          <td>
                           
                          
                               
                        </td>
                        
                          <td  height=50>
                           
                            <asp:Button runat=server ID=btnAdd Height=30px class=INPUTBUTTON Text="Send" 
                                  Width="104px" />
                               
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
