<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DeleteUser.aspx.vb" Inherits="DeleteUser" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      
         <table>
   
   <tr>
    <td align=center colspan=2 class="head09">
      DELETE USERS
    </td>
   </tr>
   
   
    <tr>
    <td height=50>
        
    </td>
   </tr>

               <tr>
    <td class="head09">
        From User
    </td>
       
     <td>
        <asp:TextBox ID="txtFromUser" runat="server" MaxLength=5></asp:TextBox>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To User&nbsp;
          <asp:TextBox ID="txtToUser" runat="server" MaxLength=5></asp:TextBox>
         &nbsp;&nbsp;</td>
   </tr>



                     <tr>
    <td class="head09" height="50">
       
    </td>
       
     <td>
     
     
     </td>
   </tr>


                          <tr>
    <td class="head09">
       
    </td>
       
     <td>
          
     <asp:Button ID="btnDelete"
            runat="server" Text="Delete Users" OnClientClick="return confirm('Are you sure you want to Delete users ?')" Width="104px" style="height: 29px" OnClick="btnDelete_Click" />
            
       <asp:Button id="btnMain" 
                style="Z-INDEX: 110; LEFT: 387px; POSITION: absolute; TOP: 323px" runat="server"
				Text="Main" Width="112px" CssClass="INPUTBUTTON" CausesValidation="False"></asp:Button>
     
     </td>
   </tr>




    </table>
    </form>
</body>
</html>
