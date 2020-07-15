<%@ Page Language="vb" AutoEventWireup="false" Inherits="rpchost.SqwakBoxHist" CodeFile="SqwakBoxHist.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Rpchost.com - Access the history of all technical and fundamental trades</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="TITLE" CONTENT="Rpchost.com - Access the history of all technical and fundamental trades">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="A list of all trading signals during the current month which shows the performance of Rpchost.com signals">
		<META NAME="KEYWORDS" CONTENT="forex, technical trading, fundamental trading, forex strategies, Technical Signals, Fundamental Signals, trading signals">
		<META NAME="ABSTRACT" CONTENT="The best forex signals online - Rpchost.com provides real time free forex signals, technical and fundamental signals, the best online resource for forex traders.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		<LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
	
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:datagrid id="DataGrid1" style="Z-INDEX: 100; LEFT: 8px; POSITION: absolute; TOP: 0px" runat="server"
				AutoGenerateColumns="False" Font-Size="X-Small" Font-Names="Verdana" ShowFooter="True" CellPadding="4"
				BorderWidth="1px" BorderStyle="None" BorderColor="#CC9966" PageSize="20" Width="758px" BackColor="White"
				Height="16px">
				<FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
				<SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
				<ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
				<Columns>
					<asp:BoundColumn Visible="False" DataField="ID" ReadOnly="True" HeaderText="ID">
						<HeaderStyle Width="250px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="News Send Time">
						<HeaderStyle Font-Size="7pt" Width="100px"></HeaderStyle>
						<ItemStyle Height="1px" Width="10px"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="Label2" runat="server" Font-Size=7 Width="140px" Height=1 Text='<%# DataBinder.Eval(Container, "DataItem.dtDate") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox3" runat="server" Width="100px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.dtDate") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="News HeadLine">
						<HeaderStyle Font-Size="7pt" Width="130px"></HeaderStyle>
						<ItemStyle Width="10px"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="Label3" runat="server" Font-Size=7 Width="490px" Text='<%# DataBinder.Eval(Container, "DataItem.SqwakText") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox1" runat="server" Width="190px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox2" runat="server" Font-Size=7 Text='<%# DataBinder.Eval(Container, "DataItem.SqwakText") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					
					
					<asp:TemplateColumn HeaderText="Statments">
						<HeaderStyle Font-Size="7pt" Width="330px"></HeaderStyle>
						<ItemStyle Width="10px"></ItemStyle>
						<ItemTemplate>
							<a href=# onclick= "javascript:window.open('SqwakComm.aspx?ID=<%#DataBinder.Eval(Container, "DataItem.ID") %> ','','width=530, height=480,scrollbars=yes, menubar=no, resizable=yes,left=160,top=20')"><%#DataBinder.Eval(Container, "DataItem.TextStatement") %> </a>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox5" runat="server" Width="260px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox6" runat="server" Font-Size=7>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					
					
				</Columns>
				<PagerStyle VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="#330099" Position="TopAndBottom"
					BackColor="#FFFFCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid></form>
			
			
		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
		
	</body>
</HTML>
