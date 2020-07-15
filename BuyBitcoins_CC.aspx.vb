Imports rpchost
Imports System.Data.OleDb

Partial Class BuyBitcoins_CC
    Inherits System.Web.UI.Page

    Private btcAsk As Double
    Private btcUsdAsk As Double
    Private btcUsdBid As Double
    Private btcEurAsk As Double
    Private btcEurBid As Double

    Private btcFrontUsdAsk As Double
    Private btcFrontUsdBid As Double
    Private btcFrontEurAsk As Double
    Private btcFrontEurBid As Double
    Private Commission As Double

    Private CrdComm As Integer
    Private PayplComm As Integer
    Private BnkComm As Integer
    Private PMComm As Integer
    Private OmtComm As Integer
    Private WiseComm As Integer
    Private RevComm As Integer
    Private WUComm As Integer
    Private ActivePayCom As Boolean

    Private MinAsk As Double
    Private MinBid As Double

    Private pendingUsdAmount As Double
    Private pendingBtcAmount As Double
    Private pendingWallet As String
    Private pendingCurrency As String
    Private TransID As String
    Private PendingRevolutPhone As String

    Private BtcAskMin As Integer
    Private BtcAskMax As Integer
    'Private BtcBidMin As Integer
    'Private BtcBidMax As Integer
    Private AskMessage As String
    Private BidMessage As String

    Private Currency As String

    Private type As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Session("TransID") = Nothing

        btnConfirmPayment.Visible = False
        btnConfirmOmtPayment.Visible = False

        If (Request.QueryString("Type") = "1") Then
            lblTitle.Text = "BUY BITCOIN WITH CREDIT CARD"
            lblMsg.Text = "Once you make the payment you will be redirected to your Transactions page, our Gateway Payment company (Leetchi) will send a Passcode (One Time Password) to your phone, once you receive it, write it in your Transaction Passcode and click [Validate PassCode]"
            type = "1"
        ElseIf (Request.QueryString("Type") = "2") Then
            lblTitle.Text = "BUY BITCOIN WITH PAYPAL"

            lblMsg.Text = "Your paypal account name should be the same name of your verified document(Passport/ID/Driver license). Non identical names will cancel the transaction."

            type = "2"
        ElseIf (Request.QueryString("Type") = "3") Then
            lblTitle.Text = "BUY BITCOIN WITH BANK TRANSFER"
            lblMsg.Text = "We accept third party bank transfers. We accept bank transfers from TRANSFERWISE, REVOLUT, WORLDREMIT, ... "
            type = "3"
        ElseIf (Request.QueryString("Type") = "4") Then
            lblTitle.Text = "BUY BITCOIN WITH PERFECTMONEY"

            type = "4"

            ddlCurrency.SelectedValue = "USD"
            ddlCurrency.Enabled = False

        ElseIf (Request.QueryString("Type") = "5") Then
            lblTitle.Text = "BUY BITCOIN WITH WESTERUNION"
            btnConfirmPayment.visible = True
            lblMsg.Text = "After you make the payment at the WesterUnion agent near you, make sure you press [Confirm WesterUnion payment] and provide the MTCN and your full name exactly as it appears on the WU receipt"
            type = "5"

        ElseIf (Request.QueryString("Type") = "6") Then
            lblTitle.Text = "BUY BITCOIN WITH REVOLUT"
            lblRevolutPhone.Visible = True
            txtRevolutPhone.Visible = True
            type = "6"

        ElseIf (Request.QueryString("Type") = "7") Then
            lblTitle.Text = "BUY BITCOIN WITH OMT"
            lblMsg.Text = "Clients from Lebanon can use this payment method"
            type = "7"
            ddlCurrency.SelectedValue = "USD"
            ddlCurrency.Enabled = False
            btnConfirmOmtPayment.Visible = True

        ElseIf (Request.QueryString("Type") = "8") Then
            lblTitle.Text = "BUY BITCOIN WITH TRANSFERWISE"
            lblMsg.Text = ""
            type = "8"
            'ddlCurrency.SelectedValue = "USD"
            'ddlCurrency.Enabled = False
            'btnConfirmOmtPayment.Visible = True

        Else
            Response.Redirect("BuyBitcoins.aspx")
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

        ManageBtcButtons()

        getBTCprices()

        If (BtcAskMax >= BtcAskMin And BtcAskMax > 0) Then
            lblAmountLimit.Text = "[Amount must be between " & BtcAskMin & " and " & BtcAskMax & "]"
        Else
            lblAmountLimit.Text = "Btc reserve is empty"

        End If

        If (AskMessage <> "") Then
            btnSubmit.Text = AskMessage
            btnSubmit.Enabled = False
            'Return
        Else
            btnSubmit.Text = "Make Payment"
            btnSubmit.Enabled = True
        End If


        Dim PaymentStat As String = isUserHasPendingPayments(Session("UserID"), type)
   
        If (PaymentStat <> "") Then

            txtDepositAmount.Text = pendingUsdAmount
            txtBtcAmount.Text = pendingBtcAmount
            txtBtcAddress.Text = pendingWallet
            ddlCurrency.SelectedValue = pendingCurrency

            txtRevolutPhone.Text = PendingRevolutPhone

            txtDepositAmount.Enabled = False
            txtBtcAddress.Enabled = False
            btnSubmit.Enabled = False
            ddlCurrency.Enabled = False
            txtRevolutPhone.Enabled = False

            If (PaymentStat = "Pending") Then
                lblVerification.Text = "You have a Buy transaction in <a href='transactions.aspx' class=RedTextBold title='Transactions history'>PENDING</a> mode. [Transaction ID = " & TransID & "]"
                btnCancelPayment.Enabled = True

            ElseIf (PaymentStat = "Process") Then
                lblVerification.Text = "You have a Buy transaction in <a href='transactions.aspx' class=RedTextBold title='Transactions history'>PROCESS</a> mode. [Transaction ID = " & TransID & "]"
                btnCancelPayment.Enabled = False

                If (type = "7") Then
                    btnConfirmOmtPayment.Enabled = False
                End If

            End If


        Else

            txtDepositAmount.Enabled = True
            txtBtcAmount.Enabled = False
            txtBtcAddress.Enabled = True

            If (AskMessage = "") Then btnSubmit.Enabled = True
            If (type <> "4" And type <> "7") Then ddlCurrency.Enabled = True

            lblVerification.Text = ""
            btnCancelPayment.Enabled = True

        End If

    End Sub


    Protected Sub ManageBtcButtons()

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from ManageBtcButtons")
        Try

            If reader.HasRows = True Then
                reader.Read()
                BtcAskMin = IIf(IsDBNull(reader("BtcAskMin")) Or reader("BtcAskMin") = "", 0, Convert.ToInt16(reader("BtcAskMin")))
                BtcAskMax = IIf(IsDBNull(reader("BtcAskMax")) Or reader("BtcAskMax") = "", 0, Convert.ToInt16(reader("BtcAskMax")))
                AskMessage = IIf(IsDBNull(reader("AskMessage")), "", Trim(reader("AskMessage")))

                If (Request.QueryString("type") = "5" Or Request.QueryString("type") = "3" Or Request.QueryString("type") = "4") Then
                    BtcAskMin = 50
                    BtcAskMax = 500
                    AskMessage = ""
                End If

            End If

        Catch ex As Exception

            'Dispose()
            '  GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()

            ' Dispose()

        End Try

    End Sub



    Protected Function isUserHasPendingPayments(ByVal userId As Integer, ByVal type As String) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = Nothing

        If (type = "1") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and (paymentMethod = 'CREDITCARD' or paymentMethod = 'Credit Card')")
        End If
        If (type = "2") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'PAYPAL'")
        End If
        If (type = "3") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'BankTransfer' ")
        End If
        If (type = "4") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'PerfectMoney' ")
        End If
        If (type = "5") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'WesterUnion' ")
        End If
        If (type = "6") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'REVOLUT' ")
        End If
        If (type = "7") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'OMT' ")
        End If
        If (type = "8") Then
            reader = opExec.rdGetReader("select * from Payments where (Status='Pending' or Status='Process') and UserID = " & Session("UserID") & " and OrderType='Buy' and paymentMethod = 'WISE' ")
        End If

        Try

            Dim res As String

            If reader.HasRows = True Then


                reader.Read()
                pendingUsdAmount = reader("AmountUSD")
                pendingBtcAmount = reader("AmountBTC")
                pendingWallet = reader("BtcAddress")
                pendingCurrency = reader("Currency")
                PendingRevolutPhone = IIf(IsDBNull(reader("RevolutPhoneNumber")), "", reader("RevolutPhoneNumber"))
                TransID = reader("ID")
                res = reader("Status")
            Else

                res = ""
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function isUserHasPendingInvoices(ByVal userId As Integer) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from InvoiceRequests where (Status='Pending' or Status='Process') and UserID = " & Session("UserID"))
        Try

            Dim res As String


            If reader.HasRows = True Then


                reader.Read()
                pendingUsdAmount = reader("AmountUSD")
                pendingBtcAmount = reader("AmountBTC")
                pendingWallet = reader("BtcAddress")

                res = reader("Status")
            Else

                res = ""
            End If

            Return res
        Catch ex As Exception
            Response.Redirect(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function

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
            Response.Write(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Sub txtDepositAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDepositAmount.TextChanged

        UpdateBtcPrices()
        CalculateBuyBtc()

    End Sub

    Protected Function UpdateBtcPrices() As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim price As New Rate
        Dim EurPrice As Double = price.GetPrice("EUR")
        Dim UsdPrice As Double = price.GetPrice("USD")

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime

        timeZoneInfo = timeZoneInfo.FindSystemTimeZoneById("Middle East Standard Time")
        dateTime = timeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)
        'Response.Write(dateTime.ToString("dd/MM/yyyy HH:mm:ss"))

        Try
            opExec.ExecuteSql("update Prices set FrontUsdAsk=" & UsdPrice & ", FrontEurAsk=" & EurPrice & ",FrontUsdBid=" & UsdPrice - 700 & ",FrontEurBid=" & EurPrice - 700 & ",LastUpdatedPricesDateTime= '" & dateTime.ToString("dd/MM/yyyy HH:mm:ss") & "'  ")

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Function

    Protected Sub CalculateBuyBtc()

        getBTCprices()

        If (ActivePayCom = True) Then
            If (Request.QueryString("Type") = "1") Then Commission = CrdComm
            If (Request.QueryString("Type") = "2") Then Commission = PayplComm
            If (Request.QueryString("Type") = "3") Then Commission = BnkComm
            If (Request.QueryString("Type") = "4") Then Commission = PMComm
            If (Request.QueryString("Type") = "5") Then Commission = WUComm
            If (Request.QueryString("Type") = "6") Then Commission = RevComm
            If (Request.QueryString("Type") = "7") Then Commission = OmtComm
            If (Request.QueryString("Type") = "8") Then Commission = WiseComm
        End If

        If (ddlCurrency.SelectedValue = "EUR") Then
            btcAsk = btcFrontEurAsk + Commission
        Else
            btcAsk = btcFrontUsdAsk + Commission
        End If

        'If (Request.QueryString("Type") = "6") Then
        'btcAsk = btcAsk - 250
        'End If

        If (IsNumeric(Request("txtDepositAmount").Trim)) Then
            If (Convert.ToDouble(Request("txtDepositAmount").Trim) >= BtcAskMin And Convert.ToDouble(Request("txtDepositAmount").Trim) <= BtcAskMax) Then
                If (btcAsk <> 0) Then txtBtcAmount.Text = String.Format("{0:0.00000000}", Convert.ToDouble(Request("txtDepositAmount")) / btcAsk)
            Else

                txtBtcAmount.Text = ""
                txtDepositAmount.Text = ""
                txtBtcAddress.Text = ""

                Response.Write("<script>alert('Not valid amount or the amount you entered is not between " & BtcAskMin & " and " & BtcAskMax & "')</script>")
            End If

        Else

            txtBtcAmount.Text = ""
            txtDepositAmount.Text = ""
            txtBtcAddress.Text = ""

            If (Not Request("txtDepositAmount").Trim.Equals("")) Then
                Response.Write("<script>alert('Not valid amount')</script>")
            End If

        End If

    End Sub


    Protected Function getBTCprices() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()

                btcUsdAsk = IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))
                btcUsdBid = IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))
                btcEurAsk = IIf(IsDBNull(reader("BtcUsdAsk")), 0, reader("BtcUsdAsk"))
                btcEurBid = IIf(IsDBNull(reader("btcUsdBid")), 0, reader("btcUsdBid"))

                btcFrontUsdAsk = IIf(IsDBNull(reader("FrontUsdAsk")), 0, reader("FrontUsdAsk"))
                btcFrontUsdBid = IIf(IsDBNull(reader("FrontUsdBid")), 0, reader("FrontUsdBid"))
                btcFrontEurAsk = IIf(IsDBNull(reader("FrontEurAsk")), 0, reader("FrontEurAsk"))
                btcFrontEurBid = IIf(IsDBNull(reader("FrontEurBid")), 0, reader("FrontEurBid"))

                Commission = IIf(IsDBNull(reader("BTC")), 0, reader("BTC"))

                CrdComm = IIf(IsDBNull(reader("CrdComm")), 0, reader("CrdComm"))
                PayplComm = IIf(IsDBNull(reader("PayplComm")), 0, reader("PayplComm"))
                BnkComm = IIf(IsDBNull(reader("BankComm")), 0, reader("BankComm"))
                PMComm = IIf(IsDBNull(reader("PMComm")), 0, reader("PMComm"))
                OmtComm = IIf(IsDBNull(reader("OmtComm")), 0, reader("OmtComm"))
                WiseComm = IIf(IsDBNull(reader("WiseComm")), 0, reader("WiseComm"))
                RevComm = IIf(IsDBNull(reader("RevComm")), 0, reader("RevComm"))
                WUComm = IIf(IsDBNull(reader("WUComm")), 0, reader("WUComm"))
                ActivePayCom = reader("ActivatePaymntComm")

                Return True

            Else

                Return False


            End If


        Catch ex As Exception

            Return False
            ' Dispose()
            ' GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Function


    Protected Function isPaymentInProcess(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from Payments where UserID=" & Session("UserID") & " and AmountUSD =" & Session("AmountUSD") & " and AmountBTC = " & Session("AmountBTC") & " and BtcAddress = " & Session("Wallet") & " ")
        Try

            If reader.HasRows = True Then
                reader.Read()
                txtDepositAmount.Text = reader("AmountUSD")
                txtBtcAmount.Text = reader("AmountBTC")
                txtBtcAddress.Text = reader("BtcAddress")

                If (reader("Status") = "Pending") Then
                    btnCancelPayment.Enabled = True
                Else
                    btnCancelPayment.Enabled = False
                End If

                Return True
            Else
                Return False
            End If

        Catch ex As Exception


            'Dispose()
            'GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()

            'Dispose()

        End Try

    End Function

    Protected Function isPaymentInvoiced(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from InvoiceRequest where UserID=" & Session("UserID") & " and AmountUSD =" & Session("AmountUSD") & " and AmountBTC = " & Session("AmountBTC") & " and BtcAddress = " & Session("Wallet") & " ")
        Try

            If reader.HasRows = True Then
                reader.Read()
                txtDepositAmount.Text = reader("AmountUSD")
                txtBtcAmount.Text = reader("AmountBTC")
                txtBtcAddress.Text = reader("BtcAddress")

                If (reader("Status") = "Pending") Then
                    btnCancelPayment.Enabled = True
                Else
                    btnCancelPayment.Enabled = False
                End If

                Return True
            Else
                Return False
            End If

        Catch ex As Exception


            'Dispose()
            ' GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()

            'Dispose()

        End Try

    End Function

    Public Shared Function GetResponse() As Boolean
        Return True
    End Function
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        If (Session("phone").Equals(Nothing) Or Session("phone").Equals("")) Then
            Response.Write("<script>alert('You should provide your phone number in your profile section')</script>")
            Return
        End If

        If (Not IsNumeric(txtBtcAmount.Text.Trim)) Then
            Response.Write("<script>alert('Not valid BTC amount')</script>")

        ElseIf (txtBtcAmount.Text.Trim = "") Then
            Response.Write("<script>alert('Btc amount should not be empty')</script>")
        ElseIf (Not IsNumeric(txtDepositAmount.Text.Trim)) Then
            Response.Write("<script>alert('Not valid Amount')</script>")
        ElseIf (txtDepositAmount.Text.Trim = "") Then
            Response.Write("<script>alert('Amount should not be empty')</script>")
        ElseIf (txtBtcAddress.Text.Trim = "") Then
            Response.Write("<script>alert('Btc Address should not be empty')</script>")
        Else

            getBTCprices()

            Session("AmountUSD") = txtDepositAmount.Text
            Session("AmountBTC") = txtBtcAmount.Text
            Session("Wallet") = txtBtcAddress.Text
            Session("Currency") = ddlCurrency.SelectedValue
            If (ddlCurrency.SelectedValue = "EUR") Then
                Session("BTCBuyPrice") = btcFrontEurAsk
            End If
            If (ddlCurrency.SelectedValue = "USD") Then
                Session("BTCBuyPrice") = btcFrontUsdAsk
            End If

            If (Request.QueryString("Type") = "1") Then

                'ClearValidatePhone(Session("UserID"))
                ' Response.Redirect("ValidatePhone.aspx")

                Response.Redirect("CrCrd.aspx")
            End If
            ' Response.Redirect("CrCd.aspx")
            If (Request.QueryString("Type") = "2") Then Response.Redirect("Paypl.aspx")
            If (Request.QueryString("Type") = "3") Then Response.Redirect("BankTransfer.aspx")
            If (Request.QueryString("Type") = "4") Then Response.Redirect("Deposit_PM_Custom.aspx")
            If (Request.QueryString("Type") = "5") Then Response.Redirect("WesterUnion.aspx")
            If (Request.QueryString("Type") = "8") Then Response.Redirect("TransferWise.aspx")

            If (Request.QueryString("Type") = "6") Then

                If (ddlCurrency.SelectedValue = "EUR") Then
                    Session("BTCBuyPrice") = btcFrontEurAsk
                End If
                If (ddlCurrency.SelectedValue = "USD") Then
                    Session("BTCBuyPrice") = btcFrontUsdAsk 
                End If
                Session("RevolutPhone") = txtRevolutPhone.Text

                Response.Redirect("Revolut.aspx")

            End If

            If (Request.QueryString("Type") = "7") Then
                Response.Redirect("OMT.aspx")
            End If


        End If

    End Sub

    Protected Sub btnCancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelPayment.Click

        If (isUserHasPendingPayments(Session("UserID"), type).Trim.Equals("Pending")) Then

            If (Request.QueryString("Type") = "5") Then

                Dim opExec As New rpchost.cs_Operation
                Try
                    opExec.ExecuteSql("update Payments set [Status]='Canceled' where UserID=" & Session("UserID") & " and [Status] = 'Pending' and OrderType='Buy' and PaymentMethod='WesterUnion' ")
                    SendNotification.Email("BUY BTC Payment with WesterUnion canceled by you on: " & Logger.GenerateTimeZone("Eastern Standard Time"), "Payment Details : " & vbCrLf & vbCrLf & " UserID = " & Session("UserID") & "<br><br>Best Regards<br>Rpchost.com ", Session("Email"))
                Catch ex As Exception
                    Response.Write(ex.Message)
                Finally
                    opExec.closeConnection()
                End Try

            Else
                Response.Redirect("CancelTransaction.aspx?TransactionID=" & TransID)

            End If

        End If

    End Sub


    Private Function ClearValidatePhone(ByVal UserID As Integer) As Boolean
        Try
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("delete from ValidatePhone where UserID = " & UserID)
            opExec.closeConnection()
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    Private Function RecalcReserve(ByVal Amount As Double) As Boolean
        Try

            If (Amount > 0) Then

                Dim intAmount As Integer = Convert.ToInt64(Amount)

                Dim opExec As New rpchost.cs_Operation

                opExec.ExecuteSql("update ManageBtcButtons set btcAskMax = btcAskMax + " & intAmount & " ,BuyReserve = BuyReserve + " & intAmount & "  ")
                opExec.closeConnection()

                Return True
            Else
                Return False
            End If

        Catch ex As Exception

        End Try

    End Function

    Protected Sub ddlCurrency_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCurrency.SelectedIndexChanged
        CalculateBuyBtc()
    End Sub


    Protected Sub btnConfirmPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirmPayment.Click
        Session("TransID") = TransID
        Response.Redirect("Deposit_WU.aspx")
    End Sub

    Protected Sub btnConfirmOmtPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirmOmtPayment.Click
        Session("TransID") = TransID
        Session("AmountUSD") = txtDepositAmount.Text
        Session("AmountBTC") = txtBtcAmount.Text
        Session("Wallet") = txtBtcAddress.Text
        Session("Currency") = ddlCurrency.SelectedValue
       

        Response.Redirect("OMT.aspx")
    End Sub
End Class
