Imports System.Data.OleDb

Partial Class MyAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=myaccount")
        End If

        Dim rate As New Rate
        Dim InterestRate As Integer
        InterestRate = rate.GetInterestRate()

        txtMonthlyProfit.Text = "Be your own bank"

        getAccountBalanceUSD(Session("UserID"))
        setUserExchangeFields(Session("UserID"))
        getWithdrawRequests(Session("UserID"))

        getTransferRequests(Session("UserID"))

        txtBitcoinWallet.Text = getBitcoinAddress(Session("UserID"))

        Dim btc As New Rate
        lblBTC.Text = "BTC [ASK] = $ " & btc.GetBtcAskPrice() & " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BTC [BID] = $ " & btc.GetBtcBidPrice()


    End Sub


    Protected Sub getAccountBalanceUSD(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Account where UserID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                txtUsdBalance.Text = IIf(IsDBNull(reader("BalanceUSD")), 0, reader("BalanceUSD"))
                txtBtcBalance.Text = IIf(IsDBNull(reader("BalanceBTC")), 0, reader("BalanceBTC"))
                txtBTCWithdraw.Text = IIf(IsDBNull(reader("BalanceBTC")), 0, reader("BalanceBTC"))

            Else

                txtUsdBalance.Text = 0
                txtBtcBalance.Text = 0

            End If

        Catch ex As Exception
            Response.Write("getAccountBalanceUSD " & ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Sub getWithdrawRequests(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from WithdrawalRequests where UserID = " & Session("UserID") & " and DoneByAdmin = 0 ")
        Try

            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("WithdrawUsd"))) Then
                        txtUsdTobeWithdrawn.Text = IIf(IsDBNull(reader("WithdrawUsd")), 0, reader("WithdrawUsd"))

                        btnWithdraw.Enabled = False
                        txtUsdTobeWithdrawn.Enabled = False
                        btnWithdraw.CssClass = "INPUTTEXTbtnDisabled"
                        btnWithdraw.Text = "in Process..."
                        lblWithdrawMess.Text = "Withraw amount in process .... "

                        txtExchangeUSD.Enabled = False
                        btnExchangeUSD.CssClass = "INPUTTEXTbtnDisabled"
                        btnExchangeUSD.Enabled = False

                    End If

                    If (Not IsDBNull(reader("WithdrawBtc"))) Then
                        txtBTCWithdraw.Text = IIf(IsDBNull(reader("WithdrawBtc")), 0, reader("WithdrawBtc"))

                        btnWithdrawBTC.Enabled = False
                        txtBtcBalance.Enabled = False
                        btnWithdrawBTC.CssClass = "INPUTTEXTbtnDisabled"
                        btnWithdrawBTC.Text = "in Process..."
                        lblWithdrawMess.Text = "Withraw amount in process .... "

                        txtExchangeBTC.Enabled = False
                        btnExchangeBTC.CssClass = "INPUTTEXTbtnDisabled"
                        btnExchangeBTC.Enabled = False
                    End If

                End While

            End If


        Catch ex As Exception
            Response.Write("getAccountBalanceUSD " & ex.Message)
        Finally
            opExec.closeConnection()
        End Try

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

    Protected Sub getTransferRequests(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Transfer where UserID = " & Session("UserID") & " and DoneByAdmin = 0 ")
        Try

            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("UsdAmount")) And reader("UsdAmount") <> 0) Then
                        'txtTransferUSD.Text = IIf(IsDBNull(reader("UsdAmount")), 0, reader("UsdAmount"))
                        'txtUsdUserID.Text = IIf(IsDBNull(reader("ToUserID")), 0, reader("ToUserID"))

                        'btnTransferUSD.Enabled = False
                        'txtTransferUSD.Enabled = False
                        'txtUsdUserID.Enabled = False
                        'btnTransferUSD.CssClass = "INPUTTEXTbtnDisabled"
                        'btnTransferUSD.Text = "in Process..."


                    End If

                    If (Not IsDBNull(reader("BtcAmount")) And reader("BtcAmount") <> 0) Then
                        'txtTransferBtc.Text = IIf(IsDBNull(reader("BtcAmount")), 0, reader("BtcAmount"))
                        'txtBtcUserID.Text = IIf(IsDBNull(reader("ToUserID")), 0, reader("ToUserID"))

                        'btnTransferBtc.Enabled = False
                        'txtTransferBtc.Enabled = False
                        'txtBtcUserID.Enabled = False
                        'btnTransferBtc.CssClass = "INPUTTEXTbtnDisabled"
                        'btnTransferBtc.Text = "in Process..."

                    End If

                End While

            End If

        Catch ex As Exception
            Response.Write("getAccountBalanceUSD " & ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Function isUserLended(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Investment where UserID = " & Session("UserID") & " and Lended=yes")
        Try

            If reader.HasRows = True Then

                Return True

            Else

                Return False

            End If

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

    End Function


    Protected Sub setUserExchangeFields(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ExchangeRequest where UserID = " & Session("UserID") & " and DoneByAdmin = 0 ")
        Try

            If reader.HasRows = True Then

                While (reader.Read)

                    If (Not IsDBNull(reader("UsdAmountSentFromAccount"))) Then
                        If (reader("UsdAmountSentFromAccount") > 0) Then
                            txtExchangeUSD.Text = reader("UsdAmountSentFromAccount")
                            txtExchangeUSD.Enabled = False
                            btnExchangeUSD.CssClass = "INPUTTEXTbtnDisabled"
                            btnExchangeUSD.Text = "Sending ... "
                            btnExchangeUSD.Enabled = False

                            btnWithdraw.Enabled = False
                            txtUsdTobeWithdrawn.Enabled = False
                            btnWithdraw.CssClass = "INPUTTEXTbtnDisabled"

                        End If
                    End If

                    If (Not IsDBNull(reader("BtcAmountSentFromAccount"))) Then
                        If (reader("BtcAmountSentFromAccount") > 0) Then
                            txtExchangeBTC.Text = reader("BtcAmountSentFromAccount")
                            txtExchangeBTC.Enabled = False
                            btnExchangeBTC.CssClass = "INPUTTEXTbtnDisabled"
                            btnExchangeBTC.Text = "Sending ... "
                            btnExchangeBTC.Enabled = False

                            btnWithdrawBTC.Enabled = False
                            txtBTCWithdraw.Enabled = False
                            btnWithdrawBTC.CssClass = "INPUTTEXTbtnDisabled"
                        End If
                    End If

                End While

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Function isUserHasCreditCard(ByVal userId As Integer) As Boolean


        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from CreditCard where  UserID = " & Session("UserID"))
        Try

            Dim res As Boolean = True


            If reader.HasRows = True Then
                reader.Read()

                If (Not IsDBNull(reader("CardNumber"))) Then
                    If (reader("CardNumber") = "") Then
                        res = False
                    End If

                Else
                    res = False
                End If

                If (IsDBNull(reader("ExpiryMonth"))) Then

                    res = False



                End If
                If (IsDBNull(reader("ExpiryYear"))) Then


                    res = False

                End If
                If (Not IsDBNull(reader("CardHolderName"))) Then
                    If (reader("CardHolderName") = "") Then
                        res = False
                    End If
                End If
                If (IsDBNull(reader("CVV"))) Then


                    res = False

                End If


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

    Protected Function isWithdrawMethodSetted(ByVal UserID As Integer, ByVal WithdrawMethod As String) As Boolean

        Dim str As String = ""
        Dim res As Boolean = False

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where ID = " & Session("UserID") & " ")

        Try

            If reader.HasRows = True Then

                reader.Read()


                If (WithdrawMethod.Equals("PM")) Then
                    If (Not IsDBNull(reader("PerfectMoney")) And Not reader("PerfectMoney").Equals("")) Then res = True Else res = False
                End If

                If (WithdrawMethod.Equals("PAYEER")) Then
                    If (Not IsDBNull(reader("Payeer")) And Not reader("Payeer").Equals("")) Then res = True Else res = False
                End If

                If (WithdrawMethod.Equals("BANK")) Then
                    If (Not IsDBNull(reader("BankHolderName")) And Not reader("BankHolderName").Equals("") And Not IsDBNull(reader("Swift")) And Not reader("Swift").Equals("") And Not IsDBNull(reader("BankName")) And Not reader("BankName").Equals("") And Not IsDBNull(reader("IBAN")) And Not reader("IBAN").Equals("") And Not IsDBNull(reader("AccountNum")) And Not reader("AccountNum").Equals("")) Then res = True Else res = False
                End If


            End If

            Return res

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Function


    Private Function getBitcoinAddress(ByVal UserID As String) As String

        Dim str As String = ""
        Dim res As String = ""

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where ID = " & UserID)

        Try

            If reader.HasRows = True Then
                reader.Read()

                If (Not IsDBNull(reader("BitcoinWallet"))) Then res = reader("BitcoinWallet") Else res = ""
            Else
                res = ""
            End If

            Return res

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Function

    Protected Sub btnWithdraw_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWithdraw.Click

        lblWithdrawMess.Text = ""

        If (txtUsdTobeWithdrawn.Text.Trim.Equals("") Or Not IsNumeric(txtUsdTobeWithdrawn.Text.Trim)) Then
            lblWithdrawMess.Text = "Invalid USD amount to withdraw"
            Return
        End If

        If (Convert.ToDouble(txtUsdTobeWithdrawn.Text.Trim) > Convert.ToDouble(txtUsdBalance.Text.Trim)) Then
            lblWithdrawMess.Text = "USD amount to withdraw is greater then the USD Balance"
            Return
        End If

        tblWithdraw.Visible = True
        tblWithdrawBTC.Visible = False

        lblWithdrawUSD.Visible = True
        lblWithdrawBtc.Visible = False

        tblWithdraw.Visible = True

        lblWithdrawUSD.Visible = True
        lblWithdrawBtc.Visible = False

    End Sub

    Protected Sub btnWithdrawBTC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWithdrawBTC.Click

        lblWithdrawMess.Text = ""

        If (txtBTCWithdraw.Text.Trim.Equals("") Or Not IsNumeric(txtBTCWithdraw.Text.Trim)) Then
            lblWithdrawMess.Text = "Invalid BTC amount to withdraw"
            Return
        End If

        If (Convert.ToDouble(txtBTCWithdraw.Text.Trim) > Convert.ToDouble(txtBtcBalance.Text.Trim)) Then
            lblWithdrawMess.Text = "BTC amount to withdraw is greater than the BTC Balance"
            Return
        End If


        tblWithdrawBTC.Visible = True
        tblWithdraw.Visible = False

        lblWithdrawUSD.Visible = False
        lblWithdrawBtc.Visible = True

    End Sub


    Protected Sub btnConfirmWithdrawUSD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirmWithdrawUSD.Click

        If (RdWithdraw.SelectedValue <> "CREDITCARD" And isWithdrawMethodSetted(Session("UserID"), RdWithdraw.SelectedValue) = False) Then

            lblWithdrawMess.Text = " Your " & RdWithdraw.SelectedValue & " account is not setted. Go to your <a href=profile.aspx>profile</a> section and set the " & RdWithdraw.SelectedValue & " data"


        ElseIf (RdWithdraw.SelectedValue = "CREDITCARD" And isUserHasCreditCard(Session("UserID")) = False) Then

            lblWithdrawMess.Text = " Your CREDIT CARD account is not setted. Go to your <a href=profile.aspx>profile</a> section and set the CREDIT CARD data"

        ElseIf (isUserVerified(Session("UserID")) = False And RdWithdraw.SelectedValue = "CREDITCARD") Then
            lblWithdrawMess.Text = " You have to verify your documents before withdrawing to CreditCard. Go to your <a href=profile.aspx>profile</a> section and verify your documents"

        Else

            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("insert into WithdrawalRequests (UserID,WithdrawUsd,DateRequest,WithdrawMethod) values (" & Session("UserID") & "," & Request("txtUsdTobeWithdrawn") & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "','" & RdWithdraw.SelectedValue & "') ")
            opExec.closeConnection()

            Response.Redirect("account.aspx")

        End If


    End Sub

    Protected Sub btnConfirmWithdrawBTC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirmWithdrawBTC.Click
        If (txtBTCWithdraw.Text.Trim.Equals("") Or txtBitcoinWallet.Text.Trim.Equals("")) Then
            lblWithdrawMess.Text = "Invalid BTC address, Change your BTC address in your <a href=profile.aspx>profile</a> section"
            Return
        End If

        'Dim opExec As New rpchost.cs_Operation
        'opExec.ExecuteSql("Update Account set WithdrawBTC = " & txtBTCWithdraw.Text & ",WithdrawBtcToWallet='" & txtBitcoinWallet.Text & "',BtcWithDrawInProcess=1 where UserID= " & Session("UserID"))
        'opExec.closeConnection()

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into WithdrawalRequests (UserID,WithdrawBtc,DateRequest) values (" & Session("UserID") & "," & txtBTCWithdraw.Text.Trim & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "') ")
        opExec.closeConnection()

        Response.Redirect("account.aspx")
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("account.aspx")
    End Sub

    Protected Sub btnCancelWithdrawBTC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelWithdrawBTC.Click
        Response.Redirect("account.aspx")
    End Sub

    Protected Sub btnExchangeUSD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExchangeUSD.Click

        If (Request("txtExchangeUSD").Trim.Equals("") Or Not IsNumeric(Request("txtExchangeUSD").Trim)) Then
            lblWithdrawMess.Text = "Invalid USD amount to Send to Exchange"
            Return
        End If

        If (Convert.ToDouble(Request("txtExchangeUSD").Trim) > Convert.ToDouble(txtUsdBalance.Text.Trim)) Then
            lblWithdrawMess.Text = "USD amount to Send to Exchange is greater than the USD Balance"
            Return
        End If


        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into ExchangeRequest (UserID,UsdAmountSentFromAccount,DateRequest) values (" & Session("UserID") & "," & Request("txtExchangeUSD") & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "') ")
        opExec.closeConnection()

        Response.Redirect("Account.aspx")
    End Sub

    Protected Sub btnExchangeBTC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExchangeBTC.Click
        If (Request("txtExchangeBTC").Trim.Equals("") Or Not IsNumeric(Request("txtExchangeBTC").Trim)) Then
            lblWithdrawMess.Text = "Invalid BTC amount to Send to Exchange"
            Return
        End If

        If (Convert.ToDouble(Request("txtExchangeBTC").Trim) > Convert.ToDouble(txtBtcBalance.Text.Trim)) Then
            lblWithdrawMess.Text = "BTC amount to Send to Exchange is greater than the BTC Balance"
            Return
        End If


        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into ExchangeRequest (UserID,BtcAmountSentFromAccount,DateRequest) values (" & Session("UserID") & "," & Request("txtExchangeBTC") & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "') ")
        opExec.closeConnection()

        Response.Redirect("Account.aspx")
    End Sub

    Protected Sub RdWithdraw_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RdWithdraw.SelectedIndexChanged
        'If (RdWithdraw.SelectedValue = "PM") Then
        '    lblSelectedWithdrawMethod.Visible = True
        '    lblSelectedWithdrawMethod.Text = "PM ACCOUNT"
        'ElseIf (RdWithdraw.SelectedValue = "PAYEER") Then
        '    lblSelectedWithdrawMethod.Visible = True
        '    lblSelectedWithdrawMethod.Text = "PAYEER ACCOUNT"
        'Else
        '    lblSelectedWithdrawMethod.Visible = False
        'End If
    End Sub

    Private Function isToUserValid(ByVal ToUserID As String) As Boolean

        Dim str As String = ""
        Dim res As Boolean = False

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where ID = " & ToUserID)

        Try

            If reader.HasRows = True Then
                res = True
            Else
                res = False
            End If

            Return res

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Function

  
  
End Class
