<%@ Page Language="vb" AutoEventWireup="false" Inherits="rpchost.UsersExpiry" CodeFile="UsersExpiry.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<head>
   
   		<title>Rpchost.com - the best FOREX SIGNALS online</title>
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="TITLE" CONTENT="Rpchost.com - the best FOREX SIGNALS online">
		<META NAME="SUBJECT" CONTENT="Forex predictions, forecasts, analysis">
		<META NAME="PLACENAME" CONTENT="Forex traders land">
		<META NAME="CREATOR" CONTENT="Joseph Chalhoub">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<META NAME="DESCRIPTION" CONTENT="The BEST Forex signals online - www.Rpchost.com . We provide real time free forex signals, free forecasts, education resources for forex traders.">
		<META NAME="KEYWORDS" CONTENT="forex">
		<META NAME="ABSTRACT" CONTENT="The BEST Forex signals online - www.Rpchost.com . We provide real time forex signals, free forecasts.">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		<LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
    
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

  </head>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="Label1" style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server"
				Width="752px" CssClass="BlueText" BackColor="#ffcc66" Height="16px">USERS</asp:Label>
			<asp:datagrid id="Datagrid3" style="Z-INDEX: 107; LEFT: 16px; POSITION: absolute; TOP: 672px"
				runat="server" Width="896px" BackColor="White" Height="174px" AutoGenerateColumns="False"
				Font-Size="X-Small" Font-Names="Verdana" ShowFooter="True" CellPadding="4" BorderWidth="1px"
				BorderStyle="None" BorderColor="#CC9966" AllowPaging="True" PageSize="5">
				<FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
				<SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
				<ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
				<Columns>
					<asp:BoundColumn Visible="False" DataField="ID" ReadOnly="True" HeaderText="ID">
						<HeaderStyle Width="250px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="ID">
						<ItemTemplate>
							<asp:Label id="Label11" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox19" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox20" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="FNAme">
						<ItemTemplate>
							<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FirstName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox3" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FirstName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="LName">
						<ItemTemplate>
							<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox1" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Email">
						<ItemTemplate>
							<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Email") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox5" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Email") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Country">
						<ItemTemplate>
							<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox7" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="isMember">
						<ItemTemplate>
							<asp:Label id="Label10" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isMember") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox17" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox18" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isMember") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Status">
						<ItemTemplate>
							<asp:Label id="Label12" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Status") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox21" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox22" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Status") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="DateLastPayment">
						<ItemTemplate>
							<asp:Label id="Label13" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DateLastPayment") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox23" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox24" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DateLastPayment") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Level">
						<ItemTemplate>
							<asp:Label id="Label14" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Level") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox25" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox26" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Level") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<HeaderStyle HorizontalAlign="Center" Width="50px" VerticalAlign="Middle"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
						<ItemTemplate>
							<asp:ImageButton id="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit" ImageUrl="picture\icon_edit.jpg"></asp:ImageButton>
						</ItemTemplate>
						<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="#330099" Position="TopAndBottom"
					BackColor="#FFFFCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
			<asp:Label id="Label8" style="Z-INDEX: 106; LEFT: 16px; POSITION: absolute; TOP: 648px" runat="server"
				Width="248px" CssClass="alertstitle">Current members</asp:Label>
			<asp:datagrid id="Datagrid2" style="Z-INDEX: 105; LEFT: 16px; POSITION: absolute; TOP: 376px"
				runat="server" Width="896px" BackColor="White" Height="174px" AutoGenerateColumns="False"
				Font-Size="X-Small" Font-Names="Verdana" ShowFooter="True" CellPadding="4" BorderWidth="1px"
				BorderStyle="None" BorderColor="#CC9966" AllowPaging="True" PageSize="5">
				<FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
				<SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
				<ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
				<Columns>
					<asp:BoundColumn Visible="False" DataField="ID" ReadOnly="True" HeaderText="ID">
						<HeaderStyle Width="250px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="ID">
						<ItemTemplate>
							<asp:Label id="Label11" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox19" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox20" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="FNAme">
						<ItemTemplate>
							<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FirstName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox3" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FirstName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="LName">
						<ItemTemplate>
							<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox1" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Email">
						<ItemTemplate>
							<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Email") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox5" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Email") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Country">
						<ItemTemplate>
							<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox7" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="isMember">
						<ItemTemplate>
							<asp:Label id="Label10" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isMember") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox17" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox18" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isMember") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Status">
						<ItemTemplate>
							<asp:Label id="Label12" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Status") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox21" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox22" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Status") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="DateLastPayment">
						<ItemTemplate>
							<asp:Label id="Label13" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DateLastPayment") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox23" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox24" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DateLastPayment") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Level">
						<ItemTemplate>
							<asp:Label id="Label14" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Level") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox25" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox26" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Level") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<HeaderStyle HorizontalAlign="Center" Width="50px" VerticalAlign="Middle"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
						<ItemTemplate>
							<asp:ImageButton id="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit" ImageUrl="picture\icon_edit.jpg"></asp:ImageButton>
						</ItemTemplate>
						<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="#330099" Position="TopAndBottom"
					BackColor="#FFFFCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
			<asp:Label id="Label7" style="Z-INDEX: 104; LEFT: 16px; POSITION: absolute; TOP: 352px" runat="server"
				Width="248px" CssClass="alertstitle">Suspended users</asp:Label>
			<asp:datagrid id="DataGrid1" style="Z-INDEX: 102; LEFT: 16px; POSITION: absolute; TOP: 72px" runat="server"
				Width="896px" BackColor="White" Height="174px" AutoGenerateColumns="False" Font-Size="X-Small"
				Font-Names="Verdana" ShowFooter="True" CellPadding="4" BorderWidth="1px" BorderStyle="None"
				BorderColor="#CC9966" AllowPaging="True" PageSize="5">
				<FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
				<SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
				<ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
				<Columns>
					<asp:BoundColumn Visible="False" DataField="ID" ReadOnly="True" HeaderText="ID">
						<HeaderStyle Width="250px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="ID">
						<ItemTemplate>
							<asp:Label id="Label11" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox19" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox20" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="FNAme">
						<ItemTemplate>
							<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FirstName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox3" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FirstName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="LName">
						<ItemTemplate>
							<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox1" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Email">
						<ItemTemplate>
							<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Email") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox5" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Email") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Country">
						<ItemTemplate>
							<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox7" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="isMember">
						<ItemTemplate>
							<asp:Label id="Label10" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isMember") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox17" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox18" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isMember") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Status">
						<ItemTemplate>
							<asp:Label id="Label12" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Status") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox21" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox22" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Status") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="DateLastPayment">
						<ItemTemplate>
							<asp:Label id="Label13" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DateLastPayment") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox23" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox24" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DateLastPayment") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Level">
						<ItemTemplate>
							<asp:Label id="Label14" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Level") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="Textbox25" runat="server" Width="200px" Visible="False"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="Textbox26" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Level") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<HeaderStyle HorizontalAlign="Center" Width="50px" VerticalAlign="Middle"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
						<ItemTemplate>
							<asp:ImageButton id="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit" ImageUrl="picture\icon_edit.jpg"></asp:ImageButton>
						</ItemTemplate>
						<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="#330099" Position="TopAndBottom"
					BackColor="#FFFFCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
			<asp:Label id="Label6" style="Z-INDEX: 103; LEFT: 16px; POSITION: absolute; TOP: 48px" runat="server"
				Width="248px" CssClass="alertstitle">Expired users</asp:Label>
			<asp:Button id="Button2" style="Z-INDEX: 108; LEFT: 416px; POSITION: absolute; TOP: 928px" runat="server"
				Width="104px" CssClass="INPUTBUTTON" Text="Main"></asp:Button>
		</form>
	</body>
</HTML>
