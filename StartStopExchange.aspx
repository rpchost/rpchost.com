<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StartStopExchange.aspx.vb" Inherits="StartStopExchange" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BTC PRICES</title>
    <LINK rel="stylesheet" type="text/css" href=StyleSheet.css>
    
</head>
<body>
    <form id="form1" runat="server">
   <table align=center width=700>
   
   <tr>
    <td align=center  class="head10" colspan=3>
        START / STOP EXCHANGE
    </td>
   </tr>
   
   
    <tr>
    <td height=50>
        
    </td>
   </tr>
   
   
   <tr>
    <td>
       
    </td>
   </tr>
  
  
  
   
     
    
    <tr>
    <td >
        
    </td>
       
     <td>
      
     <asp:checkbox runat=server id=chkComm cssClass=BlacknormalText Text="Exchange in Active mode"></asp:checkbox>
     
    </td>
   </tr>
   
   
     <tr>
    <td >
        
    </td>
       
     <td>
      
     <asp:checkbox runat=server id=chkLending cssClass=BlacknormalText Text="Lending in Active mode"></asp:checkbox>
     
    </td>
   </tr>
   
   
    <tr>
    <td>
       
    </td>
       
     <td height=100>
     
      </asp:TextBox><asp:Button ID="btcSubmit"
            runat="server" Text="Submit" width=100 />
            
       </asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnMain"
            runat="server" Text="MAIN" />
    </td>
   </tr>
   
   </table>
    </form>
</body>
</html>
