Imports System.Threading

Partial Class BankTransfers
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If


        txtDepositAmount.Text = Session("AmountUSD") + " " + Session("Currency")
       
        curr = Session("Currency")
       
        lblMsg.Text = Session("UserID") & "-" & Session("AmountUSD")

        'If (curr.Equals("EUR")) Then

        lblIBAN.Text = "GB46 REVO 0099 7076 7962 82"
            lblBIC.Text = "REVOGB21"
            lblCountry.Text = "UNITED KINGDOM"
            lblAddress.Text = ""



    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("ReservePayment.aspx?Type=3")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("BuyBitcoin.aspx")
    End Sub
End Class
