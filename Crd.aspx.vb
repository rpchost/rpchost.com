
Partial Class Crd
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        If (txtPhone.Text.Trim = "" Or txtAmount.Text.Trim = "") Then
            Response.Write("<script>alert('Amount and phone should not be empty')</script>")
            Return
        End If
        If (txtAmount.Text <> "" And Not IsNumeric(txtAmount.Text.Trim)) Then
            Response.Write("<script>alert('Amount should be numric')</script>")
            Return
        End If

        Dim zone As New Logger

        Dim opExec As New rpchost.cs_Operation
        Dim ss As Integer = opExec.ExecuteScalaredSql("insert into Payments (UserID,AmountUSD,dtDatePayment,PaymentMethod,[Status],OrderType,[Currency]) values (" & Session("UserID") & "," & txtAmount.Text & ",'" & zone.GenerateTimeZone_Static1("Eastern Standard Time") & "','Credit Card','Pending','Buy','EUR') ")

        Try
            SendNotification.Email("NEW CR CD VAL ", " ss = " & ss)

            Logger.GenerateLog("New Deposit created [Credit Card]; Transaction ID = " & ss, Logger.GenerateTimeZone("Middle East Standard Time"), "PaymentsBackend.aspx")


        Catch ex As Exception
            SendNotification.Email("Error while Emailing New SS request ss= " & ss, "Error = " & ex.Message)
            Return
        Finally
            opExec.closeConnection()
            Response.Redirect("BuyBitcoin.aspx")
        End Try

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        txtPhone.Text = Session("Phone")
    End Sub
End Class
