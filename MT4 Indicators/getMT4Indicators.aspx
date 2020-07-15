<%@ Page Language="VB" AutoEventWireup="false" CodeFile="getMT4Indicators.aspx.vb" Inherits="getMT4Indicators" %>

<HTML>


<body leftMargin=0 topmargin=0 > 
		
					<form id="Form1" method="post" runat="server">
						
									<TABLE borderColor="#000000" height="50%" cellSpacing="0" cellPadding="0" align="center"
										border="1" >
										<TR>
											<TD width="50%" >

<asp:DataGrid runat="server" id="articleList" Font-Name="Verdana"
    AutoGenerateColumns="False" AlternatingItemStyle-BackColor="#eeeeee"
    HeaderStyle-BackColor="Navy" HeaderStyle-ForeColor="White"
    HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True">
  <Columns>
    <asp:HyperLinkColumn DataNavigateUrlField="Name" DataTextField="Name" 
           HeaderText="Indicator Name" />
    
    <asp:BoundColumn DataField="Length" HeaderText="File Size"
		ItemStyle-HorizontalAlign="Right" 
		DataFormatString="{0:#,### bytes}" />
  </Columns>
</asp:DataGrid>  

			</TD>
							</TR>
						</TABLE>
					</form>
					
	</body>
</HTML>