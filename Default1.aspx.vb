
Partial Class Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim rate As New Rate
        txtMonthlyProfit.Text = "Be your own bank"

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub
End Class
