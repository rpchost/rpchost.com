<%@ Page Language="vb" AutoEventWireup="false" ValidateRequest="false" Inherits="rpchost.AddNews" CodeFile="AddNews.aspx.vb" %>
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
		
		<table Width="100%">
		<tr>
		        <td>
		
		<asp:Label id="Label3"  runat="server"
				CssClass="INPUTBUTTON" Width="100%">Add News</asp:Label>
				</td>
				</tr>
				
				
				<tr>
		        <td height=40>
		
		
				</td>
				</tr>
				
				
		    <tr>
		        <td>
		             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         DataKeyNames="ID" DataSourceID="AccessDataSource1" Width=100%>
                         <Columns>
                             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="ID" />
                            <%-- <asp:BoundField DataField="Description" ItemStyle-Width=1500 HeaderText="Description" 
                                 SortExpression="Description" />--%>
                                 
                                 <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="Description" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Description" runat="server" Width=800 Height=60 TextMode=MultiLine Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
        </asp:GridView>
		             <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [News]" DeleteCommand="delete from [News] where ID=?" UpdateCommand="update [News] set [Description] = ? where ID = ?">
                     </asp:AccessDataSource>
		        </td>
		    </tr>
		    
		    
		     <tr>
		        <td height = 100>
		    
		    </td>
		    </tr>
		    
		     <tr>
		        <td>
		         
			
			<asp:TextBox id="txtNews" 
				runat="server" TextMode="MultiLine" Width="347px"></asp:TextBox>
			
				
			<asp:Button id="btnSubmit" 
				runat="server" Text="ADD" Width="80px" CssClass="INPUTBUTTON"></asp:Button>

		   <asp:Button id="btnMain" 
                 runat="server"
				Text="Main" Width="112px" CssClass="INPUTBUTTON" CausesValidation="False"></asp:Button>
		         
			
			<asp:Label id="lblMess" 
                 runat="server"
				Width="136px"></asp:Label>
               
           
		        </td>
		    </tr>
		</table>
		
       
		
		
		
			
		</form>
	</body>
</HTML>
