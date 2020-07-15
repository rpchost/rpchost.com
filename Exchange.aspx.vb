Imports System.Data.OleDb
Imports rpchost

Partial Class Exchange
    Inherits System.Web.UI.Page

    Private btcUsdAsk As Double
    Private btcUsdBid As Double
    Private Const Auto As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Exchange")
        End If

      
        Dim rate As New Rate
        Dim InterestRate As Integer
        InterestRate = rate.GetInterestRate()

        Dim res As Boolean = rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & rate.btcUsdAsk & "] [Bid " & rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & rate.btcEurAsk & "] [Bid " & rate.btcEurBid & "]"
        End If

        'txtMonthlyProfit.Text ="Be your own bank"
        lblBtcMess.Text = ""
        lblUsdMess.Text = ""

        'getAccountBalance(Session("UserID"))
        getExchangeBalance(Session("UserID"))
        getInternalExchageRequests(Session("UserID"))
        getBTCprices()

        btnExchangeToUSD.CssClass = "INPUTBUTTON_Sell"
        btnExchangeToUSD.Text = "SELL BTC"
        btnExchangeToUSD.Enabled = True

        btnExchangeUSDtoBTC.CssClass = "INPUTBUTTON_Buy"
        btnExchangeUSDtoBTC.Text = "BUY BTC"
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
            btnExchangeToUSD.Text = "Exchange to EUR"
            btnExchangeToUSD.Enabled = False

            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Text = "Exchange to BTC"
            btnExchangeUSDtoBTC.Enabled = False

            txtBtcAmountToExchange.Enabled = False
            txtUsdAmountToExchange.Enabled = False

            lblBtcMess.Text = " There is a pending withdrawal in your Account, please wait until the withdrawal is done <br> then you can exchange"

            Return


        End If

        If (isUserExchangedBtcToUsd(Session("UserID"))) Then
            btnExchangeToUSD.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeToUSD.Text = "Exchange to EUR in Process ... "
            btnExchangeToUSD.Enabled = False
            txtUsdAmountToExchange.Enabled = False
            txtBtcAmountToExchange.Enabled = False
            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Text = "Exchange to BTC"
            btnExchangeUSDtoBTC.Enabled = False
        End If

        If (isUserExchangedUsdToBtc(Session("UserID"))) Then
            btnExchangeUSDtoBTC.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeUSDtoBTC.Text = "Exchange to BTC in Process ... "
            btnExchangeUSDtoBTC.Enabled = False
            txtUsdAmountToExchange.Enabled = False
            txtBtcAmountToExchange.Enabled = False
            btnExchangeToUSD.CssClass = "INPUTTEXTbtnDisabled"
            btnExchangeToUSD.Text = "Exchange to EUR"
            btnExchangeToUSD.Enabled = False
        End If

        AccessDataSource1.SelectCommand = "SELECT * FROM [InternalExchangeRequests] where UserID = " & Session("UserID") & " order by ID desc "

        If (getSignal() = "BUY") Then
            imgSignal.ImageUrl = "pictures\Up.gif"
        ElseIf (getSignal() = "SELL") Then
            imgSignal.ImageUrl = "pictures\Down.gif"

        Else
            imgSignal.ImageUrl = "pictures\flat.gif"
        End If

    End Sub

    'Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
    '    MyBase.OnPreRender(e)

    'End Sub

    Protected Function getSignal() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from BtcSignals order by ID desc")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("Trend")

            Else

                Return ""

            End If

        Catch ex As Exception
            Response.Write("getAccountBalanceUSD " & ex.Message)
        Finally
            opExec.closeConnection()
        End Try


    End Function

    Protected Sub getInternalExchageRequests(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InternalExchangeRequests where DoneByAdmin =0 and UserID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                txtUsdAmountToExchange.Text = IIf(IsDBNull(reader("UsdAmountToBtc")), 0, reader("UsdAmountToBtc"))
                txtBtcAmountToExchange.Text = IIf(IsDBNull(reader("BtcAmountToUsd")), 0, reader("BtcAmountToUsd"))

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

                txtUsdBalance.Text = IIf(IsDBNull(reader("UsdBalance")), 0, String.Format("{0:0.00}", reader("UsdBalance")))
                txtBtcBalance.Text = IIf(IsDBNull(reader("BtcBalance")), 0, String.Format("{0:0.0000000}", reader("BtcBalance")))


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

    Protected Sub btnExchangeToUSD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExchangeToUSD.Click

        lblBtcMess.Text = ""
        lblBtcToUsdValue.Text = ""
        lblMess.Text = ""

        If (getExchangeActiveMode() = False) Then
            lblMess.Text = "The exchange is in maintenance mode, we will get back in minutes"
            txtBtcAmountToExchange.Text = ""
            Return
        End If

        If (txtBtcAmountToExchange.Text.Trim.Equals("") Or Not IsNumeric(txtBtcAmountToExchange.Text.Trim)) Then
            lblBtcMess.Text = "Invalid BTC Amount"
            txtBtcAmountToExchange.Text = ""
            Return
        End If

        If (Convert.ToDouble(txtBtcAmountToExchange.Text.Trim) > Convert.ToDouble(txtBtcBalance.Text.Trim)) Then
            lblBtcMess.Text = "BTC amount to exchange is greater than the BTC Balance"
            txtBtcAmountToExchange.Text = ""
            Return
        End If

        If (Convert.ToDouble(txtBtcAmountToExchange.Text.Trim) < 0.0002) Then
            lblBtcMess.Text = "BTC amount minimum is 0.0002"
            txtBtcAmountToExchange.Text = ""
            Return
        End If

        UpdateBtcPrices(Auto)
        getBTCprices()

        Dim ExchangeID As Integer = 0

        Dim opExec As New rpchost.cs_Operation

        Dim timeZ As New Logger

        ExchangeID = opExec.ExecuteScalaredSql("insert into InternalExchangeRequests (UserID,BtcAmountToUsd,dateRequest,BTCEUR,EurAmountReserved,MainUsdBalance,MainBtcBalance) values (" & Session("UserID") & ",ROUND(" & Request("txtBtcAmountToExchange").Trim & ",7),'" & timeZ.GenerateTimeZone_Static("Eastern Standard Time") & "'," & btcUsdAsk & "," & String.Format("{0:0.00}", CDbl(txtBtcAmountToExchange.Text) * btcUsdBid) & "," & CDbl(txtUsdBalance.Text) & "," & CDbl(txtBtcBalance.Text) & ")")
        opExec.closeConnection()

        SendAlert(Session("UserID"), ExchangeID, "BTC TO EUR")

        Logger.GenerateLog("New Exchange Requested; Direction = BTC to EUR.  Exchange ID = " & ExchangeID, timeZ.GenerateTimeZone_Static("Middle East Standard Time"), "ManageInternalExchanges.aspx")

        Response.Redirect("Exchange.aspx")

    End Sub

    Protected Sub btnExchangeUSDtoBTC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExchangeUSDtoBTC.Click

        lblUsdMess.Text = ""
        lblUsdToBtcValue.Text = ""
        lblMess.Text = ""

        If (getExchangeActiveMode() = False) Then
            lblMess.Text = "The exchange is in maintenance mode, we will get back in minutes"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        If (txtUsdAmountToExchange.Text.Trim.Equals("") Or Not IsNumeric(txtUsdAmountToExchange.Text.Trim)) Then
            lblUsdMess.Text = "Invalid USD Amount"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        If (Convert.ToDouble(txtUsdAmountToExchange.Text.Trim) > Convert.ToDouble(txtUsdBalance.Text.Trim)) Then
            lblUsdMess.Text = "EUR amount to exchange is greater than the EUR Balance"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        If (Convert.ToDouble(txtUsdAmountToExchange.Text.Trim) < 1) Then
            lblUsdMess.Text = "EUR amount minimum is 1"
            txtUsdAmountToExchange.Text = ""
            Return
        End If

        UpdateBtcPrices(Auto)
        getBTCprices()
        Dim ExchangeID As Integer = 0

        Dim opExec As New rpchost.cs_Operation
        ExchangeID = opExec.ExecuteScalaredSql("insert into InternalExchangeRequests (UserID,UsdAmountToBtc,dateRequest,BTCEUR,BtcAmountReserved,MainUsdBalance,MainBtcBalance) values (" & Session("UserID") & ",ROUND(" & txtUsdAmountToExchange.Text & ",2),'" & Logger.GenerateTimeZon("Eastern Standard Time") & "'," & btcUsdBid & "," & String.Format("{0:0.0000000}", CDbl(txtUsdAmountToExchange.Text) / btcUsdAsk) & "," & CDbl(txtUsdBalance.Text) & "," & CDbl(txtBtcBalance.Text) & ")")
        opExec.closeConnection()

        SendAlert(Session("UserID"), ExchangeID, "EUR TO BTC")

        Logger.GenerateLog("New Exchange Requested; Direction = EUR to BTC.  Exchange ID = " & ExchangeID, Logger.GenerateTimeZon("Middle East Standard Time"), "ManageInternalExchanges.aspx")


        Response.Redirect("Exchange.aspx")

    End Sub

    Protected Function SendAlert(ByVal UserID As String, ByVal ExchangeID As Integer, ByVal Direction As String) As Boolean

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime
        timeZoneInfo = timeZoneInfo.FindSystemTimeZoneById("Middle East Standard Time")
        dateTime = timeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)
        Try
            SendNotification.Email("New Exchange request issued", "New Exchange request has been issued by USerID " & UserID & " , Exchange ID = " & ExchangeID & " <br> Date Issue = " & dateTime & "<br> Direction = " & Direction)
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

    Protected Function getExchangeActiveMode() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT ActivatePaymntComm from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()

                Return reader("ActivatePaymntComm")
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

        UpdateBtcPrices(Auto)
        getBTCprices()

        If (btcUsdBid > 0) Then
            If (IsNumeric(Request("txtBtcAmountToExchange").Trim)) Then
                If (Convert.ToDouble(Request("txtBtcAmountToExchange").Trim) > 0) Then
                    lblBtcToUsdValue.Text = String.Format("{0:0.00}", Convert.ToDouble(Request("txtBtcAmountToExchange")) * btcUsdBid) & " Eur "
                End If
            End If
        End If
    End Sub

    Protected Function UpdateBtcPrices(Optional ByVal isAuto As Boolean = True) As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim price As New Rate

        Dim EurAskPrice As Double
        Dim UsdAskPrice As Double

        Dim EurBidPrice As Double
        Dim UsdBidPrice As Double

        Dim AskCommission As Double = Rate.getAskcommission
        Dim BidCommission As Double = Rate.getBidcommission



        If (isAuto = False) Then
            getBTCprices()
            EurAskPrice = price.GetPrice("EUR") + Rate.getAskcommission 'Rate.btcEurAsk
            UsdAskPrice = price.GetPrice("USD") + Rate.getAskcommission 'Rate.btcUsdAsk
            EurBidPrice = price.GetPrice("EUR") - Rate.getBidcommission 'Rate.btcEurBid
            UsdBidPrice = price.GetPrice("USD") - Rate.getBidcommission 'Rate.btcUsdBid
        Else
            EurAskPrice = price.GetPrice("EUR") + AskCommission
            UsdAskPrice = price.GetPrice("USD") + AskCommission
            EurBidPrice = price.GetPrice("EUR") - BidCommission
            UsdBidPrice = price.GetPrice("USD") - BidCommission
        End If

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime

        timeZoneInfo = timeZoneInfo.FindSystemTimeZoneById("Middle East Standard Time")
        dateTime = timeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)

        Try

            opExec.ExecuteSql("update Prices set FrontUsdAsk=" & UsdAskPrice & ", FrontEurAsk=" & EurAskPrice & ",FrontUsdBid=" & UsdBidPrice & ",FrontEurBid=" & EurBidPrice & ",LastUpdatedPricesDateTime= '" & dateTime.ToString("dd/MM/yyyy HH:mm:ss") & "'  ")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Function


    Protected Sub txtUsdAmountToExchange_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUsdAmountToExchange.TextChanged

        UpdateBtcPrices(Auto)
        getBTCprices()

        If (btcUsdAsk > 0) Then
            If (IsNumeric(Request("txtUsdAmountToExchange").Trim)) Then
                If (Convert.ToDouble(Request("txtUsdAmountToExchange").Trim) > 0) Then
                    lblUsdToBtcValue.Text = String.Format("{0:0.0000000}", Convert.ToDouble(Request("txtUsdAmountToExchange")) / btcUsdAsk) & " btc"
                End If
            End If
        End If
    End Sub

End Class
