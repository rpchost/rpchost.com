
Partial Class Deposit_CreditCard
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Write("<script language=javascript>")
        If (Request.QueryString("plan") = "starter") Then Response.Write("window.open('https://secure.shareit.com/shareit/checkout.html?cart=1&PRODUCT[300800934]=1','CustomPopUp','width=1900, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
        If (Request.QueryString("plan") = "pro") Then Response.Write("window.open('https://secure.shareit.com/shareit/checkout.html?cart=1&PRODUCT[300800935]=1','CustomPopUp','width=1900, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
        Response.Write("</script>")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_CreditCard")
        End If

        Dim rate As New Rate
        txtMonthlyProfit.Text ="Be your own bank"

        If (Request.QueryString("plan") = "starter") Then
            lblPlan.Text = "Starter Plan [100] "
            lblCostFee.Text = "100 USD + 16% Fees <br>Total Amount = 116 USD"
        End If
        If (Request.QueryString("plan") = "pro") Then
            lblPlan.Text = "Starter Plan [500] "
            lblCostFee.Text = "500 USD + 16% Fees <br>Total Amount = 580 USD"
        End If
    End Sub
End Class
