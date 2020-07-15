Imports System.Data.OleDb
Imports rpchost

Partial Class Withdraw
    Inherits System.Web.UI.Page

    Private btcUsdAsk As Double
    Private btcUsdBid As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=withdraw")
        End If

        Dim rate As New Rate
        Dim InterestRate As Integer
        InterestRate = rate.GetInterestRate()

        'txtMonthlyProfit.Text ="Be your own bank"
        lblBtcMess.Text = ""
        lblUsdMess.Text = ""


        getExchangeBalance(Session("UserID"))
        getWithdrawRequests(Session("UserID"))
        'getBTCprices()

        btnExchangeToUSD.CssClass = "INPUTTEXTbtn"
        btnExchangeToUSD.Text = "Withdraw Bitcoin"
        btnExchangeToUSD.Enabled = True

        btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtn"
        btnExchangeUSDtoBTC.Text = "Withdraw to Bank"
        btnExchangeUSDtoBTC.Enabled = True
        txtUsdAmountToExchange.Enabled = True
        txtBtcAmountToExchange.Enabled = True

        If (isUserRequestTransferBtc(Session("UserID"))) Then
            btnExchangeToUSD.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeToUSD.Enabled = False
        End If

        If (isUserRequestTransferUsd(Session("UserID"))) Then
            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Enabled = False
        End If


        If (isUserRequestAccountWithDraw(Session("UserID"))) Then

            btnExchangeToUSD.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeToUSD.Text = "Withdraw"
            btnExchangeToUSD.Enabled = False

            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Text = "Withdraw"
            btnExchangeUSDtoBTC.Enabled = False

            txtBtcAmountToExchange.Enabled = False
            txtUsdAmountToExchange.Enabled = False

            lblBtcMess.Text = " There is a pending withdrawal in your Account, please wait"

            Return


        End If

        If (isUserExchangedBtcToUsd(Session("UserID"))) Then
            btnExchangeToUSD.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeToUSD.Text = "Withdraw in Process ... "
            btnExchangeToUSD.Enabled = False


            txtUsdAmountToExchange.Enabled = False
            txtBtcAmountToExchange.Enabled = False

            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Text = "Withdraw"
            btnExchangeUSDtoBTC.Enabled = False
        End If


        If (isUserExchangedUsdToBtc(Session("UserID"))) Then
            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Text = "Withdraw in Process ... "
            btnExchangeUSDtoBTC.Enabled = False


            txtUsdAmountToExchange.Enabled = False
            txtBtcAmountToExchange.Enabled = False

            btnExchangeToUSD.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeToUSD.Text = "Withdraw"
            btnExchangeToUSD.Enabled = False
        End If

        Dim res As Boolean = rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & rate.btcUsdAsk & "] [Bid " & rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & rate.btcEurAsk & "] [Bid " & rate.btcEurBid & "]"
        End If

        AccessDataSource1.SelectCommand = "SELECT * FROM [WithdrawalRequests] where UserID= " & Session("UserID") & " order by ID desc "

    End Sub

    

    Protected Sub getWithdrawRequests(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from WithdrawalRequests where DoneByAdmin =0 and UserID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                'txtUsdAmountToExchange.Text = IIf(IsDBNull(reader("WithdrawUsd")), 0, reader("WithdrawUsd"))
                'txtBtcAmountToExchange.Text = IIf(IsDBNull(reader("WithdrawBtc")), 0, reader("WithdrawBtc"))

                txtUsdAmountToExchange.Text = IIf(IsDBNull(reader("WithdrawUsd")), 0, String.Format("{0:0.00}", reader("WithdrawUsd")))
                txtBtcAmountToExchange.Text = IIf(IsDBNull(reader("WithdrawBtc")), 0, String.Format("{0:0.000000}", reader("WithdrawBtc")))


            End If

        Catch ex As Exception
            Response.Write("getAccountBalanceUSD " & ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Sub getExchangeBalance(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Exchange where UserID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                'txtUsdBalance.Text = IIf(IsDBNull(reader("UsdBalance")), 0, reader("UsdBalance"))
                'txtBtcBalance.Text = IIf(IsDBNull(reader("BtcBalance")), 0, reader("BtcBalance"))

                txtUsdBalance.Text = IIf(IsDBNull(reader("UsdBalance")), 0, String.Format("{0:0.00}", reader("UsdBalance")))
                txtBtcBalance.Text = IIf(IsDBNull(reader("BtcBalance")), 0, String.Format("{0:0.000000}", reader("BtcBalance")))


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

    Protected Function isUserHasWallet(ByVal UserID As String) As Boolean
        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select BitcoinWallet from MembersForex where ID = " & UserID & " ")
        Try

            Dim res As Boolean = False

            If reader.HasRows = True Then
                reader.Read()

                If (Not IsDBNull(reader("BitcoinWallet"))) Then
                    If (reader("BitcoinWallet") <> "") Then
                        res = True
                    End If
                End If

            End If

            Return res

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try
    End Function

    Protected Function isUserHasBankAccount(ByVal UserID As String) As Boolean
        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select IBAN from MembersForex where ID = " & UserID & " ")
        Try

            Dim res As Boolean = False

            If reader.HasRows = True Then
                reader.Read()

                If (Not IsDBNull(reader("IBAN"))) Then
                    If (reader("IBAN") <> "") Then
                        res = True
                    End If
                End If

            End If

            Return res

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try
    End Function

    Protected Sub btnExchangeToUSD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExchangeToUSD.Click

        lblBtcMess.Text = ""
        lblBtcToUsdValue.Text = ""
        lblBtcMess.Text = ""

        If (isUserHasWallet(Session("UserID")) = False) Then
            lblBtcMess.Text = "Please fill your bitcoin wallet in your <a href=profile.aspx target='new'>profile section</a>"
            txtBtcAmountToExchange.Text = ""
            Return
        End If

        If (txtBtcAmountToExchange.Text.Trim.Equals("") Or Not IsNumeric(txtBtcAmountToExchange.Text.Trim)) Then
            lblBtcMess.Text = "Invalid BTC Amount"
            txtBtcAmountToExchange.Text = ""
            Return
        End If

        If (Convert.ToDouble(txtBtcAmountToExchange.Text.Trim) > Convert.ToDouble(txtBtcBalance.Text.Trim)) Then
            lblBtcMess.Text = "BTC amount to withdraw is greater than the BTC Balance"
            txtBtcAmountToExchange.Text = ""
            Return
        End If


        Dim WithDrawID As Integer = 0
        Dim opExec As New rpchost.cs_Operation
        WithDrawID = opExec.ExecuteScalaredSql("insert into WithdrawalRequests (UserID,WithdrawBtc,DateRequest,WithdrawMethod) values (" & Session("UserID") & "," & Request("txtBtcAmountToExchange").Trim & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "','BTC')")
        opExec.closeConnection()

        SendAlert(Session("UserID"), WithDrawID, "Withdraw Bitcoin to Bitcoin wallet")

        Logger.GenerateLog("New Withdraw Requested; Direction = BITCOIN WALLET. WithDraw ID = " & WithDrawID, Logger.GenerateTimeZone("Middle East Standard Time"), "ManageWithdrawRequests.aspx")

        Response.Redirect("Withdraw.aspx")

    End Sub

    Protected Sub btnExchangeUSDtoBTC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExchangeUSDtoBTC.Click

        lblUsdMess.Text = ""
        lblUsdToBtcValue.Text = ""

        If (isUserHasBankAccount(Session("UserID")) = False) Then
            lblUsdMess.Text = "Please fill your Bank account in your <a href='profile.aspx' target='new'>profile section</a>"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        If (txtUsdAmountToExchange.Text.Trim.Equals("") Or Not IsNumeric(txtUsdAmountToExchange.Text.Trim)) Then
            lblUsdMess.Text = "Invalid Amount"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        If (Convert.ToDouble(txtUsdAmountToExchange.Text.Trim) > Convert.ToDouble(txtUsdBalance.Text.Trim)) Then
            lblUsdMess.Text = "EUR amount to withdraw is greater than the EUR Balance"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        Dim WithDrawID As Integer = 0
        Dim opExec As New rpchost.cs_Operation
        WithDrawID = opExec.ExecuteScalaredSql("insert into WithdrawalRequests (UserID,WithdrawUsd,DateRequest,WithdrawMethod) values (" & Session("UserID") & "," & Request("txtUsdAmountToExchange").Trim & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "','BANK')")
        opExec.closeConnection()

        SendAlert(Session("UserID"), WithDrawID, "Withdraw money to Bank Account")

        Logger.GenerateLog("New Withdraw Requested; Direction = BANK ACCOUNT. WithDraw ID = " & WithDrawID, Logger.GenerateTimeZone("Middle East Standard Time"), "ManageWithdrawRequests.aspx")


        Response.Redirect("Withdraw.aspx")

    End Sub

    Protected Function SendAlert(ByVal UserID As String, ByVal WithDrawID As Integer, ByVal Direction As String) As Boolean

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime
        timeZoneInfo = timeZoneInfo.FindSystemTimeZoneById("Middle East Standard Time")
        dateTime = timeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)
        Try
            SendNotification.Email("New Withdraw request issued", "New Withdraw request has been issued by USerID " & UserID & " , WithDraw ID = " & WithDrawID & " <br> Date Issue = " & dateTime & "<br> Direction = " & Direction)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    Protected Function isUserRequestAccountWithDraw(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from WithdrawalRequests where UserID = " & Session("UserID") & " and DoneByAdmin = no ")
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


    Protected Function isUserRequestTransferBtc(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ExchangeTransferRequest where UserID = " & Session("UserID") & " and BtcTransfer > 0 ")
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

    Protected Function isUserRequestTransferUsd(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ExchangeTransferRequest where UserID = " & Session("UserID") & " and UsdTransfer > 0 ")
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

    Protected Function isUserExchangedBtcToUsd(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InternalExchangeRequests where UserID = " & Session("UserID") & " and DoneByAdmin=0 and BtcAmountToUsd <> null and BtcAmountToUsd>0 ")
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

    Protected Function isUserExchangedUsdToBtc(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InternalExchangeRequests where UserID = " & Session("UserID") & " and DoneByAdmin=0 and UsdAmountToBtc <> null and UsdAmountToBtc>0 ")
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

    Protected Function getCurrentBTCprice() As Double

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()
                Return reader("BTC")

            Else

                Return -1
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


    Protected Function getBTCprices() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()
                btcUsdAsk = IIf(IsDBNull(reader("FrontEurAsk")), 0, reader("FrontEurAsk"))
                btcUsdBid = IIf(IsDBNull(reader("FrontEurBid")), 0, reader("FrontEurBid"))

                'lblBtcUsdAsk.Text = "ASK = " & IIf(IsDBNull(reader("BtcUsdAsk")), 0, reader("BtcUsdAsk") + reader("BCC"))
                ' lblBtcUsdBid.Text = "BID = " & IIf(IsDBNull(reader("BtcUsdBid")), 0, reader("BtcUsdBid") - reader("BCC"))

                Return True


            Else

                Return False


            End If


        Catch ex As Exception

            Return False
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


    Protected Sub txtBtcAmountToExchange_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBtcAmountToExchange.TextChanged
        If (btcUsdAsk > 0) Then
            If (IsNumeric(Request("txtBtcAmountToExchange").Trim)) Then
                If (Convert.ToDouble(Request("txtBtcAmountToExchange").Trim) > 0) Then
                    lblBtcToUsdValue.Text = Convert.ToDouble(Request("txtBtcAmountToExchange")) * btcUsdAsk & " Eur "
                End If
            End If
        End If
    End Sub


    Protected Sub txtUsdAmountToExchange_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUsdAmountToExchange.TextChanged

        If (btcUsdBid > 0) Then
            If (IsNumeric(Request("txtUsdAmountToExchange").Trim)) Then
                If (Convert.ToDouble(Request("txtUsdAmountToExchange").Trim) > 0) Then
                    lblUsdToBtcValue.Text = String.Format("{0:0.00000000}", Convert.ToDouble(Request("txtUsdAmountToExchange")) / btcUsdBid) & " btc"
                End If
            End If
        End If
    End Sub



End Class
