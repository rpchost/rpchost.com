<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IndicatorUsers.aspx.vb" Inherits="IndicatorUsers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">

<table width =900>

<tr>
<td align =center >
 Send Messages 
</td>

</tr>

<tr>
<td height=50>

</td>

</tr>

<tr>

<td>

    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"   Width=1000
            DataKeyNames="ID" DataSourceID="AccessDataSource1" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
             
                    
                      <asp:TemplateField HeaderText="UserID" SortExpression="UserID">
                    
                   <EditItemTemplate>
                        <asp:TextBox ID="UserID" Width=100 runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="UserID"  Width=100 runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                  <asp:TemplateField HeaderText="Pwd" SortExpression="Pwd">
                    
                   <EditItemTemplate>
                        <asp:TextBox ID="Pwd" Width=100 runat="server" Text='<%# Bind("Pwd") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Pwd"  Width=100 runat="server" Text='<%# Bind("Pwd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                
                   <asp:TemplateField HeaderText="DateIssued" SortExpression="DateIssued">
                    
                   <EditItemTemplate>
                        <asp:TextBox ID="DateIssued" runat="server" Text='<%# Bind("DateIssued") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DateIssued"  Width=10 runat="server" Text='<%# Bind("DateIssued") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                

                 <asp:TemplateField HeaderText="DateExpire" SortExpression="DateExpire">
                    
                   <EditItemTemplate>
                        <asp:TextBox ID="DateExpire" runat="server" Text='<%# Bind("DateExpire") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DateExpire"  Width=10 runat="server" Text='<%# Bind("DateExpire") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
             
                <asp:TemplateField HeaderText="Code" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="Code" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Code"  Width=60 runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                
                  <asp:TemplateField HeaderText="CodeEUR" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeEUR" runat="server" Text='<%# Bind("CodeEUR") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeEUR"  Width=60 runat="server" Text='<%# Bind("CodeEUR") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="CodeGBP" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeGBP" runat="server" Text='<%# Bind("CodeGBP") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeGBP"  Width=60 runat="server" Text='<%# Bind("CodeGBP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                  <asp:TemplateField HeaderText="CodeJPY" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeJPY" runat="server" Text='<%# Bind("CodeJPY") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeJPY"  Width=60 runat="server" Text='<%# Bind("CodeJPY") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                  <asp:TemplateField HeaderText="CodeEURGBP" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeEURGBP" runat="server" Text='<%# Bind("CodeEURGBP") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeEURGBP"  Width=60 runat="server" Text='<%# Bind("CodeEURGBP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                   <asp:TemplateField HeaderText="CodeGBPJPY" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeGBPJPY" runat="server" Text='<%# Bind("CodeGBPJPY") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeGBPJPY"  Width=60 runat="server" Text='<%# Bind("CodeGBPJPY") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                   <asp:TemplateField HeaderText="CodeAUDUSD" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeAUDUSD" runat="server" Text='<%# Bind("CodeAUDUSD") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeAUDUSD"  Width=60 runat="server" Text='<%# Bind("CodeAUDUSD") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="CodeEURAUD" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeEURAUD" runat="server" Text='<%# Bind("CodeEURAUD") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeEURAUD"  Width=60 runat="server" Text='<%# Bind("CodeEURAUD") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="CodeUSDJPY" SortExpression="Code" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=60 ID="CodeUSDJPY" runat="server" Text='<%# Bind("CodeUSDJPY") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CodeUSDJPY"  Width=60 runat="server" Text='<%# Bind("CodeUSDJPY") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                  <asp:TemplateField HeaderText="Mess" SortExpression="Mess" >
                    
                   <EditItemTemplate>
                        <asp:TextBox width=100 ID="Mess" runat="server" Text='<%# Bind("Mess") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Mess"  Width=100 runat="server" Text='<%# Bind("Mess") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        
       <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Indicator]" DeleteCommand="delete FROM [Indicator] where ID=?" UpdateCommand="update [Indicator] set [UserID]=?,[pwd]=?,[DateIssued]=?,[DateExpire]=?,[Code]=?,[CodeEUR]=?,[CodeGBP]=?,[CodeJPY]=?,[CodeEURGBP]=?,[CodeGBPJPY]=?,[CodeAUDUSD]=?,[CodeEURAUD]=?,[CodeUSDJPY]=?,[Mess] = ? where [ID] = ?" >
        </asp:AccessDataSource>
      
       
       <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=rpchost.db.11465240.hostedresource.com; Initial Catalog=rpchost; User ID=rpchost; Password='Jijo1136!';Connection Timeout=100000" SelectCommand="SELECT * FROM [Indicator]" DeleteCommand="delete FROM [Indicator] where ID=?" UpdateCommand="update [Indicator] set [UserID]=?,[pwd]=?,[DateIssued]=?,[DateExpire]=?,[Code]=?,[Mess] = ? where [ID] = ?"   ></asp:SqlDataSource>
       --%> 
        <br />
        <br />
       
        
</td>
</tr>

<tr>
<td valign="top">
    <asp:Label ID="Label1" runat="server" Text="Send a message to ALL"></asp:Label>

    <asp:TextBox ID="txtMess" runat="server" Height="74px" TextMode="MultiLine" 
        Width="254px"></asp:TextBox>
    <asp:Button ID="btnSend" runat="server" Text="Send" />
</td>
</tr>


<td valign="top">
    <asp:Label ID="lblMess" runat="server" Text=""></asp:Label>
</td>
</tr>

</table>    

    </form>
</body>
</html>
