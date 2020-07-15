Imports System.Threading

Partial Class Paypall
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        curr = Session("Currency")

        'lblUSerID.Text = Session("UserID")
        'lblAmount.Text = Session("AmountUSD") + " " + curr
        'lblAmountBtc.Text = Session("AmountBTC")
        'lblWallet.Text = Session("Wallet")

        lblPyToRpc.Text = Session("AmountUSD") + " " + curr

        Ref.Text = Session("UserID") & "-" & Session("AmountUSD")


    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("ReservePayment.aspx?Type=2")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("BuyBitcoins_CC.aspx?Type=2")
    End Sub
End Class
