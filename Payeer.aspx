<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payeer.aspx.cs" Inherits="Payeer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form method="post" action="https://payeer.com/Rpchost/">
<input type="hidden" name="m_shop" value="Rpchost">
<input type="hidden" name="m_orderid" value="1">
<input type="hidden" name="m_amount" value="100.00">
<input type="hidden" name="m_curr" value="USD">
<input type="hidden" name="m_desc" value="TEST">


<input type="submit" name="m_process" value="send" />
</form>
</body>
</html>
