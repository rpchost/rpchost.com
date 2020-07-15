Imports System.Data.OleDb

Partial Class BuyBitcoin
    Inherits System.Web.UI.Page

    Dim PC As Integer

    'Protected Sub btnPayCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayCC.Click
    '    Response.Redirect("BuyBitcoins_CCC.aspx?type=1")
    '    'Response.Redirect("Contribution.aspx")
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Dim strPaymntPaypal As Boolean = isUserHasPendingPaymentsPaypal(Session("UserID"))
        Dim strPaymntCrCd As Boolean = isUserHasPendingPaymentsCrCd(Session("UserID"))
        Dim strBankPaymntBnk As Boolean = isUserHasPendingPayments_Bnk(Session("UserID"))
        Dim strBankPaymntPerfect As Boolean = isUserHasPendingPayments_Perfect(Session("UserID"))
        Dim strBankPaymntWester As Boolean = isUserHasPendingPayments_Wester(Session("UserID"))
        Dim strRev As Boolean = isUserHasPendingPayments_Rev(Session("UserID"))
        Dim strOMT As Boolean = isUserHasPendingPayments_OMT(Session("UserID"))
        Dim strBTC As Boolean = isUserHasPendingPayments_BTC(Session("UserID"))

        btnPayCreditCard.Enabled = True

        If (strPaymntCrCd = True) Then
            lblCardPendingPaymnt.Text = "1 pending CREDITCARD transaction"
            btnPayCreditCard.Enabled = False
        End If
        'If (strPaymntPaypal = True) Then
        '    lblPayplPendingPaymnt.Text = "1 pending PAYPAL transaction"
        'End If
        If (strBankPaymntBnk = True) Then
            lblBnkPendingPaymnt.Text = "1 pending BANKTRANSFER transaction"
        End If

        If (strBankPaymntPerfect = True) Then
            lblPMPendingPaymnt.Text = "1 pending PERFECTMONEY transaction"
        End If
        If (strBankPaymntWester = True) Then
            lblWesterPendingPaymnt.Text = "1 pending WESTERUNION transaction"
        End If
        If (strRev = True) Then
            lblRevolutPendingPaymnt.Text = "1 pending REVOLUT transaction"
        End If
        If (strOMT = True) Then
            lblOMTPendingPaymnt.Text = "1 pending OMT transaction"
        End If
        If (strBTC = True) Then
            lblBtcPendingPaymnt.Text = "1 pending Bitcoin transaction"
        End If

        If (Not isUserVerified(Session("UserID"))) Then
            'lblVerMessage.Text = "Account not verified"
            'lblVerMessage.CssClass = "RedNormalText"
            'lblVerMessage.NavigateUrl = "AccountVerification.aspx"



        Else
            'lblVerMessage.Text = "Account verified"
            'lblVerMessage.CssClass = "GreenText"

            ''lblPaypalMessage.Text = "Account verified"
            '' lblPaypalMessage.CssClass = "GreenText"

            ''btnPayCC.Enabled = True
            ' btnPayPaypal.Enabled = True
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If


        AccessDataSource1.SelectCommand = "Select * from Payments where UserID=" & Session("UserID") & " order by dtDatePayment desc"
        grdHistory.DataBind()

        Dim row As Object

        Dim stat As String

        For Each row In grdHistory.Rows

            Try
                stat = DirectCast(row.FindControl("Status"), Label).Text
            Catch ex As Exception
                stat = DirectCast(row.FindControl("Status"), TextBox).Text
            End Try


            If (stat = "Pending") Then
                Try
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Red
                Catch ex As Exception
                    DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Red
                End Try

                DirectCast(row.FindControl("Button1"), Button).Enabled = True
                DirectCast(row.FindControl("Button1"), Button).Visible = True

                If DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("CREDITCARD") Or DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("Credit Card") Then
                    DirectCast(row.FindControl("btnPass"), Button).Enabled = True
                    DirectCast(row.FindControl("btnPass"), Button).Visible = False
                    DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = True
                Else
                    DirectCast(row.FindControl("btnPass"), Button).Visible = False
                    DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = False
                End If

                If DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("WESTERUNION") Then
                    DirectCast(row.FindControl("btnConfirm"), Button).Visible = True
                Else
                    DirectCast(row.FindControl("btnConfirm"), Button).Visible = False
                End If

                If DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("OMT") Then
                    DirectCast(row.FindControl("btnConfirmOmt"), Button).Visible = True
                Else
                    DirectCast(row.FindControl("btnConfirmOmt"), Button).Visible = False
                End If



            End If
            If (stat = "Finished") Then
                Try
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Green
                Catch ex As Exception
                    DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Green
                End Try
                DirectCast(row.FindControl("btnConfirm"), Button).Visible = False
                DirectCast(row.FindControl("btnConfirmOmt"), Button).Visible = False
                DirectCast(row.FindControl("Button1"), Button).Visible = False
                DirectCast(row.FindControl("btnPass"), Button).Visible = False
                DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = False

            End If

            If (stat = "Canceled" Or stat = "Refunded" Or stat = "Process" Or stat = "Declined") Then

                DirectCast(row.FindControl("btnConfirm"), Button).Visible = False
                DirectCast(row.FindControl("btnConfirmOmt"), Button).Visible = False
                DirectCast(row.FindControl("Button1"), Button).Visible = False
                DirectCast(row.FindControl("btnPass"), Button).Visible = False
                DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = False

                If (stat = "Process") Then
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Maroon

                    If DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("WESTERUNION") Then
                        DirectCast(row.FindControl("btnConfirm"), Button).Visible = True
                    Else
                        DirectCast(row.FindControl("btnConfirm"), Button).Visible = False
                    End If

                End If

            End If


            If DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("CONTRIBUTION") Then
                DirectCast(row.FindControl("btnConfirm"), Button).Visible = False
                DirectCast(row.FindControl("btnConfirmOmt"), Button).Visible = False
                DirectCast(row.FindControl("btnPass"), Button).Visible = False
                DirectCast(row.FindControl("Button1"), Button).Visible = False
                DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = False
            End If

        Next


    End Sub

    Protected Function isUserHasPendingPaymentsCrCd(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and (PaymentMethod='CREDITCARD' or PaymentMethod='Credit Card')")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then
                ' reader.Read()
                ' res = IIf(IsDBNull(reader("PaymentMethod")) Or reader("PaymentMethod") = "", "CREDIT/PAYPAL", reader("PaymentMethod"))
                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdHistory.Rows(index).FindControl("ID"), Label).Text
        Dim Status = DirectCast(grdHistory.Rows(index).FindControl("Status"), Label).Text
        Dim Amount = DirectCast(grdHistory.Rows(index).FindControl("AmountUSD"), Label).Text
        Dim OrderType = DirectCast(grdHistory.Rows(index).FindControl("OrderType"), Label).Text
        Dim PaymentMethod As String = DirectCast(grdHistory.Rows(index).FindControl("PaymentMethod"), Label).Text


        'If (Status = "Pending" And OrderType = "Sell") Then

        '    Dim opExec As New rpchost.cs_Operation
        '    opExec.ExecuteSql("update Payments set[Status]='Canceled'  where ID = " & ID)
        '    opExec.closeConnection()

        '    RecalcReserve(Convert.ToDouble(Amount))

        '    Response.Redirect("Transactions.aspx")

        'End If
        'If (Status = "Pending" And OrderType = "Buy") Then

        '    If (PaymentMethod.Equals("WESTERUNION")) Then
        '        Dim opExec As New rpchost.cs_Operation
        '        Try
        '            opExec.ExecuteSql("update Payments set [Status]='Canceled' where UserID=" & Session("UserID") & " and [Status] = 'Pending' and OrderType='Buy' and PaymentMethod='WesterUnion' ")
        '            SendNotification.Email("BUY BTC Payment with WesterUnion canceled by you on: " & Logger.GenerateTimeZone("Eastern Standard Time"), "Payment Details : " & vbCrLf & vbCrLf & " UserID = " & Session("UserID") & "<br><br>Best Regards<br>Rpchost.com ", Session("Email"))
        '        Catch ex As Exception
        '            Response.Write(ex.Message)
        '        Finally
        '            opExec.closeConnection()
        '        End Try

        '    Else
        Response.Redirect("CancelTransaction.aspx?TransactionID=" & ID)
        '  End If

        ' End If

    End Sub

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdHistory.Rows(index).FindControl("ID"), Label).Text

        Dim opExec As New rpchost.cs_Operation



        If (ID <> "") Then
            Session("TransID") = ID
            Response.Redirect("Deposit_WU.aspx")
        End If

    End Sub

    Protected Sub btnConfirmOmt_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdHistory.Rows(index).FindControl("ID"), Label).Text
        Dim Amount As String = DirectCast(grdHistory.Rows(index).FindControl("AmountUSD"), Label).Text
        Session("AmountUSD") = Amount

        Dim opExec As New rpchost.cs_Operation

        If (ID <> "") Then
            Session("TransID") = ID
            Response.Redirect("OMT.aspx")
        End If

    End Sub

    Public Shared Function BDateTime(ByVal currentTime As DateTime) As DateTime
        Dim cstTime As DateTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(currentTime, TimeZoneInfo.Local.Id, "UTC")
        Return cstTime
    End Function


    Protected Function isUserVerified(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersForex where  ID = " & Session("UserID"))
        Try

            Dim res As Boolean = False


            If reader.HasRows = True Then
                reader.Read()
                res = IIf(IsDBNull(reader("verified")) Or reader("verified") = False, False, True)

                'Session("First4Dig") = reader("VerifyFirst4Digits")
                'Session("Last4Dig") = reader("VerifyLast4Digits")

            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPaymentsPaypal(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and PaymentMethod='PAYPAL' ")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then
                ' reader.Read()
                ' res = IIf(IsDBNull(reader("PaymentMethod")) Or reader("PaymentMethod") = "", "CREDIT/PAYPAL", reader("PaymentMethod"))
                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPayments_Perfect(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and PaymentMethod='PERFECTMONEY' ")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then

                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPayments_Wester(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and PaymentMethod='WESTERUNION' ")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then

                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPayments_Rev(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and PaymentMethod='REVOLUT' ")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then

                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPayments_OMT(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and PaymentMethod='OMT' ")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then

                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPayments_BTC(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and PaymentMethod='Bitcoin' ")
        Try

            Dim res As String = ""


            If reader.HasRows = True Then

                Return True
            Else

                Return False
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingPayments_Bnk(ByVal userId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and PaymentMethod='BANKTRANSFER'")
        Try

            If reader.HasRows = True Then
                Return True
            Else

                Return False
            End If


        Catch ex As Exception
            Response.Redirect(ex.Message)
            Return False
        Finally

            opExec.closeConnection()
        End Try

    End Function


    Protected Sub btnPass_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdHistory.Rows(index).FindControl("ID"), Label).Text
        Dim PassCode As String = DirectCast(grdHistory.Rows(index).FindControl("ClientPassCode"), TextBox).Text.Trim
        Dim btnPass As String = DirectCast(grdHistory.Rows(index).FindControl("btnPass"), Button).Text.Trim
        Dim opExec As New rpchost.cs_Operation

        If (btnPass = "ReIssue Passcode") Then
            DirectCast(grdHistory.Rows(index).FindControl("ClientPassCode"), TextBox).Text = ""
            DirectCast(grdHistory.Rows(index).FindControl("btnPass"), Button).Text = "Validate Passcode"
            DirectCast(grdHistory.Rows(index).FindControl("Status"), Label).Text = "Passcode Issued"

            'Randomize()
            'Dim value As Integer = CInt(Int((1000 * Rnd()) + 1))
            Dim zone As New Logger


            '//Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
            Dim dt As DateTime = zone.GenerateTimeZone_Static("Eastern Standard Time")

            Try
                SendNotification.Email("New Passcode ReIssued", " ss = " & ID & " - Passcode Issue Sent = " & dt)
            Catch ex As Exception
            End Try

            'SendSms(ID, "", "") ' SEND SMS

            Try
                opExec.ExecuteSql("update Payments set ClientPassCode='',PassCodeDateSent='" & dt & "',[Status]='Pending' where ID = " & ID)
            Catch ex As Exception
                SendNotification.Email("Error while Updating passcode in DB", "Error = " & ex.Message)
                Return
            Finally
                opExec.closeConnection()
            End Try

            'End If

            Response.Redirect("Transactions.aspx")

        End If

        If (btnPass.Equals("Validate PassCode")) Then

            Dim zone As New Logger

            If (PassCode <> "") Then

                If (Not IsNumeric(PassCode)) Then
                    Response.Write("<script>alert('Passcode should be numeric')</script>")
                    Return
                End If
                If (PassCode.Trim.Equals("")) Then
                    Response.Write("<script>alert('Passcode should not be empty')</script>")
                    Return
                End If
                If (PassCode.Trim.Equals("0")) Then
                    Response.Write("<script>alert('Passcode should not be 0')</script>")
                    Return
                End If

                Randomize()
                Dim value As Integer = CInt(Int((1000 * Rnd()) + 1))
                Dim dt As DateTime = zone.GenerateTimeZone_Static("Eastern Standard Time")
                PC = CInt(PassCode) + value + 103
                Try
                    SendNotification.Email("Validate Passcode triggered", " ss= " & ID & " val = " & value & " - Passcode Date Sent = " & dt)
                Catch ex As Exception
                    SendNotification.Email("Error while Emailing passcode ss= " & ID, "Error = " & ex.Message)
                    Return
                End Try


                Try
                    opExec.ExecuteSql("update Payments set PassCodeDateSent='" & dt & "',ClientPassCode='" & PC & "',[Status]='Process' where ID = " & ID)
                Catch ex As Exception
                    SendNotification.Email("Error while Updating passcode in DB", "Error = " & ex.Message)
                    Return
                Finally
                    opExec.closeConnection()
                End Try

                'SendSms(ID, value, PC.ToString) ' SEND SMS

                Response.Redirect("Transactions.aspx")

            Else
                Response.Write("<script>alert('Please fill the OTP passcode you received on your phone')</script>")
                Return


            End If
        End If

    End Sub


    'Protected Sub btnPayPaypal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayPaypal.Click
    '    Response.Redirect("BuyBitcoins_CCC.aspx?type=2")
    'End Sub

    Protected Sub btnPayBankTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayBankTransfer.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=3")
    End Sub

    Protected Sub btnPayPerf_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayPerf.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=4")
    End Sub

    Protected Sub btnPayMoneyGram_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayMoneyGram.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=5")
    End Sub

    Protected Sub btnPayRevolut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayRevolut.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=6")
    End Sub

    Protected Sub btnOmt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOmt.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=7")
    End Sub

    Protected Sub btnWise_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWise.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=8")
    End Sub

    Protected Sub btnBtc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBtc.Click
        Response.Redirect("DepositBtc.aspx")
    End Sub

    Protected Sub btnCrypto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCrypto.Click
        Response.Redirect("CryptoDeposit.aspx")
    End Sub


    Protected Sub btnPayCreditCard_Click(sender As Object, e As EventArgs) Handles btnPayCreditCard.Click
        Response.Redirect("BuyBitcoins_CCC.aspx?type=9")
    End Sub
End Class
