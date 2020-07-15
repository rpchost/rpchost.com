<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="AccontVerificationBackend.aspx.vb" Inherits="AccontVerificationBackend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>


</head>
<body>
    <form id="form1" runat="server">
    
            
<table Width=100%>
   
        <tr>
            <td class=" blacktextbold" Width=100%>
            
            
            <asp:GridView ID="grdVerification"   onrowupdating="grdVerification_RowUpdating" emptydatatext="You have no transactions" runat="server" SkinID=grdPaymentBackend AutoGenerateColumns="False" 
         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%>
         <Columns>
                             
              <asp:TemplateField HeaderText="UserID">
                <ItemTemplate>

                    <asp:Hyperlink ID="UserID" runat="server" Text='<%# Bind("ID") %>'  NavigateUrl= '<%# String.Format("PayeeDetail.aspx?id="& Eval("ID")) %>'></asp:Hyperlink>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                 
              <asp:TemplateField HeaderText="Verified" ItemStyle-HorizontalAlign=Center>
                <ItemTemplate>
                    <asp:Label ID="Verified" runat="server" Text='<%# Bind("Verified") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="Verified" runat="server" Checked='<%# Bind("Verified") %>'></asp:CheckBox>

                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="View Document" ItemStyle-HorizontalAlign=Center>
                <ItemTemplate>
                <asp:Hyperlink ID="VerifiedFile" runat="server" Text='<%# Bind("VerifiedFile") %>'  NavigateUrl= '<%# Bind("VerifiedFile") %>'></asp:Hyperlink>
                   
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="VerifiedFile" runat="server" Text='<%# Bind("VerifiedFile") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Verification Message" ItemStyle-HorizontalAlign=Center>
                <ItemTemplate>
                    <asp:Label ID="VerificationMessage" runat="server" Text='<%# Bind("VerificationMessage") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="VerificationMessage" width=500 runat="server" Text='<%# Bind("VerificationMessage") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="CRD" ItemStyle-HorizontalAlign=Center>
                <ItemTemplate>
                    <asp:Label ID="CRD" runat="server" width=70 Text='<%# Bind("CRD") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CRD" width=70 runat="server" Text='<%# Bind("CRD") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            
             <asp:TemplateField HeaderText="Last Sent" ItemStyle-HorizontalAlign=Center>
                <ItemTemplate>
                    <asp:Label ID="LastDocumentSent" runat="server" Text='<%# Bind("LastDocumentSent") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="LastDocumentSent" runat="server" Text='<%# Bind("LastDocumentSent") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
              <asp:TemplateField HeaderText="Notified" ItemStyle-HorizontalAlign=Center>
                <ItemTemplate>
                    <asp:Label ID="NotifyVerification" runat="server" Text='<%# Bind("notifyVerification") %>'></asp:Label>

                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="NotifyVerification" runat="server" Text='<%# Bind("notifyVerification") %>'></asp:Label>

                </EditItemTemplate>
            </asp:TemplateField>
           
                
                 
             <asp:CommandField ShowEditButton="True" />
             
             
              <asp:TemplateField>
            <ItemTemplate>
            <asp:Button ID="btnNotify" runat="server" Text='Notify'
              CommandArgument="btnNotify" OnClick="btnNotify_Click" height=20 cssClass=INPUTBUTTON_10 />
             
               </ItemTemplate> 
            </asp:TemplateField>
            
             
            <asp:TemplateField>
            <ItemTemplate>
            <asp:Button ID="btnDeleteDoc" runat="server" Text='Delete Doc'
              CommandArgument="BtnDeleteDoc" OnClick="BtnDeleteDoc_Click" height=20 cssClass=INPUTBUTTON_10 />
             
               </ItemTemplate> 
            </asp:TemplateField>
                                                                                                                        
             
             
         </Columns>
         
         
         


        </asp:GridView>
        
        
          <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
         DataFile="~/DB/db_maindata.mdb" updatecommand="Update membersForex set VerifiedFile=? where ID=?" SelectCommand="SELECT * FROM [membersForex] where VerifiedFile is not null order by LastDocumentSent desc" >
     </asp:AccessDataSource>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
        <td>
         <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                  Width="84px" />
                  
                   <asp:Button runat=server ID=btnPayment Height=30px class=INPUTBUTTON Text="Go To Payments" 
                   />
        </td>
        </tr>
        
</table>
      
    
    </form>
</body>
</html>
