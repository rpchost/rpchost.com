
Partial Class LendingProgram
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub

    Protected Sub btnInvest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInvest.Click
        Response.Redirect("Invest.aspx")
    End Sub

    Protected Sub btnHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHistory.Click
        Response.Redirect("history.aspx")
    End Sub
End Class
