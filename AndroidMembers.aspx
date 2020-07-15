<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="AndroidMembers.aspx.vb" Inherits="AndroidMembers" %>

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
        
        <asp:TextBox ID="txtPwd" runat="server" Width="103px">Pwd</asp:TextBox>
         <asp:TextBox ID="txtFirstName" runat="server" Width="193px">FirstName</asp:TextBox>
     <asp:TextBox ID="txtLastName" runat="server" Width="103px">LastName</asp:TextBox>
      <asp:TextBox ID="txtEmail" runat="server" Width="103px">Email</asp:TextBox>
       <asp:TextBox ID="txtAndroidID" runat="server" Width="103px">AndroidID</asp:TextBox>
        <asp:TextBox ID="txtStatus" runat="server" Width="63px">Status</asp:TextBox>
         <asp:TextBox ID="txtDateLastPayment" runat="server" Width="113px">Date Payment</asp:TextBox>
         
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnADD" runat="server" Text="ADD" Width="107px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
     </tr>   
        
    
    <tr>
        <td>
            
            
              <asp:GridView ID="GridView1" runat="server" SkinID=grdTimesheet AutoGenerateColumns="False" 
                         DataKeyNames="ID" Width=100%>
                         <Columns>
                             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="ID" />
                                 
                                   <asp:BoundField DataField="Pwd" HeaderText="Pwd" 
                                 SortExpression="Pwd" />
                                 
                             <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                                 SortExpression="FirstName" />
                                 
                                   <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                                 SortExpression="FirstName" />
                                 
                                   <asp:BoundField DataField="LastName" HeaderText="LastName" 
                                 SortExpression="LastName" />
                                 
                                   <asp:BoundField DataField="Email" HeaderText="Email" 
                                 SortExpression="Email" />
                                 
                                   <asp:BoundField DataField="UsrName" HeaderText="UsrName" 
                                 SortExpression="UsrName" />
                                 
                                   <asp:BoundField DataField="Status" HeaderText="Status" 
                                 SortExpression="Status" />
                                 
                                   <asp:BoundField DataField="DateLastPayment" HeaderText="DateLastPayment" 
                                 SortExpression="DateLastPayment" />
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
                        </asp:GridView>
                     <%--   <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [MembersForex] where UsrName <> '' " DeleteCommand="delete from [MembersForex] where ID=?" UpdateCommand="update [MembersForex] set [Pwd] = ?,[FirstName] = ?,[LastName] = ?,[Email] = ?,[UsrName] = ?,[Status] = ?,[DateLastPayment] = ? where ID = ?">
                     </asp:AccessDataSource>--%>
        
            
        </td>
    </tr>
   
   </table>
   
    </form>
</body>
</html>
