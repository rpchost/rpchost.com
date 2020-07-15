
<%@ Page Theme="theme" Language="VB" AutoEventWireup="false" CodeFile="Copy (2) of FXASRUN.aspx.vb" Inherits="FXASRUN" %>



<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>

<%@ Import Namespace="System.Data" %>

<link href="App_Themes/theme/StyleSheet.css" rel="stylesheet" type="text/css" />

  <script type="text/javascript">
        function ClientSideFunction() {
            document.documentElement["lblMess"].value="TEST";
            
        }
         function  CallMe() {
            alert("hi");
        }  
    </script>
   



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
 <meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
 <title>FXAS - software for automated online trading</title> 
 <meta name="description" content="FXAS is a blazing fast trading software that handles fully automated order routing to FXCM broker." /> 
 <meta name="keywords" content="trading software, software for online trading, trading system, automated trading, automatic trading, TradeBullet, excel trading, ATResearch, Advanced Trading Research, interactive brokers, FXCM, trading, mt4, metatrader" /> 
 
 
</head> 


<body topmargin=0 >
    <form id="form1" runat="server">
   
   
   
   
    
   <table bgcolor=eeecde width=100% height=100%>
   
   
   
   <tr>
   <td valign=top>
 

 
   <table border=1 bordercolor=black width=100% height=100>
       
   
   
   <tr>
   <td valign=top>

   
   <table width=100%>
    
    <tr>
        <td >
            <asp:Label ID="Label1" runat="server" Text="Account" CssClass="BlackTextBold"></asp:Label>
        </td>
        <td>
            <anthem:DropDownList ID="cmbAccount" CssClass="inputtext" runat="server"/>
        </td>
         <td>
            <asp:Label ID="Label2" runat="server" CssClass="BlackTextBold" Text="Bal"></asp:Label>
        </td>
        <td>
            
            <anthem:TextBox ID="oBalance" Width=70 EnableCallBack=true CssClass="inputtext" runat="server" />
            
        </td>
        
        
         <td>
            <asp:Label ID="Label3" runat="server" CssClass="BlackTextBold" Text="Equ"></asp:Label>
        </td>
        <td>
            
            
            <anthem:TextBox ID="oEquity" Width=70 EnableCallBack=true CssClass="inputtext" runat="server" />
            
            
        </td>
        
        
       
        
    </tr>
    
    
    
    
    
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Width=100 CssClass="BlackTextBold" Text="Opened Pips"></asp:Label>
        </td>
        <td>
            
            
            <anthem:TextBox ID="txtOpenedPips" Width=60 EnableCallBack=true CssClass="INPUTTEXTRED" runat="server" />
        
        
        </td>
         <td>
            <asp:Label ID="Label4" runat="server" CssClass="BlackTextBold" Text="UsblMarg"></asp:Label>
         
         
        </td>
        <td>
        
         <anthem:TextBox ID="oUsableMr" Width=70 EnableCallBack=true CssClass="inputtext" runat="server" />
            
         
        
        </td>
        
        
         <td>
           
             
        </td>
        <td>
            <asp:DropDownList ID="DDrOrderType" runat="server" CssClass="inputtext">
             <asp:ListItem>Market</asp:ListItem>
             </asp:DropDownList>
        </td>
        
        
        
        
    </tr>
    
    
    <tr>
        <td>
          <asp:Label ID="Label9" CssClass="BlackTextBold" Width=100 runat="server" Text="Closed Pips"></asp:Label>
        </td>
        <td>
          
            <anthem:TextBox ID="txtClosedPips" Width=60 EnableCallBack=true CssClass="inputtext" runat="server" />
            
                
        
        </td>
         <td>
            <asp:Label ID="Label7" runat="server" CssClass="BlackTextBold" Text="AmountK"></asp:Label>
        </td>
        <td>
             <anthem:DropDownList ID="cmbAmountK"  CssClass="inputtext" runat="server"/>
            
        
        </td>
        
        
         <td>
            
        </td>
        <td>
            
                     
            
            </td>
        
        
      
        
    </tr>
    
    
    
    
     <tr>
        <td colspan=4>
        
           
            
            
            &nbsp;</td>
        <td>
         
                
        
        </td>
         <td>
         
        </td>
        
       
      
        
    </tr>
    
    
     <tr>
        <td colspan=6 valign=top>
        
     
     <anthem:Panel topmargin=0  Enabled=false BackColor=ActiveBorder ScrollBars=Vertical runat=server ID=pn Height=120  Width=100%>
     
   <table border=0 topmargin=0>
     
         <tr>
         <td>
             <asp:Label ID="lblEUR"  runat="server" CssClass="BlackTextBold" Text="EUR/USD"/>
         </td>
         
         <td>
              <anthem:Image  ID=EURImg ImageUrl="picture\flat.gif" runat=server />
         </td>
              
          <td> <anthem:Button ID="btnEurBuy"  Width=100 ForeColor=green  CausesValidation=false Text="BUY" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" />      </td>
          <td><anthem:Button ID="btnEurSell" Width=100 ForeColor=Maroon  CausesValidation=false Text="SELL" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /></td>
          
          <td><anthem:textbox ID="txtEurSL" Visible=false AutoUpdateAfterCallBack=true CssClass="inputtext" Width=60 runat="server" /></td>
          <td><anthem:textbox ID="txtEurLimit" Visible=false TextDuringCallBack="Limit" AutoUpdateAfterCallBack=true CssClass="inputtext" Width=60 runat="server" /></td>
          
          
          <td><anthem:Button ID="btnSetEur" Visible=false Width=80 Text="Order" TextDuringCallBack="Executing.." AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /></td>
          
          <td><asp:Button ID="btnStop"  Width=80 Text="STOP" runat=server /> </td>
          
         </tr>
         
         <tr>        
          <td>
           <asp:Label ID="Label6"  runat="server" CssClass="BlackTextBold" Text="GBP/USD"/>
          </td>
          <td>
          
          <anthem:Image ID=GBPImg ImageUrl="picture\flat.gif" runat=server />
          </td>
          <td> <anthem:Button ID="btnGBPBuy"  Width=100 ForeColor=green CausesValidation=false Text="BUY" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /></td> 
          <td><anthem:Button ID="btnGBPSell" Width=100 ForeColor=Maroon CausesValidation=false  Text="SELL" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /></td> 
             
                 <td>
                     <anthem:TextBox ID="txtGBPSL" runat="server" AutoUpdateAfterCallBack="true" 
                         CssClass="inputtext" Visible=false Width="60" />
                 </td>
                 <td>
                     <anthem:TextBox ID="txtGBPLimit" runat="server" AutoUpdateAfterCallBack="true" 
                         CssClass="inputtext" Visible=false Width="60" />
                 </td>
                 <td>
                     <anthem:Button ID="btnSetGBP" runat="server" AutoUpdateAfterCallBack="true" 
                         CssClass="INPUTBUTTONNew" Visible=false Text="Order" Width=80 TextDuringCallBack="Executing.." />
                 </td>
              
          <td><asp:Button ID="btnGBP"  Width=80 Text="STOP" runat=server /></td>
          
          </tr>
          
          <tr>
          <td>
           <asp:Label ID="Label8" runat="server" CssClass="BlackTextBold" Text="USD/JPY"/>
          </td>
           <td> <anthem:Image  ID=JPYImg ImageUrl="picture\flat.gif" runat=server /></td>
          <td><anthem:Button ID="btnJPYBuy" Width=100 ForeColor=green CausesValidation=false Text="BUY" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /> </td>
          <td><anthem:Button ID="btnJPYSell" Width=100 ForeColor=Maroon CausesValidation=false  Text="SELL" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /></td> 
              
                  <td>
                      <anthem:TextBox ID="txtJPYSL" Visible=false runat="server" AutoUpdateAfterCallBack="true" 
                          CssClass="inputtext" Width="60" />
                  </td>
                  <td>
                      <anthem:TextBox ID="txtJPYLimit" Visible=false runat="server" AutoUpdateAfterCallBack="true" 
                          CssClass="inputtext" Width="60" />
                  </td>
                  <td>
                      <anthem:Button ID="btnSetJPY" Visible=false runat="server" AutoUpdateAfterCallBack="true" 
                          CssClass="INPUTBUTTONNew" Text="Order" Width=80 />
                  </td>
                <td><asp:Button ID="btnJpy"  Width=80 Text="STOP" runat=server /></td>
          
          
          
          </tr>
          
          <tr>
          <td>
          <asp:Label ID="Label10"  runat="server" CssClass="BlackTextBold" Text="USD/CAD"/>
          </td>
          <td></td>
          <td><anthem:Button  Text="BUY" CausesValidation=false ID="Button5" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /> </td>
          <td><anthem:Button  Text="SELL" CausesValidation=false ID="Button6" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" /></td> 
             
                  <td>
                      <anthem:TextBox ID="txtCADSL" runat="server" Visible=false AutoUpdateAfterCallBack="true" 
                          CssClass="inputtext" Width="60" />
                  </td>
                  <td>
                      <anthem:TextBox ID="txtCADLimit" runat="server" Visible=false AutoUpdateAfterCallBack="true" 
                          CssClass="inputtext" Width="60" />
                  </td>
                  <td>
                      <anthem:Button ID="btnSetCAD" runat="server" Visible=false AutoUpdateAfterCallBack="true" 
                          CssClass="INPUTBUTTONNew" Text="Order" />
                  </td>
                
          
          
          </tr>
          
         
          </table>
          
          
           </anthem:Panel>
            
        </td>
        
        
       
      
        
    </tr>
    
       <tr>
            <td colspan=7 >
            <br>
                 <anthem:Button ID="Auto" AutoUpdateAfterCallBack=true 
                     CssClass="INPUTBUTTONNew" runat="server"  BackColor=Green ForeColor=white
                     Text="Auto Trading is ON"  Width=100% TextDuringCallBack="UPDATING plz wait ..." />
                  </td>
                 </tr>
                
                
                   <tr>
            <td colspan=7 >
              <asp:Button ID="cmdSync" Width =100%  CssClass="INPUTBUTTONNew" runat="server" Text="Synchronize" />
