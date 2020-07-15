<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SetInterestRate.aspx.vb" Inherits="SetInterestRate" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>

<LINK rel="stylesheet" type="text/css" href="StyleSheet.css">

<body>
    <form id="form1" runat="server">
    <table width=100%>
    
    
      <tr>
            <td colspan=2 align=center class=head08>
                    Set System Interest Rate
            </td>
        </tr>
          <tr>
            <td colspan=2 align=center height=100>
                  
            </td>
        </tr>
    
        <tr>
            <td class=BlackTextBold width=200>
            Interet Rate
            </td>
            <td>
              <asp:TextBox runat=server ID=txtRate CssClass=INPUTTEXT></asp:TextBox>
            </td>
        </tr>
        
        
       
        
          <tr>
            <td height=50>

            </td>
            <td>
                
            </td>
        </tr>
        
        <tr>
            <td class=BlackTextBold>
             Change Rate
            </td>
            <td>
                <asp:Button ID=btnChangeRate runat=server Text="Change Rate" Width=150 SkinID=ButtonSkin Height=35 />
                
            </td>
        </tr>
         <tr>
            <td>
             
            </td>
            <td>
                <asp:Label runat=server ID=lblMess CssClass=RednormalTextBold></asp:Label>
                
            </td>
        </tr>
        
        
    </table>
    </form>
</body>
</html>
