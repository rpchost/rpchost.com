
Partial Class CancelTransaction
    Inherits System.Web.UI.Page

    Protected Sub rblCancel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblCancel.SelectedIndexChanged

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If


        If (rblCancel.SelectedValue = "yes") Then
            tbl1.Visible = False
            tbl2.Visible = True
        Else
            tbl1.Visible = True
            tbl2.Visible = False
        End If
    End Sub

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        If (txtMemo.Text = "") Then
            Return
        End If

        Dim sql As String = "insert into ContactDetails(UserID,FirstName,LastName,DateSent,Feedback)values(" & Session("UserID") & ",'" & Session("FirstName") & "','" & Session("LastName") & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "','" & Request("txtMemo").Trim + " - EDIT " & lblTransaction.Text & "')"
        Dim opExec As New rpchost.cs_Operation
        Try
            SendNotification.Email("EDIT transaction request sent by USerID = " & Session("UserID") & " on : " & Logger.GenerateTimeZone("Eastern Standard Time"), " FeedBack/Question :  " & Request("txtMemo").Trim + " EDIT - " & lblTransaction.Text)
        Catch ex As Exception
        End Try

        Logger.GenerateLog("EDIT transaction request sent by USerID = " & Session("UserID") & " for TransactionID = " & Request.QueryString("TransactionID"), Logger.GenerateTimeZone("Middle East Standard Time"), "PaymentsBackend.aspx")

        opExec.ExecuteSql(sql)
        opExec.closeConnection()
        btnSend.Text = "Successfully sent"
        btnSend.Enabled = False
        txtMemo.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing Or Request.QueryString("TransactionID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        lblTransaction.Text = "Transaction ID = " & Request.QueryString("TransactionID")

        If (rblCancel.SelectedValue = "yes") Then
            tbl1.Visible = False
            tbl2.Visible = True
        Else
            tbl1.Visible = True
            tbl2.Visible = False
        End If
    End Sub

    Protected Sub btnRefund_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefund.Click
        If (Session("UserID") = Nothing Or Request.QueryString("TransactionID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Dim opExec As New rpchost.cs_Operation
        Try
            Dim sql As String = "insert into ContactDetails(UserID,FirstName,LastName,DateSent,Feedback)values(" & Session("UserID") & ",'" & Session("FirstName") & "','" & Session("LastName") & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "','CANCEL - " & lblTransaction.Text & "')"
            opExec.ExecuteSql(sql)
            SendNotification.Email("Cancel transaction sent by USerID = " & Session("UserID") & " on : " & Logger.GenerateTimeZone("Eastern Standard Time"), " CANCEL - " & lblTransaction.Text)
        Catch ex As Exception
        Finally
            opExec.closeConnection()
        End Try

        opExec = New rpchost.cs_Operation
        opExec.ExecuteSql("update Payments set[Status]='Canceled'  where ID = " & Request.QueryString("TransactionID"))
        opExec.closeConnection()

        Logger.GenerateLog("Cancel transaction sent by USerID = " & Session("UserID") & " for TransactionID = " & Request.QueryString("TransactionID"), Logger.GenerateTimeZone("Middle East Standard Time"), "PaymentsBackend.aspx")

        btnRefund.Text = "Successfully issued"
        btnRefund.Enabled = False

    End Sub

    Protected Sub brnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles brnBack.Click
        Response.Redirect("BuyBitcoin.aspx")
    End Sub
End Class
