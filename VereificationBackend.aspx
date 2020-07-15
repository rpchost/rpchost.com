<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="VereificationBackend.aspx.vb" Inherits="VereificationBackend" %>

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
               
               
               <asp:GridView ID="grdVerify"  onrowupdating="grdVerify_RowUpdating" runat="server" SkinID=grdFxas AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=120%>
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
                            
                         
                                 
                              <asp:TemplateField HeaderText="PassportFile">
                                <ItemTemplate>
                                    <asp:Label ID="PassportFile" runat="server" Text='<%# Bind("PassportFile") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="PassportFile" runat="server" Text='<%# Bind("PassportFile") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="ProofFile">
                                <ItemTemplate>
                                    <asp:Label ID="ProofFile" runat="server" Text='<%# Bind("ProofFile") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ProofFile" runat="server" Text='<%# Bind("ProofFile") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="DateSent">
                                <ItemTemplate>
                                    <asp:Label ID="DateSent" runat="server" Text='<%# Bind("DateSent") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateSent" runat="server" Text='<%# Bind("DateSent") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                  
                            <asp:TemplateField HeaderText="PassportStatus">
                                <ItemTemplate>
                                    <asp:Label ID="PassportStatus" runat="server" Text='<%# Bind("PassportStatus") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="PassportStatus" runat="server" Text='<%# Bind("PassportStatus") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            
                            <asp:TemplateField HeaderText="ProofStatus">
                                <ItemTemplate>
                                    <asp:Label ID="ProofStatus" runat="server" Text='<%# Bind("ProofStatus") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ProofStatus" runat="server" Text='<%# Bind("ProofStatus") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                          
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                             
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                      
    
        </td>
    </tr>   
    
     <tr>
        <td align=center height=50>
               
           
            
    
        </td>
    </tr> 
   
    
    <tr>
        <td>
            
            
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Verification] " DeleteCommand="delete from Verification where ID=10000"  UpdateCommand="update [Verification] set [PassportFile] = ? where ID = ?">
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
    
    
   
    
    <tr><td> <asp:Label runat=server ID=lblMess></asp:Label> </td></tr>
   
   </table>
    </form>
</body>
</html>
