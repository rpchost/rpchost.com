<%@ Page Language="VB" AutoEventWireup="false" CodeFile="chart.aspx.vb" Inherits="chart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rpchost Forex Chart</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center><div id="insertChartsWidget"></div>
    <script language="javascript" type="text/javascript">
        var etoroWidth = "700"; // Table width
        var etoroHeight = "450"; // Table height
        var etoroScrolling = "no"; // Scrolling (yes/no)
        var etoroURL = "http://www.etoro.com"; // Tracking URL
        var etoroCurency1 = "2";    // 1 - USD, 2 - EUR, 3- GBP, 4 - JPY, 5 - AUS, 6 - CHF, 7 - CAD
        var etoroCurency2 = "1";    // Available pairs: 2:1, 3:1, 1:4, 3,1: 1:6, 1:7, 2:3, 2:6, 2:4
    </script>
    <script type="text/javascript" src="http://widgets.etoro.com/charts/ChartsJS.aspx?v=2"></script>
    <div style='font-size:13px;font-family:Trebuchet MS;'>
    <a href="http://www.etoro.com" onClick="openEtoro(etoroURL); return false;" alt="eToro" title="eToro">eToro</a><a href="http://www.etoro.com" onClick="openEtoro(etoroURL); return false;" alt="eToro" title="eToro"> </a><a href="http://www.etoro.com" onClick="openEtoro(etoroURL); return false;" alt="Forex Trading Platform" title="Forex Trading Platform">Forex Trading Platform</a></div>
</center> 
    </div>
    </form>
</body>
</html>
