<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LiveFXAS.aspx.vb" Inherits="Rpchost.LiveFXAS" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">



<HTML>
	<HEAD>
		<title>LIVE FXAS</title>
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
				CssClass="INPUTBUTTON" Width="696px">LIVE FXAS CLIENTS</asp:Label>
				</td>
				</tr>
				
				
				<tr>
		        <td height=40>
		
		
				</td>
				</tr>
				
				
		    <tr>
		        <td>
		             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1">
                         <Columns>
                             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="ID" />
                             <asp:BoundField DataField="Comments" HeaderText="Administrator Notification" 
                                 SortExpression="Comments" />
                             
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
                         
                         
        </asp:GridView>
		             <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Comments]" DeleteCommand="delete from [Comments] where ID=?" >
                     </asp:AccessDataSource>
		        </td>
		    </tr>
		    
		    
		     
		    
		    </td>
		    </tr>
		    
		     <tr>
		        <td>
		         
			
			<asp:TextBox id="txtAlerts" 
				runat="server" TextMode="MultiLine" Width="347px" Visible="False"></asp:TextBox>
				
			<asp:TextBox id="txtExpiry" 
				runat="server" Width="170px"></asp:TextBox>
				
			<asp:Button id="btnSubmit" 
				runat="server" Text="ADD" Width="80px" CssClass="INPUTBUTTON"></asp:Button>

		   <asp:Button id="btnMain" 
                 runat="server"
				Text="View Alerts" Width="112px" CssClass="INPUTBUTTON" CausesValidation="False"></asp:Button>
		         
			
			<asp:Label id="lblMess" 
                 runat="server"
				Width="136px"></asp:Label>
               
           
		        </td>
		    </tr>
		</table>
		
       
		
		
		
			
		</form>
	</body>
</HTML>
