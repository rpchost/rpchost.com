<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TuningNumbers.aspx.vb" Inherits="TuningNumbers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <table>
  
  
  <tr>
  
  
     
    <td>
        <asp:GridView ID="grdView" runat="server" SkinID=grdTimesheet AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                         
                          <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                  SortExpression="ID" />
                                 
                             <asp:BoundField DataField="UserName" HeaderText="UserName" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="UserName" />
                                 
                                   <asp:BoundField DataField="Country" HeaderText="Country" 
                                 SortExpression="Country" />
                              
                              <asp:ImageField DataImageUrlField="TuningNumberImage1" ControlStyle-Width="100"
                             ControlStyle-Height = "100" HeaderText = "Preview Image1"/>
           
                            
                                 
                                    <asp:ImageField DataImageUrlField="TuningNumberImage2" ControlStyle-Width="100"
                             ControlStyle-Height = "100" HeaderText = "Preview Image1"/>
                                                                   
                                     <asp:TemplateField HeaderText="ResolvedAnswer" SortExpression="Code" >
                                        <EditItemTemplate>
                                            <asp:TextBox width=60 ID="ResolvedAnswer" runat="server" Text='<%# Bind("ResolvedAnswer") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ResolvedAnswer"  Width=60 runat="server" Text='<%# Bind("ResolvedAnswer") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                
                                 
                                  <asp:BoundField DataField="DateOpenedTicket" HeaderText="DateOpenedTicket" 
                                 SortExpression="DateOpenedTicket" />
                                 
                                 
                                   <asp:TemplateField HeaderText="DateReturnedAnswer" SortExpression="DateReturnedAnswer" >
                                        <EditItemTemplate>
                                            <asp:TextBox width=120 ID="DateReturnedAnswer" runat="server" Text='<%# DateTime.Now %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="DateReturnedAnswer"  Width=120 runat="server" Text='<%# DateTime.Now %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                 
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [NoMinimumResolvedPuzzle] order by ID DESC"  UpdateCommand="update [NoMinimumResolvedPuzzle] set [ResolvedAnswer] = @ResolvedAnswer where ID = @ID">
                         
                         <UpdateParameters>
                <asp:Parameter Name="ID" />
                <asp:Parameter Name="ResolvedAnswer" />
                
               
        </UpdateParameters>
        
                     </asp:AccessDataSource>
         
    </td>
       
    <td>
        
    </td>
  </tr>
  
  
  
  
  
  </table>
    </form>
</body>
</html>
