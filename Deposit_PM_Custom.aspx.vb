
Partial Class Deposit_PM_Custom
    Inherits System.Web.UI.Page


    Dim hiddenControl As HtmlInputHidden

    Protected Function GetAmount() As Double

        Try
            Return Request("txtDepositAmount")
        Catch ex As Exception
            Return 0
        End Try

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        txtDepositAmount.Text = Session("AmountUSD")
        lblAmountCurr.Text = Session("Currency")

    End Sub

  
End Class
