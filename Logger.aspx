<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="Logger.aspx.vb" Inherits="Logger" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>

</head>
<body>
    <form id="form1" runat="server">
     <table width=100%>
    
    
      <tr>
        <td align=center class=head09 >
               
               
               LOGGER
    
        </td>
    </tr>   
    
     <tr>
        <td align=center height=50>
               
           
            
    
        </td>
    </tr> 
    <tr>
        <td class=head09>
               
               
              
    
        </td>
    </tr>    
    
    <tr>
        <td align=center>
             <asp:ScriptManager ID="scriptmanager1" runat="server">  
</asp:ScriptManager>  

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>  
            <asp:Timer ID="Timer1" runat="server" OnTick="BindGridView" Interval="10000" />
            
              <asp:GridView ID="grdLog" runat="server"  AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%   runat="server"
				Font-Size="X-Small" Font-Names="Verdana" ShowFooter="True" CellPadding="4"
				BorderWidth="1px" BorderStyle="None" BorderColor="#CC9966" 
         BackColor="White"
				Height="1px">
				
				<RowStyle  CssClass="BlackSmallText8"/>							
				<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
				
                         <Columns>
                                 
                            <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                         
                             <asp:TemplateField HeaderText="LogDetail" ItemStyle-Width=900>
                                <ItemTemplate>
                                    <asp:Label ID="LogDetail" runat="server" Text='<%# Bind("StrategyText") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="LogDetail" runat="server" Text='<%# Bind("StrategyText") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                                 
                              <asp:TemplateField HeaderText="Date Issued" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:Label ID="DateIssued" runat="server" Text='<%# Bind("DateIssued") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="DateIssued" runat="server" Text='<%# Bind("DateIssued") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                                 
                                 
                                 <asp:TemplateField HeaderText="Link" ItemStyle-HorizontalAlign=Center>
                                <ItemTemplate>
                                    <asp:HyperLink ID="StrategyLink" runat="server" Text='<%# Bind("StrategyLink") %>' Target="_blank" NavigateUrl='<%# Bind("StrategyLink") %>'></asp:HyperLink>
                                </ItemTemplate>
                            
                            </asp:TemplateField>
                            
                                  
                               
                                 
                             
                             <asp:CommandField ShowDeleteButton="True"  />
                             
                         </Columns>
                         
                         
                         
               
        
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Strategy] order by ID desc" DeleteCommand="Delete from Strategy where ID=?">
                     </asp:AccessDataSource>
                     
                     </ContentTemplate>  
                     </asp:UpdatePanel>
                     
              <br />
              <br />
                     
																	               <asp:Button ID="btnClean"  OnClientClick="return confirm('Are you sure you want to clear login sessions ?')"
                                                                                                     CssClass="INPUTBUTTON" runat="server" 
                                                                                                     Text="Clean login sessions"  Width="220" Height=25 />
            
        </td>
    </tr>
    
    
     <tr>
        <td height=50>
               
               

    
        </td>
    </tr>   
    
   
   
    
   
   
   </table>
    </form>
</body>
</html>
