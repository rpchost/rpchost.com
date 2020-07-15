Imports rpchost
Imports System.Data.OleDb

Partial Class Deposit_Bank
    Inherits System.Web.UI.Page



    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        Try
            If (Convert.ToDouble(Request("txtDepositAmount").Trim) <= 0) Then

                Response.Write("<script>alert('Amount must be positive number')</script>")

                Return
            End If
            If (Request("txtDepositAmount").Trim.Equals("")) Then
                Response.Write("<script>alert('Amount must not be empty')</script>")
                Return
            End If

            If (Request("txtSenderName").Trim.Equals("")) Then
                Response.Write("<script>alert('Sender Name must not be empty')</script>")
                Return
            End If

            If (Request("txtMTCN").Trim.Equals("")) Then
                Response.Write("<script>alert('Reference number must not be empty')</script>")
                Return
            End If


        Catch ex As Exception
            Response.Write("<script>alert('Amount must be valid number')</script>")
            Return
        End Try

        Dim opExec As New rpchost.cs_Operation


        Try



            opExec.ExecuteSql("insert into Payments (UserID,AmountUSD, dtDatePayment, PaymentMethod,[Currency],SenderName,MTCN) values (" & Session("UserID") & "," & txtDepositAmount.Text & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "','BANK','USD','" & txtSenderName.Text.Trim & "','" & txtMTCN.Text.Trim & "') ")


            Response.Redirect("Deposit_Bank.aspx")

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Bank.aspx")
        End If


        If (isPaymentInProcess(Session("UserID"))) Then
            btnSubmit.Enabled = False
            btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
            btnSubmit.Text = "In Process ... "

            txtDepositAmount.Enabled = False
            txtMTCN.Enabled = False
            txtSenderName.Enabled = False

        Else
            btnSubmit.Enabled = True
            btnSubmit.CssClass = "INPUTTEXTbtn"
            txtDepositAmount.Enabled = True
            txtMTCN.Enabled = True
            txtSenderName.Enabled = True
        End If


    End Sub

    Protected Function isPaymentInProcess(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from Payments where PaymentReceived=0 and PaymentMethod='BANK' and UserID=" & UserID)
        Try

            If reader.HasRows = True Then
                reader.Read()
                txtDepositAmount.Text = reader("AmountUSD")
                txtSenderName.Text = reader("SenderName")
                txtMTCN.Text = reader("MTCN")

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


End Class
