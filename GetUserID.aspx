<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GetUserID.aspx.vb" Inherits="GetUserID" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get UserID and Password</title>
    
    <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
    <form id="form1" runat="server">
    
<table>
    <tr>
        <td class="BlackTextBold">
            
            Enter your Email
            
        </td>
        
        <td>
            
            <asp:TextBox ID="txtEmail" runat="server" Width="238px"></asp:TextBox>
            
        </td>
        
        <td>
            
            <asp:Button ID="btnSubmit" runat="server" CssClass="INPUTTEXTbtn" Text="Get UserID and Password" />
            
        </td>
        
    </tr>
    
    <tr>
        <td colspan=3>
            <asp:Label CssClass="RednormalText" ID="lblRes" runat="server" Text=""></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Email required"></asp:RequiredFieldValidator>
        </td>
        <td></td>
        <td></td>
    </tr>
    
    
    <tr>
		    <td  align=center colspan=3>
		    																								    <script type="text/javascript"><!--
google_ad_client = "pub-6183127703818516";
/* 728x90, created 2/13/08 */
google_ad_slot = "1725916647";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
		    </td>
		</tr>
																						
    
</table>

    </form>
</body>
</html>
