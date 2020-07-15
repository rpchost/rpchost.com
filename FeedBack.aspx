<%@ Page Language="VB" Theme="theme" AutoEventWireup="false" CodeFile="FeedBack.aspx.vb" Inherits="FeedBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>FeedBack</title>
    <LINK href="StyleSheet.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">

       	<table>
		<tr>
		        <td>
		
		<asp:Label id="Label3"  runat="server"
				CssClass="INPUTBUTTON" Width="696px"></asp:Label>
				</td>
				</tr>
				
				
				<tr>
		        <td height=40>
		
		
				</td>
				</tr>
				
				
		    <tr>
		        <td>
		             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         DataKeyNames="ID" Width=100%>
                         <Columns>
                             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="ID" />
                                 
                                 <asp:BoundField DataField="Field4" HeaderText="Device" 
                                 SortExpression="Field4" />
                                 
                             <asp:BoundField DataField="Field5" HeaderText="Message" 
                                 SortExpression="Field5" />
                             <asp:BoundField DataField="Field6" HeaderText="Type" 
                                 SortExpression="Field6" />
                             <asp:CommandField ShowEditButton="True" />
                             <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
        </asp:GridView>
		             <%--<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="SELECT * FROM [Table1]" DeleteCommand="delete from [Table1] where ID=?" updateCommand="update [Table1] set [Field4]=?,[Field5]=?,[Field6]=? where [ID]=?" >
                     </asp:AccessDataSource>--%>
		        </td>
		    </tr>
		    
		    
		     <tr>
		        <td height = 100>
		    
		    </td>
		    </tr>
		    
		   
		</table>

    </form>
</body>
</html>
