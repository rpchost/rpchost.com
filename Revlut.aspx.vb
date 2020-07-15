
Partial Class Revlut
    Inherits System.Web.UI.Page



    'Protected Sub chkRev_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkRev.CheckedChanged
    '    If (chkRev.Checked) Then
    '        btnSubmit.Enabled = True
    '    Else
    '        btnSubmit.Enabled = False
    '    End If
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        'If (chkRev.Checked) Then
        '    btnSubmit.Enabled = True
        'Else
        '    btnSubmit.Enabled = False
        'End If

        txtDepositAmount.Text = Session("AmountUSD")
      
        lblAmountToPay.Text = Session("Currency") & " To pay "
        txtRevolutPhone.Text = Session("RevolutPhone")

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Payments (UserID,AmountUSD,dtDatePayment,BUY_Price, PaymentMethod,[Status],OrderType,[Currency],RevolutPhoneNumber) values (" & Session("UserID") & "," & Session("AmountUSD") & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "'," & Session("BTCBuyPrice") & ",'REVOLUT','Pending','Buy','" & Session("Currency") & "','" & Session("RevolutPhone") & "') ")

        Try
            SendNotification.Email("Revolut Payment Request", "Payment Details : <br><br> UserID = " & Session("UserID") & "<br>AmountUSD = " & Session("AmountUSD") & "<br>Currency = " & Session("Currency") & "<br>DatePayment = " & Logger.GenerateTimeZone("Eastern Standard Time") & "<br>Revolut Phone Number = " & txtRevolutPhone.Text & "<br> Payment Method = Revolut<br>Transaction status : PENDING<br><br>Thank you for purchasing with Rpchost.com", Session("Email"))
        Catch ex As Exception

        Finally
            opExec.closeConnection()

            Response.Redirect("Transactions.aspx")
        End Try
    End Sub
End Class
