Imports rpchost
Imports System.Data.OleDb

Partial Class Deposit_Payeer_Custom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Payeer_Custom")
        End If


        Dim rate As New Rate
        txtMonthlyProfit.Text = "Be your own bank"


        'lblPlan.Text = "Custom Plan"
        'lblCostFee.Text = "100 USD + 7% Fees <br>Total Amount = 107 USD"
        lblSend.Text = "Please send the USD amount to Rpchost.com Payeer address"


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

        Try
            If (Convert.ToDouble(Request("txtDepositAmount").Trim) <= 0) Then

                Response.Write("<script>alert('Amount must be positive number')</script>")

                Return
            End If
            If (Request("txtDepositAmount").Trim.Equals("")) Then
                Response.Write("<script>alert('Amount must not be empty')</script>")
                Return
            End If

        Catch ex As Exception
            Response.Write("<script>alert('Amount must be valid number')</script>")
            Return
        End Try
      
        Dim opExec As New rpchost.cs_Operation

        Try


            opExec.ExecuteSql("insert into Payments (UserID,AmountUSD,dtDatePayment, Plan, PaymentReceived,PaymentMethod,[Currency]) values (" & Session("UserID") & "," & Request("txtDepositAmount") & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "',1000,0,'PAYEER','USD') ")

            Response.Redirect("Deposit_Payeer_Custom.aspx")


        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub
End Class
