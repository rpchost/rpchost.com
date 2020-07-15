<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default10.aspx.vb" Inherits="Default10" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type = "text/javascript">

 function SetTarget() {

     document.forms[0].target = "_blank";

 }

</script>

 <script type="text/javascript">
     function SetText() {
         if (Button1.value == "Disable automatic page refresh")
             Button1.value = "Automatic Refresh Disabled";
         return false;
     }
    </script>

</head>
<body>
 <form id="form1" runat="server" method="post">
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div id="main">
	<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>--%>
			<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
			
			<%--<asp:label ID="lbl" runat="server"  />
			
		    <br />
            <br />
            <br />
			
		</ContentTemplate>
		
		<Triggers>
    <asp:PostBackTrigger ControlID="Button1" />
  </Triggers>
  
	</asp:UpdatePanel>
	
	<anthem:textbox runat=server></anthem:textbox>--%>
</div>
</form>
</body>
</html>