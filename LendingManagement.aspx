<%@ Page Language="VB" EnableEventValidation="false" Theme="theme"  AutoEventWireup="false" CodeFile="LendingManagement.aspx.vb" Inherits="LendingManagement" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title></title>

    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>

        <style type="text/css">
            .auto-style1 {
                height: 26px;
            }
        </style>

    </head>
    <body>
    <form id="form1" runat="server">
    <table width=100% >


    <tr>
    <td align=center class=head09_13>
        Lending Management
    </td>

    </tr>   

    <tr>
    <td height=50>

    </td>

    </tr>   

    <tr>
    <td align=center class=head09 width=100%>


    <asp:GridView ID="grdLending" SkinID=grdTrans onrowupdating="grdLending_RowUpdating" emptydatatext="You have no transactions" runat="server" AutoGenerateColumns="False" 
         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%>
         <Columns>
                 
           <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="ID" Height=25 runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ID"  runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="UserID">
                <ItemTemplate>
                    <%--<asp:Label ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>--%>
                    <asp:Hyperlink ID="UserID" runat="server" Text='<%# Bind("UserID") %>'  NavigateUrl= '<%# String.Format("PayeeDetail.aspx?id=" & Eval("UserID")) %>'></asp:Hyperlink>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                 
              <asp:TemplateField HeaderText="StartDate">
                <ItemTemplate>
                    <asp:Label ID="StartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="StartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="EndDate">
                <ItemTemplate>
                    <asp:Label ID="EndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="EndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Days Left">
                <ItemTemplate>
                    <asp:Label ID="DaysLeft" runat="server"></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="LendingValue">
                <ItemTemplate>
                    <asp:Label ID="LendingValue" runat="server" Text='<%# Bind("LendingValue") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="LendingValue" runat="server" Text='<%# Bind("LendingValue") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            
             <asp:TemplateField HeaderText="Curr">
                <ItemTemplate>
                    <asp:Label ID="Curr" runat="server" Text='<%# Bind("Curr") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Curr" runat="server" Text='<%# Bind("Curr") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
           
                 
                 
                 <asp:TemplateField HeaderText="MinimumReturningVal">
                <ItemTemplate>
                    <asp:Label ID="MinimumReturningVal" runat="server" width=120 Text='<%# Bind("MinimumReturningVal") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="MinimumReturningVal" runat="server" Text='<%# Bind("MinimumReturningVal") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
             
            
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="Status" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Status" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
         <asp:TemplateField HeaderText="WalletAddress">
                <ItemTemplate>
                    <asp:Label ID="WalletAddress" runat="server" Text='<%# Bind("WalletAddress") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="WalletAddress" runat="server" Text='<%# Bind("WalletAddress") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
                 
             <asp:CommandField ShowEditButton="True" />
             <asp:CommandField ShowDeleteButton="True" />
                    
              <asp:TemplateField>
                <ItemTemplate>
                
                 
                   </ItemTemplate> 
                </asp:TemplateField>
             
         </Columns>
         
         
         


        </asp:GridView>
      

    </td>
    </tr>   
    
   
    


    <tr>
    <td>


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Lending] order by ID desc" DeleteCommand="delete from Lending where ID=?"  UpdateCommand="update [Lending] set [Status] = ? where ID = ?">
     </asp:AccessDataSource>
     
    <br />
    <br />
     
    <%-- <asp:Button ID="Button1" runat="server" Text="Delete ALL Signals" />--%>

    </td>
    </tr>
    
    
    


    <tr>
    <td height=50>




            <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                  Width="84px" />
               
        


    </td>
    </tr>   




    <tr><td class="auto-style1"> <asp:Label runat=server ID=lblMess></asp:Label> </td></tr>


        	<tr>
                                                                              <td align="center">
                                                                                  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968">b</ins><script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></td>
                                                                              </tr>

    </table>
    </form>
    </body>
    </html>
