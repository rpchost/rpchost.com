<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="CampaignBackend.aspx.vb" Inherits="CampaignBackend" %>

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
    Campaigns Management
    </td>

    </tr>   

    <tr>
    <td height=50>

    </td>

    </tr>   

    <tr>
    <td align=center class=head09 width=100%>


    <asp:GridView ID="grdCampaign"  onrowupdating="grdCampaign_RowUpdating" emptydatatext="You have no Campaigns" runat="server" SkinID=grdPaymentBackend AutoGenerateColumns="False" 
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
                    <asp:Hyperlink ID="UserID" runat="server" Text='<%# Bind("UserID") %>'  NavigateUrl= '<%# String.Format("PayeeDetail.aspx?id="& Eval("UserID")) %>'></asp:Hyperlink>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                 
              <asp:TemplateField HeaderText="BTC">
                <ItemTemplate>
                    <asp:Label ID="BTC" runat="server" Text='<%# Bind("BTC") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BTC" runat="server" Text='<%# Bind("BTC") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="BtcRemain">
                <ItemTemplate>
                    <asp:Label ID="BtcRemain" runat="server" Text='<%# Bind("BtcRemain") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BtcRemain" runat="server" Text='<%# Bind("BtcRemain") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="BtcPrice">
                <ItemTemplate>
                    <asp:Label ID="BtcPrice" runat="server" Text='<%# Bind("BtcPrice") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BtcPrice" runat="server" Text='<%# Bind("BtcPrice") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            
             <asp:TemplateField HeaderText="BtcPriceRemain">
                <ItemTemplate>
                    <asp:Label ID="BtcPriceRemain" runat="server" Text='<%# Bind("BtcPriceRemain") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BtcPriceRemain" runat="server" Text='<%# Bind("BtcPriceRemain") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
           
                 
                 
                 <asp:TemplateField HeaderText="dtPost">
                <ItemTemplate>
                    <asp:Label ID="dtPost" runat="server" width=120 Text='<%# Bind("dtPost") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="dtPost" runat="server" Text='<%# Bind("dtPost") %>'></asp:TextBox>
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
            
             <asp:TemplateField HeaderText="ContributionLink">
                <ItemTemplate>
                    <asp:Label ID="ContributionLink" runat="server" Text='<%# Bind("ContributionLink") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ContributionLink" runat="server" Text='<%# Bind("ContributionLink") %>'></asp:TextBox>
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
            

                 
             <asp:TemplateField HeaderText="CampainName">
                <ItemTemplate>
                   <asp:label ID="CampainName" runat="server" text='<%# Bind("CampainName") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CampainName" runat="server" text='<%# Bind("CampainName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             
             
               <asp:TemplateField HeaderText="MinContribution">
                <ItemTemplate>
                    <asp:Label ID="MinContribution" runat="server" Text='<%# Bind("MinContribution") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="MinContribution" runat="server" Text='<%# Bind("MinContribution") %>'></asp:TextBox>
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
                UserID
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtUserID" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         
        
        <tr>
            <td class=" blacktextbold">
                BTC
            </td>
            
            <td>
            
            </td>
            
            <td class=" blacktextbold">
            <asp:TextBox ID="txtBTC" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td class=" blacktextbold">
                BtcRemain
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtBtcRemain" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td>
                BtcPrice
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtBtcPrice" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td class=" blacktextbold">
                BtcPriceRemain
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtBtcPriceRemain" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        
         <tr>
            <td class=" blacktextbold">
                Status
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtStatus" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td class="blacktextbold">
                ContributionLink
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtContributionLink" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td class="blacktextbold">
                Currency
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtCurr" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
          <tr>
            <td class="blacktextbold">
                CampainName
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtCampainName" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td class="blacktextbold">
                MinContribution
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtMinContribution" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        
        
        
</table>
       

    </td>
    </tr>
    

    <tr>
    <td align=left height=50>

                      
                      
                       <asp:Button runat=server ID=btnAdd Height=30px class=INPUTBUTTON Text="ADD Campaign" 
                  Width="124px" />
                  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                  Width="84px" />
               
        


    
        


    </td>
    </tr> 


    <tr>
    <td>


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Contribution] order by ID desc" DeleteCommand="Delete from Contribution where ID=?"  UpdateCommand="update [Contribution] set [BTC] = ? where ID = ?">
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

