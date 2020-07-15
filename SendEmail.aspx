<%@ Page Language="VB" AutoEventWireup="false" validateRequest="false" CodeFile="SendEmail.aspx.vb" Inherits="SendEmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    
        
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

</head>
<body>
    <form id="form1" runat="server">
    
    
    <table>
    
    
    <tr> 
    
        <td width="800" height=50 class="head09" colspan=2 align=center>SEND EMAILS</td>
		<td></td>
    
    </tr>
    
    <tr> 
    
        <td width="113" class="head10" align=left >To</td>
		<td>
            <asp:textbox id="txtTo"  CssClass="inputtext" width=300 Runat="server"></asp:textbox>
            
    <asp:RequiredFieldValidator ControlToValidate=txtTo runat=server cssClass=RednormalText  ErrorMessage="To Email required"></asp:RequiredFieldValidator>
    </td>
    </tr>
    
    
    
    
    <tr> 
    
        <td width="73" class="head10" >Subject</td>
		<td><asp:textbox id="txtSubject" width=100% CssClass="inputtext" Runat="server"></asp:textbox>
		<asp:RequiredFieldValidator ControlToValidate=txtSubject runat=server cssClass=RednormalText  ErrorMessage="Subject required"></asp:RequiredFieldValidator>
		
		</td>
    
    </tr>
    
    
    <tr> 
    
        <td width="73" class="head10" >&nbsp;</td>
		<td>&nbsp;</td>
    
    </tr>
    
    
     <tr> 
    
        <td width="73" class="head10" >Body</td>
		<td><asp:textbox id="txtReply" CssClass="inputtext" Width=100% Height=140 TextMode="MultiLine" Runat="server"></asp:textbox>
		
		<asp:RequiredFieldValidator ControlToValidate=txtReply runat=server cssClass=RednormalText  ErrorMessage="body Required"></asp:RequiredFieldValidator>
		
		
		</td>
    
    </tr>
    
      <tr> 
    
        <td height =100 class="head10" ></td>
		<td>    <asp:Button ID="btnSubmit" Runat="server" Text="Submit" Width=100 Height=35 CssClass="inputtextbtn"></asp:Button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnMain" Runat="server" Text="MAIN" Width=100 Height=35 
                CssClass="inputtextbtn" CausesValidation="False"></asp:Button>
		 </td>
    
    </tr>
    
    
     <tr> 
    
        <td height="50"  ></td>
		<td>
		 <asp:Label ID=lblMess runat=server CssClass=RednormalTextBold></asp:Label>
		</td>
    
    </tr>
    
     <tr> 
    
        <td width="73" class="head10" >&nbsp;</td>
		<td></td>
    
    </tr>
    
     <tr> 
    
        <td colspan=2 >
        
         
        
        </td>
		<td></td>
    
    </tr>
    
    </table>
    
    
       
       <%-- <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/DB/db_maindata.mdb"
            SelectCommand="SELECT * FROM [Contact] ORDER BY [Id] DESC">
            
            </asp:AccessDataSource>--%>



    </form>
</body>
</html>

