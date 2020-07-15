<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BtcSignalsManagement.aspx.vb" Inherits="BtcSignalsManagement" %>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title></title>

    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>

    </head>
    <body>
    <form id="form1" runat="server">
    <table width=100% >


    <tr>
    <td align=center class=head09_13>
        BTC Signals Management
    </td>

    </tr>   

    <tr>
    <td height=50>

    </td>

    </tr>   

    <tr>
    <td align=center class=head09 width=100%>


    <asp:GridView ID="grdSignals" SkinID=grdTrans onrowupdating="grdSignals_RowUpdating" emptydatatext="You have no Signals" runat="server" AutoGenerateColumns="False" 
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
            
              <asp:TemplateField HeaderText="CryptoCurr">
                <ItemTemplate>
                    <%--<asp:Label ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>--%>
                    <asp:Label ID="CryptoCurr" runat="server" Text='<%# Bind("CryptoCurr") %>' ></asp:Label>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CryptoCurr" runat="server" Text='<%# Bind("CryptoCurr") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                 
              <asp:TemplateField HeaderText="Trend">
                <ItemTemplate>
                    <asp:Label ID="Trend" runat="server" Text='<%# Bind("Trend") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Trend" runat="server" Text='<%# Bind("Trend") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="EntryPrice">
                <ItemTemplate>
                    <asp:Label ID="EntryPrice" runat="server" Text='<%# Bind("EntryPrice") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="EntryPrice" runat="server" Text='<%# Bind("EntryPrice") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
           
            
            <asp:TemplateField HeaderText="TrendBeginDate">
                <ItemTemplate>
                    <asp:Label ID="TrendBeginDate" runat="server" Text='<%# Bind("TrendBeginDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TrendBeginDate" runat="server" Text='<%# Bind("TrendBeginDate") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            
             <asp:TemplateField HeaderText="TrendEndDate">
                <ItemTemplate>
                    <asp:Label ID="TrendEndDate" runat="server" Text='<%# Bind("TrendEndDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TrendEndDate" runat="server" Text='<%# Bind("TrendEndDate") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
           
                 
                 
                 <asp:TemplateField HeaderText="ClosePrice">
                <ItemTemplate>
                    <asp:Label ID="ClosePrice" runat="server" width=120 Text='<%# Bind("ClosePrice") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ClosePrice" runat="server" Text='<%# Bind("ClosePrice") %>'></asp:TextBox>
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
         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [BtcSignals] order by ID desc" DeleteCommand="delete from BtcSignals where ID=?"  UpdateCommand="update [Lending] set [Status] = ? where ID = ?">
     </asp:AccessDataSource>
     
    <br />
    <br />
     
    <%-- <asp:Button ID="Button1" runat="server" Text="Delete ALL Signals" />--%>

    </td>
    </tr>
    
    
     <tr>
    <td>

        <table>
            <tr>
                <td>
  
                     <asp:Label runat=server id="lblCurr">Currency</asp:Label>
                     
                </td>
                  <td>
  
                     <asp:TextBox runat=server id="txtCurr" Width="168px" CausesValidation="True"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator1"  runat="server" ErrorMessage="*" ControlToValidate="txtCurr"></asp:RequiredFieldValidator>
																	
                </td>
             </tr>        
             
              <tr>
                <td>
  
                     <asp:Label runat=server id="lblTrend">Trend</asp:Label>
                     
                </td>
                  <td>
  
                     <asp:TextBox runat=server id="txtTrend" CausesValidation="True"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator2"  runat="server" ErrorMessage="*" ControlToValidate="txtTrend"></asp:RequiredFieldValidator>
                </td>
             </tr>      
             
             <tr>
                <td>
  
                     <asp:Label runat=server id="lblEntry">Entry Price</asp:Label>
                     
                </td>
                  <td>
  
                     <asp:TextBox runat=server id="txtEntry" enabled=false></asp:TextBox>
                     <%--<asp:RequiredFieldValidator id="RequiredFieldValidator3"  runat="server" ErrorMessage="*" ControlToValidate="txtEntry"></asp:RequiredFieldValidator>--%>
                     
                </td>
             </tr>     
              <tr>
                <td>
  
                     <asp:Label runat=server id="lblEntryDate">Entry Date</asp:Label>
                     
                </td>
                  <td>
  
                     <asp:TextBox runat=server id="txtEntryDate" enabled=false></asp:TextBox>
                     <%--<asp:RequiredFieldValidator id="RequiredFieldValidator4"  runat="server" ErrorMessage="*" ControlToValidate="txtEntryDate"></asp:RequiredFieldValidator>--%>
                     
                </td>
             </tr>     
             
             <tr>
                <td>
  
                    
                     
                </td>
                  <td>
  
                     <asp:Button runat=server id="btnAdd" text="Add Signal"></asp:Button>
                     
                </td>
             </tr>   
        </table>

    </td>
    </tr>
    
    
    
     <tr>
    <td height=50>
    
     </td>
    </tr>   


    <tr>
    <td height=50>




            <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN"  causesvALidation=false
                  Width="84px" />
               
        


    </td>
    </tr>   




    <tr><td> <asp:Label runat=server ID=lblMess></asp:Label> </td></tr>



        	<tr>
                                                                              <td align="center">
                                                                                  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></td>
                                                                              </tr>

    </table>
    </form>
    </body>
    </html>
