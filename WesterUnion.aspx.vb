Imports System.Threading

Partial Class WesterUnion
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If


        txtDepositAmount.Text = "Amount to Deposit " & Session("AmountUSD") & " " & Session("Currency")
       
        curr = Session("Currency")
    

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("ReservePayment.aspx?Type=5")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("BuyBitcoins_CC.aspx?Type=5")
    End Sub
End Class