</td>
                 </tr>
                 
                 
                 <tr>
            <td colspan=7 >
              <anthem:Button ID="cmdLogOut" Width =100% TextDuringCallBack="Logging out..." CssClass="INPUTBUTTONNew" runat="server" Text="LogOut" />
</td>
                 </tr>
                 
                
    
    
   </table>
   </td>
    
    
    <td>
    </td>
    
    
    
    <td valign=top>
    <table width = 100%>
    
    
    <tr>
    <td>
    <table width = 100% bgcolor=gray>
    
       
         <tr>
            <td colspan=5 Class="WhiteText" bgcolor="#006600" >
                LOGIN Section 
            </td>
            
         
            
            
        </tr> 
     
    
       <tr>
            <td colspan=5 Class="BlueText" >
                RPCHOST.COM USERID AND PWD&nbsp;&nbsp; <a href=RegisterContent.aspx class="MaroonSmallText8" target=new>
                Not a member? .. Register</a>
            </td>
            
         
            
            
        </tr>
        
        
        
        
            <tr>
            <td Class="BlackTextBold" >
                UserID
            </td>
            
            <td>
                            <anthem:TextBox ID="txtRpcUserID" CssClass="inputtext" Width=50 runat="server">46</anthem:TextBox>
        
                            <anthem:RequiredFieldValidator ID="ReqUserID" runat="server" 
                                ControlToValidate="txtRpcUserID">*</anthem:RequiredFieldValidator>
        
            </td>
            
              <td Class="BlackTextBold" >
                  Pwd
            </td>
            
            <td>
                                
                    <anthem:TextBox ID="txtRpcPwd" CssClass="inputtext" Width=60  runat="server" TextMode="Password" 
                        >jijo1136</anthem:TextBox>
            </td>
            
            
             <td>
                 
                
                 <anthem:RequiredFieldValidator ID="ReqPwd" runat="server" 
                     ControlToValidate="txtRpcPwd">*</anthem:RequiredFieldValidator>
                 
                
            </td>
            
            
        </tr>
        
        
          <tr>
            <td colspan=4 Class="BlueText" height=40>
                FXCM USERID AND PWD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <a href="http://www.fxcmmena.com/en/open-a-demo-account" target= new class="MaroonSmallText8">
                Create Demo account</a>
            </td>
            
         
            
            
        </tr>
        
        <tr>
            <td class="BlackTextBold">
                AccountID
            </td>
            
            <td>
                            <anthem:TextBox ID="txtUserName" CssClass="inputtext" Width=100 runat="server">70459755001</anthem:TextBox>
                            <anthem:RequiredFieldValidator ID="ReqAccID" runat="server" 
                                ControlToValidate="txtUserName">*</anthem:RequiredFieldValidator>
        
            </td>
            
              <td Class="BlackTextBold" >
                  Connection
            </td>
            
            <td>
                                <anthem:DropDownList CssClass="inputtext"  ID="cmbConnection" runat="server">
                                
                                <asp:ListItem Value="Demo">Demo</asp:ListItem>
                                <asp:ListItem Value="real">Real</asp:ListItem>
                                </anthem:DropDownList>
        
            </td>
            
            
             <td>
                 
                

        
            </td>
            
            
        </tr>
        
        
        
         <tr>
            <td Class="BlackTextBold" >
                Password
            </td>
            
            <td> 
                            <anthem:TextBox ID="txtPassword" EnableViewState=true CssClass="inputtext" Width=100 
                                runat="server" TextMode=Password >2084</anthem:TextBox>
        
                            <anthem:RequiredFieldValidator ID="ReqPassword" runat="server" 
                                ControlToValidate="txtPassword">*</anthem:RequiredFieldValidator>
        
            </td>
            
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
            <td colspan=5 >
            
                 <anthem:Button ID="cmdLogin" AutoUpdateAfterCallBack=true CssClass="INPUTBUTTONNew" runat="server" 
                     Text="Login" Width=100% TextDuringCallBack="INITIALIZING ..." />
                 <br>
                 
                 </td>
                 </tr>
        
        
        <tr>
        <td>
        
         <table width = 100% bgcolor=gray>
    
       
         <tr>
            <td colspan=5 Class="WhiteText" bgcolor="#006600" >
                REPORTS Section 
            </td>
            </tr>
            
 <tr>
 
 
            
            
            
              <td colspan=5 height = 10 Class="BlueText" >
                  &nbsp;</td>
       
             <tr>
            <td colspan=5 >
            
                     
                     
                   <table>
                   <tr>
                   <td valign=top>  
                     
                     
                     <anthem:textbox ID="txtFrom" AutoUpdateAfterCallBack=true CssClass="inputtext" Width=100 runat="server" />
                     
                   </td>
                   <td valign=top>
                     
                      <anthem:Button ID="Button1" AutoUpdateAfterCallBack=true 
                     CssClass="INPUTBUTTONNew" runat="server" 
                     Text=".." />
            </td>
            <td valign=top>
            
                <anthem:Calendar ID="Calendar1" Visible=false Width="100px" Height="144px" BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" DayNameFormat="FirstLetter" BackColor="White" runat="server">
                </anthem:Calendar >
            
            </td>
            
            <td valign=top>
                      <anthem:textbox ID="txtTo"  AutoUpdateAfterCallBack=true CssClass="inputtext" Width=100 runat="server" />
             </td>
             <td valign=top>        
                     
                       <anthem:Button ID="Button2"  AutoUpdateAfterCallBack=true 
                     CssClass="INPUTBUTTONNew"  runat="server" 
                     Text=".." />
                     
                 </td>    
                     
                   <td valign=top>  
                <anthem:Calendar ID="Calendar2"  Width="100px"  Visible=false Height="144px" BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" DayNameFormat="FirstLetter" BackColor="White" runat="server">
                </anthem:Calendar>
                    </td> 
                
                     <td valign=top>
                     
                     
                     
                     
                 <asp:Button ID="cmdLogin0"  AutoUpdateAfterCallBack=true 
                     CssClass="INPUTBUTTONNew" runat="server" 
                     Text="View Trading Report"  Width=140/>
                 
                 </td>
                 
                 </tr>
                 </table>
                 
                 </td >
                  </tr>
            
                
                
                 </td>
            

            
        </tr>
        
       </td>
       
       </table>
       
       </td>
       </tr> 
        
        
        
                 
               
                
                


    </table>
    
    
    </td>
    </tr>
    
    <tr>
        <td height=100 colspan=3>
        
        
        
        
        <anthem:Label ID=lblMess CssClass="MaroonText" runat=server ></anthem:Label>
        
        
        </td> 
    </tr>
    
    
    
     <tr>

        <td colspan=3>
            
       <asp:Label ID="lblOpenPos" CssClass="BlackTextBold" Visible=true runat="server" Text="Open Positions"></asp:Label>
        

            &nbsp;&nbsp;
        
        
                               

                <anthem:Button ID="deleteAll" runat="server" CausesValidation=false CssClass="inputbuttonnew" 
                Width=200 Text="Close All Opened Positions" Visible=false
                        
                
                />
 
