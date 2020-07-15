<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="AddDepositPlanToAccount.aspx.vb" Inherits="AddDepositPlanToAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<body>
    <form id="form1" runat="server">
    <table width=100%>
    
    
      <tr>
            <td colspan=2 align=center class=head08>
                   Add Lending plan to user investment
            </td>
        </tr>
          <tr>
            <td colspan=2 align=center height=100>
                  
            </td>
        </tr>
    
        <tr>
            <td class=BlackTextBold width=200>
             Select User
            </td>
            <td>
                <asp:DropDownList Width=300 AutoPostBack=false ID=ddUsers runat=server SkinID=DropDownSkin>
                        
                </asp:DropDownList>
            </td>
        </tr>
        
        
         <tr>
            <td class=BlackTextBold>
             Lending Plan
            </td>
            <td>
                <asp:DropDownList Width=300 ID=ddPlan runat=server  SkinID=DropDownSkin>
                        
                </asp:DropDownList>
            </td>
        </tr>
        
        
         <tr>
            <td class=BlackTextBold>
             Lend
            </td>
            <td>
                <asp:CheckBox runat=server ID="chkLend" />
            </td>
        </tr>
        
         <tr>
            <td class=BlackTextBold>
             Invest
            </td>
            <td>
                <asp:CheckBox runat=server ID="chkInvest" />
            </td>
        </tr>
        
       
          <tr>
            <td height=50>

            </td>
            <td>
                
            </td>
        </tr>
        
        <tr>
            <td class=BlackTextBold>
             Execute the Deposit
            </td>
            <td>
                <asp:Button ID=btnDeposit runat=server Text=Lend Width=150 SkinID=ButtonSkin Height=35 />
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:Button ID=btnMain runat=server Text=MAIN Width=150 SkinID=ButtonSkin Height=35 />
                
            </td>
        </tr>
         <tr>
            <td>
             
            </td>
            <td>
                <asp:Label runat=server ID=lblMess CssClass=RednormalTextBold></asp:Label>
                
            </td>
        </tr>
        
        <tr>
            <td colspan=2 height=30>
            </td>
        </tr>    
        
         <tr>
            <td colspan=2>
             
                 <asp:GridView ID="grdLending" runat="server" SkinID=grdTimesheet AutoGenerateColumns="False" 
                         DataKeyNames="ID" onrowupdating="grdLending_RowUpdating" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                         
                         
                                 
                               <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                  <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="UserID" />
                                 
                                   <asp:BoundField DataField="Balance" HeaderText="Balance" 
                                 SortExpression="Balance" />
                                 
                             <asp:BoundField DataField="LendingDate" HeaderText="LendingDate" 
                                 SortExpression="LendingDate" />
                                 
                                   <asp:BoundField DataField="InvestmentPlan" HeaderText="InvestmentPlan" 
                                 SortExpression="InvestmentPlan" />
                                 
                                      <asp:BoundField DataField="Lended" HeaderText="Lended" 
                                 SortExpression="Lended" />
                                 
                                   <asp:BoundField DataField="Invested" HeaderText="Invested" 
                                 SortExpression="Invested" />
                                 
                                  <asp:TemplateField HeaderText="Disabled">
                                <ItemTemplate>
                                    <asp:Label ID="disabled" runat="server" Text='<%# Bind("Disabled") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Checkbox ID="disabled" runat="server" checked='<%# Bind("Disabled") %>'></asp:Checkbox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                   
                                 
                             <asp:CommandField ShowEditButton="True" />
                             
                             
                         </Columns>
                         
                       
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Investment] order by ID DESC" >
                     </asp:AccessDataSource>
                
            </td>
        </tr>
        
        
        
        
    </table>
    </form>
</body>
</html>
