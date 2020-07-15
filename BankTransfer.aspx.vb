Imports System.Threading

Partial Class BankTransfer
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

        lblMsg.Text = Session("UserID") & "-" & Session("AmountUSD") & "-" & Session("AmountBTC")

        'If (curr.Equals("EUR")) Then

        lblIBAN.Text = "DE39 7001 1110 6056 9054 70"
        lblBIC.Text = "DEKTDE7GXXX"
        lblCountry.Text = "GERMANY"
        lblAddress.Text = "Handelsbank, Elsenheimer Str. 41, München, 80687"
        'End If
        

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("ReservePayment.aspx?Type=3")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("BuyBitcoin.aspx")
    End Sub
End Class
