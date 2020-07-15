<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SendMail.aspx.vb" Inherits="rpchost.SendMail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
   <table border="0" align="center" cellpadding="5" cellspacing="1" 
        bgcolor="#cccccc" style="width: 652px">
        
  
  <tr>
<td align=center  bgcolor="#eeeeee" class="style1" colspan="2"> 
    <b class="BlackTextBold">Mailing List Send Email</b></td>
</tr>      
     
          <tr>
<td align=center  bgcolor="#eeeeee" class="style1" colspan="2" height=30></td>
</tr>  

<tr>
<td align=left bgcolor="#eeeeee" class="BlackSmallText9"> From</td>
<td bgcolor="#FFFFFF">
    <asp:TextBox ID="txtFrom" runat="server" Width="305px" CssClass="INPUTTEXT"></asp:TextBox>
               </td>
</tr>
<tr>
<td align=left  bgcolor="#eeeeee" class="BlackSmallText9"> To</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtTo" runat="server" Columns="50" 
        CssClass="INPUTTEXT"></asp:TextBox></td>
</tr>
<tr>
<td align=left  bgcolor="#eeeeee" class="BlackSmallText9"> SMTP Server</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtSMTPServer" runat="server" Columns="50" 
        CssClass="INPUTTEXT"></asp:TextBox></td>
</tr>
<tr>
<td align=left  bgcolor="#eeeeee" class="BlackSmallText9"> Subject</td>
<td bgcolor="#FFFFFF">
    <asp:TextBox ID="txtSubject" runat="server" Columns="50" 
        Width="489px" CssClass="INPUTTEXT"></asp:TextBox></td>
</tr>
<tr>
<td align=left  bgcolor="#eeeeee" class="BlackSmallText9"> Body</td>
<td bgcolor="#FFFFFF">
    <asp:TextBox ID="txtBody" runat="server" Columns="40" 
        TextMode="MultiLine" Height="261px" Width="497px" CssClass="INPUTTEXT"></asp:TextBox></td>
</tr>
<tr>
<td align=left  bgcolor="#eeeeee" class="BlackSmallText9">Action</td>
<td bgcolor="#FFFFFF"><asp:Button ID="btnSubmit" runat="server" Text="Send Email"/></td>
</tr>
<tr>
<td align=left  bgcolor="#eeeeee" class="BlackSmallText9">Status</td>
<td bgcolor="#FFFFFF" class="RednormalText"><asp:Literal ID="litStatus" runat="server"></asp:Literal></td>
</tr>
</table> 
    </form>
</body>
</html>
