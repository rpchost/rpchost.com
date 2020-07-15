<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="ManageInternalExchanges.aspx.vb" Inherits="ManageInternalExchanges" %>


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
               
               
               INTERNAL EXCHANGING REQUESTS MANAGEMENT
    
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
                         DataKeyNames="II" onrowupdating="grdExchageRequests_RowUpdating" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                                 
                            <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" height=30 Text='<%# Bind("II") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID" runat="server" Text='<%# Bind("II") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="UserID" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    
                                     <asp:Hyperlink ID="UserID" runat="server" Text='<%# Bind("UID") %>' target="_blank"  NavigateUrl= '<%# String.Format("PayeeDetail.aspx?id="& Eval("UID")) %>'></asp:Hyperlink>
                    
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                           
                              <asp:TemplateField HeaderText="Main EUR Balance" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="MainUsdBalance" runat="server" Text='<%# Bind("MainUsdBalance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="MainUsdBalance" runat="server" Text='<%# Bind("MainUsdBalance") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Main BTC Balance" ItemStyle-HorizontalAlign=Center> 
                                <ItemTemplate>
                                    <asp:Label ID="MainBTCBalance" runat="server" Text='<%# Bind("MainBTCBalance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="MainBTCBalance" runat="server" Text='<%# Bind("MainBTCBalance") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                         
                                 
                              <asp:TemplateField HeaderText="EUR to BTC Request" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="UsdAmountToBtc" runat="server" Text='<%# Bind("UsdAmountToBtc") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UsdAmountToBtc" runat="server" Text='<%# Bind("UsdAmountToBtc") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Reserved BTC" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="BtcAmountReserved" runat="server" text='<%# Bind("BtcAmountReserved") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BtcAmountReserved" runat="server" Text='<%# Bind("BtcAmountReserved") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="BTC to EUR Request" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="BtcAmountToUsd" runat="server" Text='<%# Bind("BtcAmountToUsd") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BtcAmountToUsd" runat="server" Text='<%# Bind("BtcAmountToUsd") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                             <asp:TemplateField HeaderText="Reserved EUR" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="EurAmountReserved" runat="server" text='<%# Bind("EurAmountReserved") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="EurAmountReserved" runat="server" Text='<%# Bind("EurAmountReserved") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Coinbase Price" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="CoinbasePrice" runat="server" text='<%# Bind("CoinbasePrice") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="CoinbasePrice" runat="server" Text='<%# Bind("CoinbasePrice") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                  
                            <asp:TemplateField HeaderText="Date Request" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="DateRequest" runat="server" width=120 Text='<%# Bind("DateRequest") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateRequest" runat="server" Text='<%# Bind("DateRequest") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                                       
                             <asp:TemplateField HeaderText="Refunded" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="Refunded" runat="server" text='<%# Bind("Refunded") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="Refunded" runat="server" checked='<%# Bind("Refunded") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Executed" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="DoneByAdmin" runat="server" text='<%# Bind("DoneByAdmin") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="DoneByAdmin" runat="server" checked='<%# Bind("DoneByAdmin") %>'></asp:CheckBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="BTCEUR" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="BTCEUR" runat="server" text='<%# Bind("BTCEUR") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BTCEUR" runat="server" Text='<%# Bind("BTCEUR") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                             
                            
                              <asp:TemplateField HeaderText="EUR Profit" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="ProfitEUR" runat="server" text='<%# Bind("ProfitEUR") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ProfitEUR" runat="server" Text='<%# Bind("ProfitEUR") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="BTC Profit" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                   <asp:label ID="ProfitBTC" runat="server" text='<%# Bind("ProfitBTC") %>'></asp:label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                     <asp:TextBox ID="ProfitBTC" runat="server" Text='<%# Bind("ProfitBTC") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                             <asp:CommandField ShowEditButton="True" />
                             
                             
                             
                               <asp:TemplateField>
                                <ItemTemplate>
                                <asp:Button ID="Refund" runat="server" Text='Refund' OnClientClick="return confirm('Are you sure you want to Refund ?')"
                                  CommandArgument="Refund" OnClick="Refund_Click" height=20 cssClass=INPUTBUTTON_10 />
                                 
                                   </ItemTemplate> 
                                </asp:TemplateField>
                                
                             
                               <asp:TemplateField>
                                <ItemTemplate>
                                <asp:Button ID="Execute" runat="server" Text='Execute' OnClientClick="return confirm('Are you sure you want to Execute ?')"
                                  CommandArgument="Execute" OnClick="Execute_Click" height=20 cssClass=INPUTBUTTON_10 />
                                 
                                   </ItemTemplate> 
                                </asp:TemplateField>
                             
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT InternalExchangeRequests.ID as II,InternalExchangeRequests.UserID as UID,* FROM [InternalExchangeRequests] inner join Exchange on InternalExchangeRequests.UserID = Exchange.UserID  order by InternalExchangeRequests.ID desc" UpdateCommand="update InternalExchangeRequests set UserID=? where ID=?" >
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
