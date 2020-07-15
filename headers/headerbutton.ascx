<%@ Control Language="vb" AutoEventWireup="false" Inherits="headerbutton" CodeFile="headerbutton.ascx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" >
    <title>Untitled Page</title>
    
    <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
    
 <script>
     function switchHeight() {
         document.getElementById('cell').height = window.innerHeight - 100;
     } 
</script>

<LINK rel="stylesheet" type="text/css" href="../StyleSheet.css">

        
</head>

<body onload="switchHeight()">

<form >
 
	<table cellSpacing="0" cellPadding="0" align="right"  width=100% >
			<tr>
				<td  align=left>
				
				<%--<A href="Login.aspx" >--%>
				
				<%--<img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/login.gif" alt="Login">--%>
				
				<asp:ImageButton CausesValidation=false id="imgLogin" OnClick="imgLogin_Click" runat="server" AlternateText="Login" ImageAlign="left" ImageUrl="~/html/index/login.gif"/>
				
				<%--</A>--%>
				
				</td>
				<td><a href="Register.aspx" ><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/Register.gif" alt="Register"></a></td>
				
				<td><a href="profile.aspx" ><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/profile.gif"  alt="Your profile"></A></td>
				
				<!--<td><A HREF="renew.aspx" ><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/renew.gif"  alt="Renew"></A></td>-->
				
				<td><a href="contact.aspx"><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/contact.gif" alt="Contact"></A></td>
				
				
				<td><A HREF="companyprofile.aspx" ><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/aboutus.gif"  alt="Company Profile"></A></td>
				
				<td><a href="Reviews.aspx" ><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/reviews.gif"  alt="Your profile"></A></td>
				
				<td width = 1 bgcolor=ffffff><img src=picture/pics/spacer.gif alt="Technical Analysis"></td>
				<td width="100%"  valign=top >
				
				<table >
				    <tr>
				       
				          <td valign=top bgcolor=white width=600 height=100%>
				           <asp:Label Width=100% Height=37 runat=server ID=lblNews  CssClass="rednormaltext">
				             </asp:Label>
				        </td>
				    </tr>
				    
				    
				</table>
				
				
				    
				    
				    
				</td>
				<!--<td ><img style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" src="html/index/trail.gif" width=100%></td>-->
			</tr>
		</table>	
			
		
			
		</form>
			
</body>
</html>
