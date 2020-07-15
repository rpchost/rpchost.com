<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OffersBackend.aspx.vb" Inherits="OffersBackend" %>

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
    Offers Management
    </td>

    </tr>   

    <tr>
    <td height=50>

    </td>

    </tr>   

   <tr>
                                                                                       <td>
                                                                                       
                                                                                                <asp:GridView ID="grdOffers" runat="server" DataKeyNames="ID" onrowupdating="grdOffers_RowUpdating" emptydatatext="You have no posted offers"  HeaderStyle-BackColor=Silver  AutoGenerateColumns="False"  CssClass="head01_9" DataSourceID="AccessDataSource1" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:TemplateField HeaderText="ID" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ID" runat="server"  Text='<%# Bind("ID") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="ID"  runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                              <asp:TemplateField HeaderText="UserID" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="UserID" runat="server"  Text='<%# Bind("UserID") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="UserID"  runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                           <asp:TemplateField HeaderText="Amount" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Amount" runat="server"  Text='<%# Bind("Amount") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="Amount"  runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                          
                                                                                                                                <asp:TemplateField HeaderText="Crypto" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="CryptoType" runat="server"  Text='<%# Bind("CryptoType") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="CryptoType"  runat="server" Text='<%# Bind("CryptoType") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                               
                                                                                                                            </asp:TemplateField>   
                                                                                                                           
                                                                                                                           
                                                                                                                           <asp:TemplateField HeaderText="Buy Price" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="BuyPrice" runat="server"  Text='<%# Bind("BuyPrice") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="BuyPrice"  runat="server" Text='<%# Bind("BuyPrice") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>   
                                                                                                                            
                                                                                                                            
                                                                                                                           <asp:TemplateField HeaderText="Sell Price" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="SellPrice" runat="server"  Text='<%# Bind("SellPrice") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="SellPrice"  runat="server" Text='<%# Bind("SellPrice") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField> 
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="Sell Curr" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="SellCurrency" runat="server"  Text='<%# Bind("SellCurrency") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="SellCurrency"  runat="server" Text='<%# Bind("SellCurrency") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField> 
                                                                                                                            
                                                                                                                              <asp:TemplateField HeaderText="Buy Curr" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="BuyCurrency" runat="server"  Text='<%# Bind("BuyCurrency") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="BuyCurrency"  runat="server" Text='<%# Bind("BuyCurrency") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField> 
                                                                                                                         
                                                                                                                         <asp:TemplateField HeaderText="SellRate" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="SellRate" runat="server"  Text='<%# Bind("SellRate") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="SellRate"  runat="server" Text='<%# Bind("SellRate") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>      
                                                                                                                            
                                                                                                                             <asp:TemplateField HeaderText="Offer Type" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="OfferType" runat="server"  Text='<%# Bind("OfferType") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="OfferType"  runat="server" Text='<%# Bind("OfferType") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>     
                                                                                                                            
                                                                                                                             <asp:TemplateField HeaderText="Client Get" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ClientGet" runat="server"  Text='<%# Bind("ClientGet") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="ClientGet"  runat="server" Text='<%# Bind("ClientGet") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>                                                                                       
                                                                                                                         
                                                                                                                          <asp:TemplateField HeaderText="Date Offer" ItemStyle-Width=120 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="DateOffer" runat="server"  Text='<%# Bind("DateOffer") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="DateOffer"  runat="server" Text='<%# Bind("DateOffer") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>      
                                                                                                                         
                                                                                                                                                                                                                                                
                                                                                                                          <asp:TemplateField HeaderText="Reserved Date" ItemStyle-Width=120 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="ReservedDtTime" runat="server"  Text='<%# Bind("ReservedDtTime") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="ReservedDtTime"  runat="server" Text='<%# Bind("ReservedDtTime") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>      
                                                                                                                         
                                                                                                                           <asp:TemplateField HeaderText="Status" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Status" runat="server"  Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="Status"  runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>      
                                                                                                                         
                                                                                                                            
                                                                                                                           <asp:TemplateField HeaderText="Wallet" ItemStyle-Width=150>
                                                                                                                                 <ItemTemplate>
                                                                                                                                    <asp:Label ID="Wallet" runat="server"  Text='<%# Bind("Wallet") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                               <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="Wallet"  runat="server" Text='<%# Bind("Wallet") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                                                                                                                                               
                                                                                                                            </asp:TemplateField>
                                                                                                                            
                                                                                                                            
                                                                                                                             <asp:TemplateField HeaderText="Profit" ItemStyle-Width=50 ItemStyle-HorizontalAlign=Center>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="Profit" runat="server"  Text='<%# Bind("Profit") %>'></asp:Label>
                                                                                                                                    
                                                                                                                                </ItemTemplate>
                                                                                                                                 <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="Profit"  runat="server" Text='<%# Bind("Profit") %>'></asp:TextBox>
                                                                                                                                </EditItemTemplate>
                                                                                                                            </asp:TemplateField>  
                                                                                                                         
                                                                                                                         
                                                                                                                          <asp:CommandField ShowEditButton="True" ItemStyle-Width=30 />
                                                                                                                         <%-- <asp:CommandField ShowDeleteButton="True" />--%>
                                                                                                                                                                                       
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server" SelectCommand="SELECT * FROM [Offers] order by DateOffer desc"  UpdateCommand="update [Offers] set [Amount] = ? where ID = ?"
                                                                                                    DataFile="~/DB/db_maindata.mdb" >
                                                                                                 </asp:AccessDataSource>
                                                                                       
                                                                                       </td>
                                                                                       </tr>


 <tr>
    <td align=left height=50>



                      
       <table>
       
         <tr>
            <td height=50>
                
            </td>
            
            <td>
            
            </td>
            
            <td>

                                                                                                                                    
            </td>
            
        </tr>
        
        
        <tr>
            <td>
                Amount
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="Amount" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        
         <tr>
            <td>
                Crypto Type
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="CryptoType" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                BuyPrice
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="BuyPrice" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                SellPrice
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="SellPrice" AutopostBack=true runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                Client Get
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="ClientGet" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        
         <tr>
            <td>
                DateOffer
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="DateOffer" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                Status
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtStatus" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                BuyCurrency
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="BuyCurrency" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                SellCurrency
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="SellCurrency" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td>
                OfferType
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="OfferType" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td>
                SellRate
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtSellRate" runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        
        
        <tr>
            <td>
                
            </td>
            
            <td>
            
            </td>
            
            <td>
           
            
             <asp:Button runat=server ID=btnAddOffer Height=30px class=INPUTBUTTON Text="Add Offer" 
                  Width="124px" />
                  
                  
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                  
                   <asp:Button runat=server ID=btnClearPending Height=30px class=INPUTBUTTON Text="Clear Pending" 
                  Width="124px" />
                  
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                  
                   <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                  Width="84px" />
               
                  
                                                                                                                                    
            </td>
            
        </tr>
        
       </table>
               
        


    </td>
    </tr> 
    
    <tr>
    <td align=left height=50>



                      
           
        


    </td>
    </tr> 


    <tr>
    <td>


      
     
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
