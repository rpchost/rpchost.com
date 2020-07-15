
Partial Class Deposit_Backup
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("Deposit_PM.aspx?plan=starter")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=deposit")
        End If

        Dim rate As New Rate
        txtMonthlyProfit.Text ="Be your own bank"

    End Sub

    'Protected Sub btnCreditCard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreditCard.Click
    '    Response.Redirect("Deposit_CreditCard.aspx?plan=starter")
    'End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("Deposit_PM.aspx?plan=pro")
    End Sub

    'Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
    '    Response.Redirect("Deposit_CreditCard.aspx?plan=pro")
    'End Sub

    Protected Sub btnDepositBitcoinStarter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDepositBitcoinStarter.Click
        Response.Redirect("Deposit_Bitcoin.aspx?plan=100")
    End Sub

    Protected Sub btnBitcoinDepositPro_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBitcoinDepositPro.Click
        Response.Redirect("Deposit_Bitcoin.aspx?plan=500")
    End Sub

    Protected Sub btnSubmitPayeer100_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitPayeer100.Click
        Response.Redirect("Deposit_Payeer.aspx?plan=starter")
    End Sub

    Protected Sub btnSubmitPayeer500_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitPayeer500.Click
        Response.Redirect("Deposit_Payeer.aspx?plan=pro")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Deposit_PM_Custom.aspx")
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Response.Redirect("Deposit_Payeer_Custom.aspx")
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Response.Redirect("Deposit_Bitcoin_Custom.aspx")
    End Sub

    Protected Sub btnDepositCustCreditCard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDepositCustCreditCard.Click
        Response.Redirect("Deposit_Credit.aspx?id=custom")
    End Sub

    Protected Sub btnDepositCreditStarter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDepositCreditStarter.Click
        Response.Redirect("Deposit_Credit.aspx?id=starter")
    End Sub

    Protected Sub btnDepositCreditPro_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDepositCreditPro.Click
        Response.Redirect("Deposit_Credit.aspx?id=pro")
    End Sub
End Class
