<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="PasswordRecoveryBackend.aspx.vb" Inherits="PasswordRecoveryBackend" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>

<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<body>
    
<form id="form1" runat="server">
    <table width=100%>
    
    
      <tr>
            <td colspan=2 align=center class=head08>
                   Password Recovery Backend
            </td>
        </tr>
          <tr>
            <td colspan=2 align=center height=100>
                  
            </td>
        </tr>
    
        
        
         <tr>
            <td colspan=2>
             
                 <asp:GridView ID="grdrecovery" runat="server" SkinID=grdTimesheet AutoGenerateColumns="False" 
                         DataKeyNames="ID"  DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                         
                         
                                 
                               <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                  <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="Email" />
                                 
                                   <asp:BoundField DataField="Password" HeaderText="Password" 
                                 SortExpression="Password" />
                                 
                             <asp:BoundField DataField="RequestDate" HeaderText="RequestDate" 
                                 SortExpression="RequestDate" />
                                 
                               
                                   
                                 
                             <asp:CommandField ShowDeleteButton="True" />
                             
                             
                         </Columns>
                         
                       
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [RecoverPassword] order by ID DESC"  deletecommand="delete from RecoverPassword where ID=?">
                     </asp:AccessDataSource>
                
            </td>
        </tr>
        
        
        
        
    </table>
    </form>
</body>
</html>
