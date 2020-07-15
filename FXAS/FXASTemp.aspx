<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FXASTemp.aspx.vb" Inherits="FXAS_FXASTemp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body leftmargin=0 topmargin=0>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding=0 cellspacing=0 width=100%  height=600>
            <tr>
                <td height=50 bgcolor=63A24C>
                    </td>
            </tr>
             <tr>
                <td height=2>
                    </td>
            </tr>
            <tr>
                <td valign=top height=100%>
                    <table height=100% width=100% cellpadding=0 border=0 cellspacing=0>
                        <tr>
                            <td width=140 height=100% bgcolor=63A24C valign=top>
                                sas
                            </td>
                            <td width=900 valign=top>
                                 <iframe width=1200 height=550 runat=server src=statistics.aspx></iframe>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
