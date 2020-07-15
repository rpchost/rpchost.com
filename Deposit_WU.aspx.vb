Imports rpchost
Imports System.Data.OleDb

Partial Class Deposit_WU
    Inherits System.Web.UI.Page



    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        Try
            'If (Convert.ToDouble(Request("txtDepositAmount").Trim) <= 0) Then

            '    Response.Write("<script>alert('Amount must be positive number')</script>")

            '    Return
            'End If
            'If (Request("txtDepositAmount").Trim.Equals("")) Then
            '    Response.Write("<script>alert('Amount must not be empty')</script>")
            '    Return
            'End If

            If (Request("txtSenderName").Trim.Equals("")) Then
                Response.Write("<script>alert('Sender Name must not be empty')</script>")
                Return
            End If

            If (Request("txtMTCN").Trim.Equals("")) Then
                Response.Write("<script>alert('NTCN must not be empty')</script>")
                Return
            End If


        Catch ex As Exception
            Response.Write("<script>alert('Amount must be valid number')</script>")
            Return
        End Try

        Dim opExec As New rpchost.cs_Operation

        Try

            opExec.ExecuteSql("update Payments set dtDatePayment = '" & Logger.GenerateTimeZone("Eastern Standard Time") & "', SenderName='" & Request("txtSenderName").Trim & "',MTCN='" & Request("txtMTCN").Trim & "', [Status]='Process' where ID=" & Session("TransID"))

            Try
                SendNotification.Email("WesterUnion payment confirmation: " & Session("TransID"), "Payment Details : <br><br>Transaction ID = " & Session("TransID") & "<br>UserID = " & Session("UserID") & "<br>SenderName = " & Request("txtSenderName").Trim & "<br>MTCN = " & Request("txtMTCN").Trim & " <br><br>Thank you for purchasing with Rpchost.com", Session("Email"))
            Catch ex As Exception
            End Try

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()

            Response.Redirect("Transactions.aspx")
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If
        If IsNothing(Session("TransID")) Then
            Response.Redirect("BuyBitcoins_CC.aspx?type=5")
        End If

        lblPlan.Text = Session("TransID")
        isPaymentInProcess(Session("UserID"))


        'If (isPaymentInProcess(Session("UserID"))) Then
        '    btnSubmit.Enabled = False
        '    btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
        '    btnSubmit.Text = "In Process ... "

        '    txtDepositAmount.Enabled = False
        '    txtMTCN.Enabled = False
        '    txtSenderName.Enabled = False

        'Else
        '    btnSubmit.Enabled = True
        '    btnSubmit.CssClass = "INPUTTEXTbtn"
        '    txtDepositAmount.Enabled = True
        '    txtMTCN.Enabled = True
        '    txtSenderName.Enabled = True
        'End If


    End Sub

    Protected Function isPaymentInProcess(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from Payments where ID = " & Session("TransID") & " and PaymentMethod='WESTERUNION' and UserID=" & UserID)
        Try

            If reader.HasRows = True Then
                reader.Read()
                'txtDepositAmount.Text = reader("AmountUSD")
                txtSenderName.Text = IIf(IsDBNull(reader("SenderName")), "", reader("SenderName"))
                txtMTCN.Text = IIf(IsDBNull(reader("MTCN")), "", reader("MTCN"))

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
