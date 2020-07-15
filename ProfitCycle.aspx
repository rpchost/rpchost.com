<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProfitCycle.aspx.vb" Inherits="ProfitCycle" %>

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
    Profit Cycle
    </td>

    </tr>   

    <tr>
    <td height=50>

    </td>

    </tr>   

    <tr>
    <td align=center class=head09 width=100%>


    <asp:GridView ID="grdCycle"  onrowupdating="grdCycle_RowUpdating" emptydatatext="You have no Cycles" runat="server" SkinID=grdPaymentBackend AutoGenerateColumns="False" 
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
            
            
             <asp:TemplateField HeaderText="Cycle Name">
                <ItemTemplate>
                    <asp:Label ID="CycleName" Height=25 runat="server" Text='<%# Bind("CycleName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CycleName"  runat="server" Text='<%# Bind("CycleName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="Period Beg">
                <ItemTemplate>
                    <asp:Label ID="CyclePeriodBeg" Height=25 runat="server" Text='<%# Bind("CyclePeriodBeg") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CyclePeriodBeg"  runat="server" Text='<%# Bind("CyclePeriodBeg") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Period End">
                <ItemTemplate>
                    <asp:Label ID="CyclePeriodEnd" Height=25 runat="server" Text='<%# Bind("CyclePeriodEnd") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CyclePeriodEnd"  runat="server" Text='<%# Bind("CyclePeriodEnd") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="Begin Amount">
                <ItemTemplate>
                    <asp:Label ID="BeginAmount" Height=25 runat="server" Text='<%# Bind("BeginAmount") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BeginAmount"  runat="server" Text='<%# Bind("BeginAmount") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="End Amount">
                <ItemTemplate>
                    <asp:Label ID="EndAmount" Height=25 runat="server" Text='<%# Bind("EndAmount") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="EndAmount"  runat="server" Text='<%# Bind("EndAmount") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Profit">
                <ItemTemplate>
                    <asp:Label ID="Profit" Height=25 runat="server" Text='<%# Bind("Profit") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Profit"  runat="server" Text='<%# Bind("Profit") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
                 
             <asp:CommandField ShowEditButton="True" />
             <asp:CommandField ShowDeleteButton="True" />
             
           
             
         </Columns>
         
         
         


        </asp:GridView>
      

    </td>
    </tr>   
    
    <tr>
    <td>

<table>
   
       
         
        
        <tr>
            <td class=" blacktextbold">
                CycleName
            </td>
            
            <td>
            
            </td>
            
            <td class=" blacktextbold">
            <asp:TextBox ID="txtCycleName" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td class=" blacktextbold">
               Period Beg
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtCyclePeriodBeg" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td>
                Period End
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtCyclePeriodEnd" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td class=" blacktextbold">
                Begin Amount
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtBeginAmount" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td class=" blacktextbold">
                End Amount
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtEndAmount" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
          <tr>
            <td class=" blacktextbold">
                Profit
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtProfit" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        
        
          <tr>
            <td>
                
            </td>
            
            <td>
            
            </td>
            
            <td>
           
                                                                                                                                    
            </td>
            
        </tr>
        
</table>
       

    </td>
    </tr>
    

    <tr>
    <td align=left height=50>

                      
                      
                       <asp:Button runat=server ID=btnAdd Height=30px class=INPUTBUTTON Text="ADD New Cycle" 
                  Width="124px" />
                  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                  Width="84px" />
               
        


  
               
        


    </td>
    </tr> 


    <tr>
    <td>


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [ProfitCycle] order by ID desc" DeleteCommand="delete from ProfitCycle where ID=?"  UpdateCommand="update [ProfitCycle] set [CycleName] = ? where ID = ?">
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
