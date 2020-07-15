
Partial Class Deposit_Credit_Detail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Credit_Detail")
        End If


        Dim rate As New Rate
        txtMonthlyProfit.Text ="Be your own bank"

        lblPaymentRequest.Text = "The payment request [" & Request.QueryString("sum") & " USD ] is sent to your email"

        lblEmail.Text = Session("Email")


        Dim opExec As New rpchost.cs_Operation
        Try

            opExec.ExecuteSql("insert into Payments (UserID,AmountUSD, dtDatePayment, Plan, PaymentReceived,PaymentMethod) values (" & Session("UserID") & "," & Request.QueryString("sum") & ", '" & Logger.GenerateTimeZon("Eastern Standard Time") & "'," & Request.QueryString("id") & ",0,'Credit Card') ")

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try


    End Sub
End Class
