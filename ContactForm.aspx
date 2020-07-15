<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ContactForm.aspx.vb" Inherits="ContactForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
        
<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

</head>
<body>
    <form id="form1" runat="server">
    
    
    <table>
    
    
    <tr> 
    
        <td width="73" class="head09" colspan=2 align=center>Contacts</td>
		<td></td>
    
    </tr>
    
    <tr> 
    
        <td width="113" class="head10" align=left >User ID</td>
		<td><asp:textbox id="txtUserID"  CssClass="inputtext" AutoPostBack=true Runat="server"></asp:textbox> &nbsp&nbsp
            <asp:textbox id="txtUserEmail"  CssClass="inputtext" width=300 Runat="server"></asp:textbox></td>
            
    <asp:RequiredFieldValidator ControlToValidate=txtUserID runat=server  ErrorMessage="UserID required"></asp:RequiredFieldValidator>
    </tr>
    
    <tr> 
    
        <td width="73" class="head10" >Date Send</td>
		<td><asp:textbox id="txtDateSend" CssClass="inputtext" Runat="server"></asp:textbox></td>
    
    </tr>
    
    
    <tr> 
    
        <td width="73" class="head10" >User Name</td>
		<td><asp:textbox id="txtUserName" CssClass="inputtext" Runat="server"></asp:textbox></td>
    
    </tr>
    
    
     <tr> 
    
        <td width="73" class="head10" >Reply</td>
		<td><asp:textbox id="txtReply" CssClass="inputtext" Width=600 Height=140 TextMode="MultiLine" Runat="server"></asp:textbox></td>
    
    </tr>
    
      <tr> 
    
        <td width="73" class="head10" ></td>
		<td>    <asp:Button ID="btnSubmit" Runat="server" Text="Submit"  Width=100 Height=35 CssClass="inputtextbtn"></asp:Button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnMain" Runat="server" causesvalidation=false Text="MAIN" Width=100 Height=35 CssClass="inputtextbtn"></asp:Button>
		 </td>
    
    </tr>
    
    
     <tr> 
    
        <td height="50"  ></td>
		<td></td>
    
    </tr>
    
     <tr> 
    
        <td width="73" class="head10" >Feedback</td>
		<td></td>
    
    </tr>
    
     <tr> 
    
        <td colspan=2 >
        
         <asp:GridView ID="GridView1"   runat="server"
				AutoGenerateColumns="False" Font-Size="X-Small" Font-Names="Verdana" 
				BorderWidth="1px" BorderStyle="None" BorderColor="#CC9966"  Width="1200" 
				BackColor="White"  runat="server" DataKeyNames="Id" DataSourceID="AccessDataSource1">
           
           
            <Columns>
            
             <asp:BoundField DataField="ID" HeaderText="ID" HeaderStyle-Height=20  ReadOnly="True"
                    SortExpression="ID" />
                    
                <asp:BoundField DataField="UserId" HeaderStyle-Width=70 HeaderText="UserId"  ReadOnly="True"
                    SortExpression="UserId" />
                    <asp:BoundField DataField="DateSent" HeaderStyle-Width=150 HeaderText="DateSent" SortExpression="DateSent" />
                <asp:BoundField DataField="FirstName" HeaderStyle-Width=90 HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderStyle-Width=90 HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                
                <asp:BoundField DataField="Feedback" HeaderStyle-Width=550 HeaderText="Feedback" SortExpression="Feedback" />
                
                  
                             <asp:CommandField ShowDeleteButton="True" />
                             <asp:CommandField ShowEditButton="True" />
                             
            </Columns>
        </asp:GridView>
        
          <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                         DataFile="~/DB/db_maindata.mdb" SelectCommand="Select * from ContactDetails order by ID desc"  DeleteCommand="delete from [ContactDetails] where ID=?" UpdateCommand="update ContactDetails set Feedback=?, DateSent=? where ID=?" >
                     </asp:AccessDataSource>
        
        </td>
		<td></td>
    
    </tr>
    
    </table>
    
    
       
       <%-- <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/DB/db_maindata.mdb"
            SelectCommand="SELECT * FROM [Contact] ORDER BY [Id] DESC">
            
            </asp:AccessDataSource>--%>



    </form>
</body>
</html>
