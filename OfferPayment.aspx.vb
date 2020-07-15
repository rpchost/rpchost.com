
Partial Class OfferPayment
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=OfferPayment")
        End If

        txtDepositAmount.Text = Session("SellPrice")
        txtBtcAmount.Text = Session("Amount")
        txtBtcAddress.Text = Session("Wallet")
        txtOfferID.Text = Session("OfferID")
        curr = Session("Currency")
        txtUserID.text = Session("UserID")
        lblAmountToPay.Text = curr & " you get "

        'Session("Price") = Request.QueryString("Price")
        'Session("Wallet") = Request.QueryString("Wallet")
        'Session("OfferID") = Request.QueryString("OfferID")
        'Session("Currency") = Request.QueryString("Currency")
        'Session("Amount") = Request.QueryString("Amount")

    End Sub

End Class

