<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Coin.aspx.cs" Inherits="Coin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form action="https://www.coinpayments.net/index.php" method="post">
	<input type="hidden" name="cmd" value="_pay_simple">
	<input type="hidden" name="reset" value="1">
	<input type="hidden" name="merchant" value="5dc2e74db269562aab62a766b383dfb3">
	<input type="hidden" name="item_name" value="BTC">
	<input type="hidden" name="item_desc" value="BTCtest">
	<input type="hidden" name="item_number" value="21233">
	<input type="hidden" name="invoice" value="1332">
	<input type="hidden" name="currency" value="USD">
	<input type="hidden" name="amountf" value="100.00000000">
	<input type="hidden" name="want_shipping" value="0">
	<input type="image" src="https://www.coinpayments.net/images/pub/buynow-wide-yellow.png" alt="Buy Now with CoinPayments.net">
</form>
</body>
</html>
