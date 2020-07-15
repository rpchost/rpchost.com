<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TradingSignals.aspx.vb" Inherits="TradingSignals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trading signals</title>
    <meta http-equiv="refresh" content="60">
    
    <LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
    
    <script type="text/javascript">
<!--        Begin
        /* This script and many more are available free online at
        The JavaScript Source!! http://javascript.internet.com
        Created by: Lee Underwood

Because this is a true refresh, you might want to put a
        notice on the page that it refreshes every "X" minutes */

        function reFresh() {
            //this.location.reload(true)
            // window.location.reload( false )


        }
        /* Set the number below to the amount of delay, in milliseconds,
        you want between page reloads: 1 minute = 60000 milliseconds. */
        //window.setInterval("reFresh()",4000);
// End -->
		</script>
		<script language="JavaScript"> <!--
		    // No rightclick script v.2.5
		    // (c) 1998 barts1000
		    // barts1000@aol.com
		    // Don't delete this header!

		    var message = "Sorry, that function is disabled"; // Message for the alert box

		    // Don't edit below!

		    function click(e) {
		        if (document.all) {
		            if (event.button == 2) {
		                alert(message);
		                return false;
		            }
		        }
		        if (document.layers) {
		            if (e.which == 3) {
		                alert(message);
		                return false;
		            }
		        }

		        if (document.layers) {
		            if (e.which == 2) {
		                alert(message);
		                return false;
		            }
		        }
		    }
		    if (document.layers) {
		        document.captureEvents(Event.MOUSEDOWN);
		    }
		    document.onmousedown = click;
// --> </script>
		<script language="JavaScript">
		    //Hide status bar msg javascript

		    function hidestatus() {
		        window.status = 'Rpchost.com; Lebanon - Beirut - [webmaster@Rpchost.com]'
		        return true
		    }

		    function hidestatus1() {
		        window.status = 'Rpchost.com; Lebanon - Beirut - [webmaster@Rpchost.com]'
		        return true
		    }

		    if (document.layers)
		        document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT | Event.KEYPRESS | Event.KEEYDOWN)

		    document.onmouseover = hidestatus
		    document.onmouseout = hidestatus
		    document.onkeypress = hidestatus1
		    document.onkeydown = hidestatus1
		</script>
		<script language="JavaScript">
		    //Hide status bar msg javascript

		    function DisableF5() {

		        //alert(event.keyCode);


		        if (event.keyCode == 116) {
		            event.keyCode = 0;
		            alert('Sorry! You can not refresh this page!');
		            event.returnValue = false;
		            return false;
		        }


		    }
		</script>
		<script language="JavaScript">

		    function disabletext(e) {
		        return false
		    }

		    function reEnable() {
		        return true
		    }

		    //if the browser is IE4+
		    document.onselectstart = new Function("return false")

		    //if the browser is NS6
		    if (window.sidebar) {
		        document.onmousedown = disabletext
		        document.onclick = reEnable
		    }
		</script>
		
		
		
</head>
<body onkeydown="DisableF5()" onkeypress="DisableF5()" onload="DisableF5()">
    <form id="form1" runat="server">
   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" 
        style="Z-INDEX: 101; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server"
				Font-Size="X-Small" Font-Names="Verdana" ShowFooter="True" CellPadding="4"
				BorderWidth="1px" BorderStyle="None" BorderColor="#CC9966" 
        Width="100%" BackColor="White"
				Height="1px">
					
					<RowStyle  CssClass="BlackSmallText8"/>							
				<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
				
        <Columns>
           <%-- <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1 />--%>
            <asp:BoundField DataField="Signal" HeaderText="Signal" SortExpression="Signal" HeaderStyle-Font-Size =7 ControlStyle-Font-Size=6 FooterStyle-Font-Size=5 HeaderStyle-Width ="230px" HeaderStyle-Height=1/>
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1/>
            <asp:BoundField DataField="dtDateSignal" HeaderText="DateOpen" 
                SortExpression="dtDateSignal" HeaderStyle-Font-Size =7 
                HeaderStyle-Width ="100px" HeaderStyle-Height=1/>
                
                 <asp:BoundField DataField="dtDateClose" HeaderText="DateClose" 
                SortExpression="dtDateClose" HeaderStyle-Font-Size =7 
                HeaderStyle-Width ="100px" HeaderStyle-Height=1/>
                
            <asp:BoundField DataField="Entry" HeaderText="Entry" SortExpression="Entry" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1/>
            <asp:BoundField DataField="SL" HeaderText="SL" SortExpression="SL" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1/>
            <asp:BoundField DataField="Target" HeaderText="Target" 
                SortExpression="Target" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1/>
                
                 <asp:BoundField DataField="Profit" HeaderText="Profit" 
                SortExpression="Profit" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1/>
                
          <%--  <asp:BoundField DataField="Comments" HeaderText="Comments" 
                SortExpression="Comments" HeaderStyle-Font-Size =7 HeaderStyle-Width ="10px" HeaderStyle-Height=1/>--%>
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/DB/db_maindata.mdb" 
        SelectCommand="SELECT [ID], [Signal], [Status], [dtDateSignal],[dtDateClose], [Entry], [SL], [Target], [Comments],[profit] FROM [Signal] where Status='T' order by dtDateSignal DESC
">
    </asp:AccessDataSource>
    </form>
</body>
</html>
