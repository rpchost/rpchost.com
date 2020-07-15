
Partial Class CryptoDeposit
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If (rdDeposit.SelectedValue = 100) Then
            Response.Redirect("https://commerce.coinbase.com/checkout/245b51df-04d7-4db2-a0f9-fe6f4b1d98fd")
        End If
        If (rdDeposit.SelectedValue = 200) Then
            Response.Redirect("https://commerce.coinbase.com/checkout/079bb581-0657-4dd9-973f-7867ff2495df")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=CryptoDeposit")
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub
End Class
