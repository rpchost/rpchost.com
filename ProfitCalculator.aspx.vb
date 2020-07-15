
Partial Class ProfitCalculator
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim rate As New Rate
        txtMonthlyProfit.Text = "22% Monthly Profit"

        Dim res As Boolean = rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & rate.btcUsdAsk & "] [Bid " & rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & rate.btcEurAsk & "] [Bid " & rate.btcEurBid & "]"
        End If
    End Sub
End Class
