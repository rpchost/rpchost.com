<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="ManageTransferToOtherUsers.aspx.vb" Inherits="ManageTransferToOtherUsers" %>


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
               
               
              TRANSFER TO OTHER USERS MANAGEMENT
    
        </td>
    </tr>   
    
     <tr>
        <td align=center height=50>
               
           
            
    
        </td>
    </tr> 
  
    <tr>
        <td>
            
            
              <asp:GridView ID="grdTransfers" runat="server" SkinID=grdFxas AutoGenerateColumns="False" 
                         DataKeyNames="ID" onrowupdating="grdTransfers_RowUpdating" DataSourceID="AccessDataSource1" Width=800>
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
                                    <asp:Label ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                              <asp:TemplateField HeaderText="ToUserID">
                                <ItemTemplate>
                                    <asp:Label ID="ToUserID" runat="server" Text='<%# Bind("ToUserID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ToUserID" runat="server" Text='<%# Bind("ToUserID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                         
                                 
                              <asp:TemplateField HeaderText="UsdAmount">
                                <ItemTemplate>
                                    <asp:Label ID="UsdAmount" runat="server" Text='<%# Bind("UsdAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="UsdAmount" runat="server" Text='<%# Bind("UsdAmount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="BtcAmount">
                                <ItemTemplate>
                                    <asp:Label ID="BtcAmount" runat="server" Text='<%# Bind("BtcAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="BtcAmount" runat="server" Text='<%# Bind("BtcAmount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                  
                            <asp:TemplateField HeaderText="Date Transfer">
                                <ItemTemplate>
                                    <asp:Label ID="DateTransfer" runat="server" Text='<%# Bind("DateTransfer") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateTransfer" runat="server" Text='<%# Bind("DateTransfer") %>'></asp:TextBox>
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
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Transfer] where DonebyAdmin=false" UpdateCommand="update Transfer set test=? where ID=?" DeleteCommand="delete from Transfer where ID=?"  >
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
               
               
            Send Money to Other User
    
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
                          To User ID
                        </td>
                        
                          <td>
                           
                          
                               
                        </td>
                        
                          <td>
                           
                        <asp:TextBox runat=server ID=txtToUserID></asp:TextBox>
                               
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