<%--OnClientClick="return confirm('Are you sure you want to CLOSE this order?');" 
--%>
        </td>
       
    </tr>
    
    <tr>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <td colspan=4>
            
         <anthem:Timer ID="Timer1" Enabled="true" Interval=5000 runat="server"/>
  
         
       
          
        <anthem:GridView ID="GridView1" CssClass="AnthemGridView" Width=100%  runat="server">
            <Columns>
            
                        
                        
                
            
                        
<asp:TemplateField HeaderText="">
        <ItemTemplate>
                <anthem:Button ID="deleteButton" CausesValidation=false runat="server" CssClass="inputbuttonnew" Width=50 Height=20 CommandName="Select" Text="Close"
                
                         />
                         
                         <%--OnClientClick="return confirm('Are you sure you want to CLOSE this order?');"--%>
        </ItemTemplate>
</asp:TemplateField>

        
             
                
                
      
            
                
                
                
            </Columns>
        </anthem:GridView>
        

        </td>
       
    </tr>
       
    
      <tr>

        <td colspan=3>
            <asp:Label ID="lblClosedPos" Visible=true CssClass="BlackTextBold" runat="server" Text="Closed Positions"></asp:Label>
      
        

        </td>
        
    </tr>
    
     <tr>

        <td colspan=3>
            
            
        <anthem:GridView ID="GridView2" AutoUpdateAfterCallBack=true colspan=3 CssClass="AnthemGridView" Width=100% runat="server">
        </anthem:GridView>
        

        </td>
        
    </tr>
    
    </table>
    
    
    </form>
</body>
</html>

