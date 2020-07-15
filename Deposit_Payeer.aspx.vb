Imports rpchost
Imports System.Data.OleDb

Partial Class Deposit_Payeer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Payeer?plan=" & Request.QueryString("plan"))
        End If


        Dim rate As New Rate
        txtMonthlyProfit.Text ="Be your own bank"


        If (Request.QueryString("plan") = "starter") Then
            lblPlan.Text = "Starter Plan [100] "
            lblCostFee.Text = "100 USD + 7% Fees <br>Total Amount = 107 USD"
            lblSend.Text = "Please send the 107 USD to the below Payeer address"
        End If
        If (Request.QueryString("plan") = "pro") Then
            lblPlan.Text = "PRO Plan [500] "
            lblCostFee.Text = "500 USD + 7% Fees <br>Total Amount = 535 USD"
            lblSend.Text = "Please send the 535 USD to the below Payeer address"
        End If

        If (isPaymentInProcess(Session("UserID"))) Then
            btnPaid.Enabled = False
            btnPaid.CssClass = "INPUTTEXTbtnDisabled"
            btnPaid.Text = "In Process ... "
        Else
            btnPaid.Enabled = True
            btnPaid.CssClass = "INPUTTEXTbtn"
        End If

    End Sub

    Protected Function isPaymentInProcess(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from Payments where PaymentReceived=0 and PaymentMethod='PAYEER' and UserID=" & UserID)
        Try

            If reader.HasRows = True Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception

            'opExec.closeConnection()
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Function


    Protected Sub btnPaid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPaid.Click
        If (Request.QueryString("plan") <> 100 And Request.QueryString("plan") <> 500) Then
            Return
        End If

        Dim opExec As New rpchost.cs_Operation

        Try


            opExec.ExecuteSql("insert into Payments (UserID,AmountUSD,dtDatePayment, Plan, PaymentReceived,PaymentMethod,[Currency]) values (" & Session("UserID") & ",107,'" & Logger.GenerateTimeZon("Eastern Standard Time") & "'," & Request.QueryString("plan") & ",0,'PAYEER','USD') ")

            Response.Redirect("Deposit_Payeer.aspx?plan=" & Request.QueryString("plan"))


        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub
End Class
