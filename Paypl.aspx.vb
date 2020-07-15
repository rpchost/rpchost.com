Imports System.Threading

Partial Class Paypl
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If


        txtDepositAmount.Text = Session("AmountUSD")
        txtBtcAmount.Text = Session("AmountBTC")
        txtBtcAddress.Text = Session("Wallet")
        curr = Session("Currency")
        txtUserID.text = Session("UserID")
        lblAmountToPay.Text = curr & " To pay "

        Ref.Text = Session("UserID") & "-" & Session("AmountBTC") & "-" & Microsoft.VisualBasic.Right(Session("Wallet"), 5)

        'lblUSerID.Text = Session("UserID")
        'lblAmount.Text = Session("AmountUSD") + " " + curr
        'lblAmountBtc.Text = Session("AmountBTC")
        'lblWallet.Text = Session("Wallet")

        lblPyToRpc.Text = Session("AmountUSD") + " " + curr


    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("ReservePayment.aspx?Type=2")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("BuyBitcoins_CC.aspx?Type=2")
    End Sub
End Class
