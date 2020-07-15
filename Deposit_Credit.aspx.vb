Imports System.Data.OleDb

Partial Class Deposit_Credit
    Inherits System.Web.UI.Page


    Protected amount As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Credit")
        End If

        Dim rate As New Rate
        txtMonthlyProfit.Text = "Be your own bank"

        If (isUserVerified(Session("UserID")) = False) Then
            lblVerify.Text = "To pay with your Credit Card You have to be verified. Verify your documents <a href=profile.aspx>here</a>"

            btnSubmit.Enabled = False
            btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
            btnSubmit.Text = "Verify your acount First "

            txtDepositAmount.Enabled = False

        End If

        If (isUserHasPendingCreditCardPayment(Session("UserID")) = True) Then
            lblVerify.Text = "You have a pending Payment, please wait until we finish processing it"

            btnSubmit.Enabled = False
            btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
            btnSubmit.Text = "Payment in Process"

            txtDepositAmount.Enabled = False
            txtDepositAmount.Text = amount

        End If

    End Sub

    Protected Function isUserVerified(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Verification where PassportStatus='Verified' and ProofStatus='Verified' and UserID = " & Session("UserID"))
        Try

            Dim res As Boolean


            If reader.HasRows = True Then
                res = True

            Else

                res = False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function


    Protected Function isUserHasPendingCreditCardPayment(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where PaymentReceived = 0 and PaymentMethod = 'USDBTCCREDITCARD' and UserID = " & Session("UserID"))
        Try

            Dim res As Boolean


            If reader.HasRows = True Then
                reader.Read()

                res = True
                amount = reader("AmountUSD")
            Else

                res = False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Try
            If (Convert.ToDouble(txtDepositAmount.Text.Trim) <= 0) Then

                Response.Write("<script>alert('Amount must be positive number')</script>")

                Return
            End If

            If (Convert.ToDouble(txtDepositAmount.Text.Trim) < 20) Then

                Response.Write("<script>alert('Amount must be at least 20 usd')</script>")

                Return
            End If

            If (txtDepositAmount.Text.Trim.Equals("")) Then
                Response.Write("<script>alert('Amount must not be empty')</script>")
                Return
            End If

            'Response.Redirect("Deposit_Credit_Detail.aspx?sum=" & txtDepositAmount.Text & "&id=" & Request.QueryString("id"))

        Catch ex As Exception
            Response.Write("<script>alert('Amount must be valid number')</script>")
            Return
        End Try

        Dim btc As New Rate
        btc.GetBtcAskPrice()


        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Payments (UserID,AmountUSD,[Currency],BUY_Price,dtDatePayment,PaymentMethod) values (" & Session("UserID") & "," & Request("txtDepositAmount") & ",'USD'," & btc.GetBtcAskPrice() & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "','USDBTCCREDITCARD') ")
        opExec.closeConnection()

        Response.Redirect("Deposit_Credit.aspx")

    End Sub
End Class
