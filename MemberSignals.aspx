<%@ Page Theme="theme" Language="VB" AutoEventWireup="false" CodeFile="MemberSignals.aspx.vb" Inherits="Rpchost.MemberSignals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Member Signal</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
 <script language="javascript" type="text/javascript">  
 
    function val_Direction(sender, args)     
    {   
         if(args.Value == "0")
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }
    
    function val_curr(sender, args)     
    {   
         if(args.Value == "0" || args.Value == "- Select -")
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }
    function vall_Teacher(sender, args)     
    {   
         if(args.Value == "0" )
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }
        
    function vall_Student(sender, args)     
    {   
   // alert(args.Value);
         if(args.Value == "0" || args.Value == "- Students -")
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }
    
      function vall_ExamType(sender, args)     
    {   
   // alert(args.Value);
         if(args.Value == "0" || args.Value == "- Exam Type -")
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }
    
</script>



</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td align="center" width="100%" class="BackendTitle">
                MEMBERS SIGNALS
            </td>
        </tr>
        <tr>
            <td height="50">
            
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" SkinID="grdTimesheet" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" DataSourceID="DGSignal" Width="100%">
                    <Columns>
                    
                         <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=130 HeaderStyle-Font-Bold=true HeaderText="ID" SortExpression="ID" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <ItemTemplate>
                                 <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                       <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="Signal" SortExpression="Signal" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtSignal" runat="server" Text='<%# Rpchost.MemberSignals.getSignal(Eval("ID")) %>'></asp:textbox>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblSignal" runat="server" Text='<%# Rpchost.MemberSignals.getSignal(Eval("ID")) %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="Comments" SortExpression="Comments" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtComments" runat="server" Text='<%# Eval("Comments") %>'></asp:textbox>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        
                        <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=30 HeaderStyle-Font-Bold=true HeaderText="Status" SortExpression="Status" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtStatus" runat="server" Text='<%# Eval("Status") %>'></asp:textbox>
                             </EditItemTemplate>
                                                          
                             <ItemTemplate>
                                 <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        
                        <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=50 HeaderStyle-Font-Bold=true HeaderText="Entry" SortExpression="Entry" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtEntry" runat="server" Text='<%# Eval("Entry") %>'></asp:textbox>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblEntry" runat="server" Text='<%# Eval("Entry") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
       
                        
                      <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=50 HeaderStyle-Font-Bold=true HeaderText="SL" SortExpression="SL" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtSL" runat="server" Text='<%# Eval("SL") %>'></asp:textbox>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblSL" runat="server" Text='<%# Eval("SL") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                             <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=50 HeaderStyle-Font-Bold=true HeaderText="Target" SortExpression="Target" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtTarget" runat="server" Text='<%# Eval("Target") %>'></asp:textbox>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblTarget" runat="server" Text='<%# Eval("Target") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                      
                        
                         <asp:TemplateField HeaderText="Date Open" HeaderStyle-Width=140 SortExpression="dtDateSignal">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDateSignal" runat="server" Text='<%# Bind("dtDateSignal") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDateSignal" Width = 60 runat="server" Text='<%# Bind("dtDateSignal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                           <asp:TemplateField HeaderText="Date Close" HeaderStyle-Width=140 SortExpression="dtDateClose">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDateClose" runat="server" Text='<%# Bind("dtDateClose") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDateClose" Width = 60 runat="server" Text='<%# Bind("dtDateClose") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                                
                        <asp:CommandField ShowSelectButton="True">
                            <ControlStyle Font-Bold="True" ForeColor="Blue" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:AccessDataSource ID="DGSignal" runat="server" DataFile="~/DB/db_maindata.mdb"
                    SelectCommand="SELECT * FROM [MembersSignal] order by ID"></asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
       <tr>
             <td align="center">
 
              
              
                <asp:DetailsView ID="DetailsView1"  OnItemUpdated="DoUpdate"
                    OnItemInserted="DoInsert" OnItemDeleted="DoDelete" runat="server" AutoGenerateRows="False"
                    DataKeyNames="ID" DataSourceID="MemberSignals" Height="50px" Width="100%">
                    <Fields>
                    
 
                        
                        
                        <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="Direction" SortExpression="Direction" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrSignal" runat="server" AppendDataBoundItems="True" 
                                  DataValueField="ID"  SkinID="DropDownSkin"  selectedvalue='<%# Eval("Direction") %>'> 
                                 <asp:ListItem Selected="True" Value="0">- Signal -</asp:ListItem>
                                 <asp:ListItem  Value="Buy">Buy</asp:ListItem>
                                 <asp:ListItem  Value="Sell">Sell</asp:ListItem>
                                 </asp:DropDownList>
                                 
                                 <asp:CustomValidator ID="val_Direction"  runat="server" ControlToValidate="DDrSignal"  
                                    ErrorMessage="You must select Direction" ClientValidationFunction="val_Direction"
                                      dispaly="Static"/> 
                                  
                           
                             </EditItemTemplate>
                             
                             
                             <InsertItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrSignal" runat="server" AppendDataBoundItems="True" 
                                  DataValueField="ID"  SkinID="DropDownSkin"  > 
                                 <asp:ListItem Selected="True" Value="0">- Signal -</asp:ListItem>
                                 <asp:ListItem  Value="Buy">Buy</asp:ListItem>
                                 <asp:ListItem  Value="Sell">Sell</asp:ListItem>
                                 </asp:DropDownList>
                                 
                                 
                                   <asp:CustomValidator ID="val_Direction"  runat="server" ControlToValidate="DDrSignal"  
                                    ErrorMessage="You must select Direction" ClientValidationFunction="val_Direction"
                                      dispaly="Static"/>  
                                  
                           
                             </InsertItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblSignal" runat="server" Text='<%# Eval("Direction") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        
                        
                            <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="curr" SortExpression="curr" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrCurr" runat="server" AppendDataBoundItems="True" 
                                  DataValueField="curr"  SkinID="DropDownSkin"  selectedvalue='<%# Eval("curr") %>'> 
                                 <asp:ListItem Selected="True" Value="0">- Select -</asp:ListItem>
                                 <asp:ListItem  Value="EURUSD">EURUSD</asp:ListItem>
                                 <asp:ListItem  Value="GBPUSD">GBPUSD</asp:ListItem>
                                 <asp:ListItem  Value="USDJPY">USDJPY</asp:ListItem>
                                 <asp:ListItem  Value="USDCAD">USDCAD</asp:ListItem>
                                 <asp:ListItem  Value="AUDUSD">AUDUSD</asp:ListItem>
                                 <asp:ListItem  Value="EURJPY">EURJPY</asp:ListItem>
                                 </asp:DropDownList>
                                 
                                 
                                 <asp:CustomValidator ID="val_curr"  runat="server" ControlToValidate="DDrCurr"  
                                    ErrorMessage="You must select Currency" ClientValidationFunction="val_curr"
                                      dispaly="Static"/> 
                                  
                           
                             </EditItemTemplate>
                             
                             
                               <InsertItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrCurr" runat="server" AppendDataBoundItems="True" 
                                  DataValueField="curr"  SkinID="DropDownSkin"  > 
                                 <asp:ListItem Selected="True" Value="0">- Select -</asp:ListItem>
                                 <asp:ListItem  Value="EURUSD">EURUSD</asp:ListItem>
                                 <asp:ListItem  Value="GBPUSD">GBPUSD</asp:ListItem>
                                 <asp:ListItem  Value="USDJPY">USDJPY</asp:ListItem>
                                 <asp:ListItem  Value="USDCAD">USDCAD</asp:ListItem>
                                 <asp:ListItem  Value="AUDUSD">AUDUSD</asp:ListItem>
                                 <asp:ListItem  Value="EURJPY">EURJPY</asp:ListItem>
                                 </asp:DropDownList>
                                 
                                 
                                  <asp:CustomValidator ID="val_curr"  runat="server" ControlToValidate="DDrCurr"  
                                    ErrorMessage="You must select Currency" ClientValidationFunction="val_curr"
                                      dispaly="Static"/> 
                                  
                           
                             </InsertItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblCurr" runat="server" Text='<%# Eval("curr") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        
                          <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="SignalType" SortExpression="SignalType" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrType" runat="server" AppendDataBoundItems="True" 
                                  DataValueField="curr"  SkinID="DropDownSkin"  selectedvalue='<%# Eval("SignalType") %>'> 
                                 
                                 <asp:ListItem  Value="Market" Selected=True>Market</asp:ListItem>
                                 <asp:ListItem  Value="Entry">Entry</asp:ListItem>
                                 
                                 </asp:DropDownList>
                                  
                           
                             </EditItemTemplate>
                             
                             
                             
                             <InsertItemTemplate>
                             
                             <asp:DropDownList ID="DDrType" runat="server" AppendDataBoundItems="True" 
                                  DataValueField="curr"  SkinID="DropDownSkin" > 
                                 
                                 <asp:ListItem  Value="Market" Selected=True>Market</asp:ListItem>
                                 <asp:ListItem  Value="Entry">Entry</asp:ListItem>
                                 
                                 </asp:DropDownList>
                             
                             </InsertItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblSignalType" runat="server" Text='<%# Eval("SignalType") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=50 HeaderStyle-Font-Bold=true HeaderText="Entry" SortExpression="Entry" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtEntry" runat="server" Text='<%# Eval("Entry") %>'></asp:textbox>
                             
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEntry" ErrorMessage="Entry required"></asp:RequiredFieldValidator>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblEntry" runat="server" Text='<%# Eval("Entry") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
       
                        
                      <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=50 HeaderStyle-Font-Bold=true HeaderText="SL" SortExpression="SL" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtSL" runat="server" Text='<%# Eval("SL") %>'></asp:textbox>
                             
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSL" ErrorMessage="SL required"></asp:RequiredFieldValidator>
                             
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblSL" runat="server" Text='<%# Eval("SL") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                             <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=50 HeaderStyle-Font-Bold=true HeaderText="Target" SortExpression="Target" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtTarget" runat="server" Text='<%# Eval("Target") %>'></asp:textbox>
                             
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTarget" ErrorMessage="Target required"></asp:RequiredFieldValidator>
                                                          
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblTarget" runat="server" Text='<%# Eval("Target") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
 
                        
                        
                     <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="status" SortExpression="status" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrStatus" runat="server" AppendDataBoundItems="True" 
                                   SkinID="DropDownSkin"  selectedvalue='<%# Eval("status") %>'> 
                                 
                                 <asp:ListItem  Value="Trading" Selected=True>Trading</asp:ListItem>
                                 <asp:ListItem  Value="Closed">Closed</asp:ListItem>
                                 <asp:ListItem  Value="Move">Move to Breakeven</asp:ListItem>
                                 
                                 </asp:DropDownList>
                                  
                           
                             </EditItemTemplate>
                             
                             
                             
                              <InsertItemTemplate>
                             
                            
                             <asp:DropDownList ID="DDrStatus" runat="server" AppendDataBoundItems="True" 
                                   SkinID="DropDownSkin" > 
                                 
                                 <asp:ListItem  Value="Trading" Selected=True>Trading</asp:ListItem>
                                 <asp:ListItem  Value="Closed">Closed</asp:ListItem>
                                 <asp:ListItem  Value="Move">Move to Breakeven</asp:ListItem>
                                 
                                 </asp:DropDownList>
                                  
                           
                             </InsertItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        
                        
                         <asp:TemplateField HeaderStyle-BackColor=gray HeaderText="Date Open" HeaderStyle-Width=140 SortExpression="dtDateSignal" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDateSignal" runat="server" Text='<%# Bind("dtDateSignal") %>'></asp:TextBox>
                            </EditItemTemplate>
                             <InsertItemTemplate>
                                <asp:TextBox ID="txtDateSignal" runat="server" Text='<%# now %>' Enabled=false></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDateSignal" Width = 60 runat="server" Text='<%# Bind("dtDateSignal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                           <asp:TemplateField HeaderStyle-BackColor=gray HeaderText="Date Close" HeaderStyle-Width=140 SortExpression="dtDateClose" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDateClose" runat="server" Text='<%# Bind("dtDateClose") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDateClose" Width = 60 runat="server" Text='<%# Bind("dtDateClose") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        
                        <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=100 HeaderStyle-Font-Bold=true HeaderText="Comments" SortExpression="Comments" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             <EditItemTemplate>
                             <asp:textbox ID="txtComments" runat="server" Text='<%# Eval("Comments") %>'></asp:textbox>
                             </EditItemTemplate>
       
                             <ItemTemplate>
                                 <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                
                
                 <asp:TemplateField HeaderStyle-BackColor=gray  HeaderStyle-Width=130 HeaderStyle-Font-Bold=true HeaderText="ID" SortExpression="ID" HeaderStyle-HorizontalAlign=Left ItemStyle-HorizontalAlign=Left >
                             
                             <ItemTemplate>
                                 <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                  
                          
                        <asp:CommandField ShowEditButton="True">
                            <ControlStyle Font-Bold="True" ForeColor="Blue" />
                            <HeaderStyle BackColor="Silver" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" ForeColor="Blue" />
                        </asp:CommandField>
                        <asp:CommandField ShowInsertButton="True">
                            <ControlStyle Font-Bold="True" ForeColor="Blue" />
                        </asp:CommandField>
                        
                        
                    </Fields>
                    
                    
                </asp:DetailsView>
                
                
                
                <asp:AccessDataSource ID="MemberSignals" runat="server" DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Signal] "
                   
                    >
                    <SelectParameters>
                        <asp:ControlParameter Name="caseId" Type="Int32" ControlID="GridView1" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>



