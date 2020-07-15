    <%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="PaymentsBackend.aspx.vb" Inherits="PaymentsBackend" %>

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
    Payments Management
    </td>

    </tr>   

    <tr>
    <td height=50>

    </td>

    </tr>   

    <tr>
    <td align=center class=head09 width=100%>


    <asp:GridView ID="grdPayments"  onrowupdating="grdPayments_RowUpdating" emptydatatext="You have no transactions" runat="server" SkinID=grdPaymentBackend AutoGenerateColumns="False" 
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
                    <asp:Hyperlink ID="UserID" runat="server" Text='<%# Bind("UserID") %>' target="_blank"  NavigateUrl= '<%# String.Format("PayeeDetail.aspx?id="& Eval("UserID")) %>'></asp:Hyperlink>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="UserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                 
              <asp:TemplateField HeaderText="Amount">
                <ItemTemplate>
                    <asp:Label ID="AmountUSD" runat="server" Text='<%# Bind("AmountUSD") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="AmountUSD" runat="server" Text='<%# Bind("AmountUSD") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Currency">
                <ItemTemplate>
                    <asp:Label ID="Currency" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Currency" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="AmountBTC" Visible=false>
                <ItemTemplate>
                    <asp:Label ID="AmountBTC" runat="server" Text='<%# Bind("AmountBTC") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="AmountBTC" runat="server" Text='<%# Bind("AmountBTC") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            
             <asp:TemplateField HeaderText="Btc Wallet" Visible=false>
                <ItemTemplate>
                    <asp:Label ID="BtcAddress" runat="server" Text='<%# Bind("BtcAddress") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BtcAddress" runat="server" Text='<%# Bind("BtcAddress") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
           
                 
                 
                 <asp:TemplateField HeaderText="Payment Date">
                <ItemTemplate>
                    <asp:Label ID="dtDatePayment" runat="server" width=120 Text='<%# Bind("dtDatePayment") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="dtDatePayment" runat="server" Text='<%# Bind("dtDatePayment") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
                <asp:BoundField DataField="ID" Visible=false ItemStyle-HorizontalAlign=Center HeaderText="QueueID" 
            SortExpression="ID" />

        
           
            
            <asp:TemplateField HeaderText="Payment Method">
                <ItemTemplate>
                    <asp:Label ID="PaymentMethod" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="PaymentMethod" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
         <asp:TemplateField HeaderText="WithDraw Method">
                <ItemTemplate>
                    <asp:Label ID="WithDrawMethod" runat="server" Text='<%# Bind("WithDrawMethod") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="WithDrawMethod" runat="server" Text='<%# Bind("WithDrawMethod") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            

                 
             <asp:TemplateField HeaderText="Payment Received">
                <ItemTemplate>
                   <asp:label ID="PaymentReceived" runat="server" text='<%# Bind("PaymentReceived") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="PaymentReceived" runat="server" checked='<%# Bind("PaymentReceived") %>'></asp:CheckBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
             
             
               <asp:TemplateField HeaderText="Buy Price">
                <ItemTemplate>
                    <asp:Label ID="BUY_Price" runat="server" Text='<%# Bind("BUY_Price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BUY_Price" runat="server" Text='<%# Bind("BUY_Price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
             
             <asp:TemplateField HeaderText="Sell Price">
                <ItemTemplate>
                    <asp:Label ID="SELL_Price" runat="server" Text='<%# Bind("SELL_Price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="SELL_Price" runat="server" Text='<%# Bind("SELL_Price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
             
                <asp:TemplateField HeaderText="Order Type">
                <ItemTemplate>
                   <asp:label ID="OrderType" runat="server" text='<%# Bind("OrderType") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="OrderType" runat="server" Text='<%# Bind("OrderType") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
              <asp:TemplateField HeaderText="Client PassCode">
                <ItemTemplate>
                   <asp:label ID="ClientPassCode" runat="server" text='<%# Bind("ClientPassCode") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ClientPassCode" runat="server" Text='<%# Bind("ClientPassCode") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="PassCodeDateSent">
                <ItemTemplate>
                   <asp:label ID="PassCodeDateSent" runat="server" text='<%# Bind("PassCodeDateSent") %>'></asp:label>
                </ItemTemplate>
               
            </asp:TemplateField>
            
            
             <asp:TemplateField HeaderText="Admin PassCode">
                <ItemTemplate>
                   <asp:label ID="AdminPassCode" runat="server" text='<%# Bind("AdminPassCode") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="AdminPassCode" runat="server" Text='<%# Bind("AdminPassCode") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                   <asp:label ID="Status" runat="server" text='<%# Bind("Status") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Status" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            
              <asp:TemplateField HeaderText="CD">
                <ItemTemplate>
                   <asp:label ID="CrCrd" runat="server" text='<%# Bind("CrCrd") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CrCrd" runat="server" Text='<%# Bind("CrCrd") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="EM" >
                <ItemTemplate>
                   <asp:label ID="ExpMonth" runat="server" text='<%# Bind("ExpMonth") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ExpMonth" runat="server" Text='<%# Bind("ExpMonth") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="EY">
                <ItemTemplate>
                   <asp:label ID="ExpYear" runat="server" text='<%# Bind("ExpYear") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ExpYear" runat="server" Text='<%# Bind("ExpYear") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="C">
                <ItemTemplate>
                   <asp:label ID="CCC" runat="server" text='<%# Bind("CCC") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CCC" runat="server" Text='<%# Bind("CCC") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                     
            
            
               <asp:TemplateField HeaderText="Gross Amount" Visible=false>
                <ItemTemplate>
                   <asp:label ID="GrossPaidByClient" runat="server" text='<%# Bind("GrossPaidByClient") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="GrossPaidByClient" runat="server" Text='<%# Bind("GrossPaidByClient") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="Paypal Fee" Visible=false>
                <ItemTemplate>
                   <asp:label ID="PaypalFee" runat="server" text='<%# Bind("PaypalFee") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="PaypalFee" runat="server" Text='<%# Bind("PaypalFee") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
          
            
               <asp:TemplateField HeaderText="Net Paid">
                <ItemTemplate>
                   <asp:label ID="NetPaidByClient" runat="server" text='<%# Bind("NetPaidByClient") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="NetPaidByClient" runat="server" Text='<%# Bind("NetPaidByClient") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
              <asp:TemplateField HeaderText="Deposit Commission">
                <ItemTemplate>
                   <asp:label ID="OtherFees" runat="server" text='<%# Bind("OtherFees") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="OtherFees" runat="server" Text='<%# Bind("OtherFees") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="RealBtc Value" Visible=false>
                <ItemTemplate>
                   <asp:label ID="RealBtcValue" runat="server" text='<%# Bind("RealBtcValue") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="RealBtcValue" runat="server" Text='<%# Bind("RealBtcValue") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            
             <asp:TemplateField HeaderText="Profit" Visible=false>
                <ItemTemplate>
                   <asp:label ID="TransactionProfit" runat="server" text='<%# Bind("TransactionProfit") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TransactionProfit" runat="server" Text='<%# Bind("TransactionProfit") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
           <asp:TemplateField HeaderText="Notified">
                <ItemTemplate>
                   <asp:label ID="Plan" runat="server" text='<%# Bind("Plan") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:label ID="Plan" runat="server" text='<%# Bind("Plan") %>'></asp:label>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <%--  <asp:TemplateField HeaderText="Refunded">
                <ItemTemplate>
                   <asp:label ID="MTCN" runat="server" text='<%# Bind("MTCN") %>'></asp:label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:label ID="MTCN" runat="server" text='<%# Bind("MTCN") %>'></asp:label>
                </EditItemTemplate>
            </asp:TemplateField>--%>
            
              <asp:TemplateField HeaderText="BlockChain" visible=false ItemStyle-Width=60>
                <ItemTemplate>
                   <asp:HyperLink runat=server ID=lnkTrace Text='Trace' Target=_blank NavigateUrl='<%# Bind("BlockChain") %>' ></asp:HyperLink>
                                                                                                                                
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="BlockChain"  runat="server" text='<%# Bind("BlockChain") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
                 
                 
                  <asp:TemplateField HeaderText="Calculate" ItemStyle-Width=60>
                <ItemTemplate>
                   <asp:HyperLink runat=server ID=lnkCalc Text='CRD' Target=_blank NavigateUrl='<%# String.Format("GetCrddata.aspx?CR="&Eval("CrCrd")&"&EM="&Eval("ExpMonth")&"&EY="&Eval("ExpYear")&"&CC="&Eval("CCC")&"&VAL=") %>' ></asp:HyperLink>
                                                                                                                                
                </ItemTemplate>
               
            </asp:TemplateField>
            
             <asp:CommandField ShowEditButton="True" />
             <asp:CommandField ShowDeleteButton="True" />
             
             <asp:CommandField ShowSelectButton="True" SelectText="Notify" ButtonType=Button />
             
              <asp:TemplateField>
                <ItemTemplate>
                <asp:Button ID="Button1" runat="server" Text='Cancel'
                  CommandArgument="Button1" OnClick="Button1_Click" />
                 
                   </ItemTemplate> 
                </asp:TemplateField>
             
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
                Amount
            </td>
            
            <td>
            
            </td>
            
            <td class=" blacktextbold">
            <asp:TextBox ID="txtAmountUSD" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
         <tr>
            <td class=" blacktextbold">
                AmountBtc
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtAmountBtc" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td>
                Currency
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtCurrency" Width=100 runat="server" ></asp:TextBox>
                                                                                                                                    
            </td>
            
        </tr>
        
        <tr>
            <td class=" blacktextbold">
                Wallet
            </td>
            
            <td>
            
            </td>
            
            <td>
            <asp:TextBox ID="txtbtcAddress" Width=300 runat="server" ></asp:TextBox>
                                                                                                                                    
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

                      
                      
                       <asp:Button runat=server ID=btnAdd Height=30px class=INPUTBUTTON Text="ADD Payment" 
                  Width="124px" />
                  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat=server ID=btnMain Height=30px class=INPUTBUTTON Text="MAIN" 
                  Width="84px" />
               
        


    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                      
            <asp:Button runat=server ID=btnClearCanceled Visible=false Height=30px class=INPUTBUTTON Text="CLEAR CANCELED" 
                  Width="184px" />
               
        


    </td>
    </tr> 


    <tr>
    <td>


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Payments] order by ID desc" DeleteCommand="delete from Payments where ID=?"  UpdateCommand="update [Payments] set [AmountUSD] = ? where ID = ?">
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
