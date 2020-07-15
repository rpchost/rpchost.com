
Partial Class Deposit_PM
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_PM")
        End If


        Dim rate As New Rate
        txtMonthlyProfit.Text ="Be your own bank"


        If (Request.QueryString("plan") = "starter") Then
            lblPlan.Text = "Starter Plan [100] "
            lblCostFee.Text = "100 USD + 7% Fees <br>Total Amount = 107 USD"
        End If
        If (Request.QueryString("plan") = "pro") Then
            lblPlan.Text = "PRO Plan [500] "
            lblCostFee.Text = "500 USD + 7% Fees <br>Total Amount = 535 USD"
        End If



    End Sub

   
  
End Class
