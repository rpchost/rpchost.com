Imports System.Data.OleDb

Partial Class DepositBtc
    Inherits System.Web.UI.Page

    Private Amount As Double


    Protected Sub txtDepositAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDepositAmount.TextChanged


        If (Not IsNumeric(txtDepositAmount.Text.Trim)) Then
            Response.Write("<script>alert('Not valid BTC')</script>")
            lblRef.Text = ""
            Ref.Text = ""
            txtDepositAmount.Text = ""
        Else
            lblRef.Text = "Please write the following reference in your payment message"
            Ref.Text = "RPC REF " & Session("UserID") & "-" & txtDepositAmount.Text
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=DepositBtc")
        End If


        Dim res As String = isUserHasPendingPayments(Session("UserID"))

        If (res <> "") Then
            lblStatus.Text = "You have a bitcoin order in " & res & " mode"
            txtDepositAmount.Text = Amount
            txtDepositAmount.Enabled = False
            If (res = "Process") Then
                btnCancelPayment.Enabled = False
                btnSubmit.Enabled = False
            Else
                btnCancelPayment.Enabled = True
                btnSubmit.Enabled = False
            End If

        End If

    End Sub


    Protected Function isUserHasPendingPayments(ByVal userId As Integer) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = Nothing


        reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and paymentMethod = 'Bitcoin' ")

        Try

            Dim res As String = ""

            If reader.HasRows = True Then

                reader.Read()

                res = reader("Status")
                Amount = reader("AmountBTC")
         
            End If

            Return res

        Catch ex As Exception
            Response.Redirect(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If (Not IsNumeric(txtDepositAmount.Text.Trim)) Then
            Response.Write("<script>alert('Not valid BTC')</script>")

        Else

            Dim opExec As New rpchost.cs_Operation
            Try
                opExec.ExecuteSql("insert into Payments (UserID, AmountBTC, [Currency], dtDatePayment,PaymentMethod, [Status]) values (" & Session("UserID") & "," & txtDepositAmount.Text & ",'BTC','" & Logger.GenerateTimeZone("Eastern Standard Time") & "','Bitcoin','Pending')")
                Response.Redirect("Transactions.aspx")
            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End If
    End Sub

    Protected Sub btnCancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelPayment.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=DepositBtc")
        End If

        Dim opExec As New rpchost.cs_Operation
        Try
            opExec.ExecuteSql("update Payments set [Status]='Canceled' where UserID=" & Session("UserID") & " and [Status] = 'Pending' and PaymentMethod= 'Bitcoin'")

            Response.Redirect("Transactions.aspx")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub
End Class
