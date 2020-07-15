<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default7.aspx.vb" Inherits="Default7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script>
    function switchHeight() {
        document.getElementById('cell').height = window.innerHeight-50;
    } 
</script>
</head>
<body  onload="switchHeight()">
   <FORM NAME="bull">


<table  border=1> 
<tr> 
<td bgcolor="blue" id="cell">
 
</td> 
</tr> 
</table> 


</FORM>
</body>
</html>
