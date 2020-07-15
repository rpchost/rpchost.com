<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FXASAlerts.aspx.vb" Inherits="rpchost.FXASAlerts" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">



<HTML>
	<HEAD>
		<title>Add News</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
		
		<table>
		<tr>
		        <td>
		
		<asp:Label id="Label3"  runat="server"
				CssClass="INPUTBUTTON" Width="696px">ADD FXAS SIGNALS Alert</asp:Label>
				</td>
				</tr>
				
				
				<tr>
		        <td height=40>
		
		
				</td>
				</tr>
				
			
		    <tr>
		        <td>
		            <asp:Label id="lblAlert"  runat="server"
				CssClass="INPUTBUTTON"></asp:Label>
		           
		        </td>
		    </tr>
		    
		    
		     
		    
		  
		    
		     <tr>
		        <td>
		         
			
			<asp:TextBox id="txtAlerts" 
				runat="server" TextMode="MultiLine" Width="347px"></asp:TextBox>
				
			<asp:TextBox id="txtExpiry" 
				runat="server" Width="117px"></asp:TextBox>
				
			<asp:Button id="btnSubmit" 
				runat="server" Text="ADD" Width="80px" CssClass="INPUTBUTTON"></asp:Button>

		   <asp:Button id="btnMain" 
                 runat="server"
				Text="MAIN" Width="112px" CssClass="INPUTBUTTON" CausesValidation="False"></asp:Button>
		         
			
			<asp:Label id="lblMess" 
                 runat="server"
				Width="136px"></asp:Label>
               
           
		        </td>
		    </tr>
		</table>
		
       
		
		
		
			
		</form>
	</body>
</HTML>
