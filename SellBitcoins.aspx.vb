Imports rpchost
Imports System.Data.OleDb

Partial Class SellBitcoins
    Inherits System.Web.UI.Page

    Private btcAsk As Double
    Private btcBid As Double
    Private btcUsdAsk As Double
    Private btcUsdBid As Double
    Private btcEurAsk As Double
    Private btcEurBid As Double

    Private btcFrontUsdAsk As Double
    Private btcFrontUsdBid As Double
    Private btcFrontEurAsk As Double
    Private btcFrontEurBid As Double

    Shared Queue As Integer

    Private pendingUsdAmount As Double
    Private pendingBtcAmount As Double
    Private pendingWithdrawMethod As String
    Private pendingCurrency As String
    Private withdrawMethod As String
    Private Cash As String
    Private PickupLink As String
    Private BankIBAN As String

    Private BtcAskMin As Integer
    Private BtcAskMax As Integer
    Private BtcBidMin As Integer
    Private BtcBidMax As Integer
    Private AskMessage As String
    Private BidMessage As String

    Private Currency As String

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=SellBitcoins")
        End If



        Dim PaymentStat As String = isUserHasPendingBtcPayments(Session("UserID"))

        If (PaymentStat = "Pending" Or PaymentStat = "Process") Then
            Return
        End If


        If (txtDepositAmount.Text = "" Or ddlWithdraw.SelectedValue = "") Then
            Response.Write("<script>alert('Not valid BTC or Withdraw method is not selected')</script>")
            Return
        End If

        getBTCprices()

        Dim FrontSellPrice As String = ""
        If (ddlCurrency.SelectedValue = "EUR") Then
            FrontSellPrice = btcFrontEurBid
        End If
        If (ddlCurrency.SelectedValue = "USD") Then
            FrontSellPrice = btcFrontUsdBid
        End If

        Dim opExec As New rpchost.cs_Operation
        Try
            Dim rDate As String = Logger.GenerateTimeZone("Eastern Standard Time")
            Queue = opExec.ExecuteScalaredSql("insert into Payments (UserID,AmountBTC,AmountUSD, dtDatePayment,SELL_Price, WithdrawMethod, OrderType,[Status],[Currency]) values (" & Session("UserID") & "," & txtDepositAmount.Text & "," & txtUsdAmount.Text & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "'," & FrontSellPrice & ",'" & ddlWithdraw.SelectedItem.Text & "','Sell','Pending','" & ddlCurrency.SelectedValue & "') ")
            Session("Queue") = Queue

            Try
                SendNotification.Email("SELL BTC Payment Reserved Successfully on: " & rDate, "Payment Details : <br><br>UserID = " & Session("UserID") & "<br>AmountBTC = " & txtDepositAmount.Text & "<br>AmountUSD = " & txtUsdAmount.Text & "<br>DatePayment = " & rDate & "<br>Sell Price = " & FrontSellPrice & "<br>Withdraw Method = " & ddlWithdraw.SelectedItem.Text & "<br>TransactionID = " & Queue & "<br>Transaction status : PENDING<br><br>Thank you for purchasing with Rpchost.com", Session("Email"))
            Catch ex As Exception
            End Try


            lblQueueMsg.Visible = True


            lbldescNote.Visible = True
            lblStatus.Visible = True
            lblPaypalEmail.Visible = True

            btnCancelPayment.Enabled = True

            txtDepositAmount.Enabled = False
            txtUsdAmount.Enabled = False
            ddlWithdraw.Enabled = False
            btnSubmit.Enabled = False
            lblQueueMsg.Text = "Please send <span class=head09_13>" & txtDepositAmount.Text & " btc </span> to our BTC wallet address <span class=head09_13> 3KkqpDGGNxQrh2FBKcLucncbxRdXcWhRH6 </span> "

            lbldescNote.Text = "When you send the bitcoin from your wallet, In the description section write <span class=head09_13>''TransactionID = " & Queue & "''</span> as reference <br> <a href=>See this Example</a>"
            lblStatus.Text = "Your transaction is in PENDING mode"


        Catch ex As Exception
            Response.Write(ex.Message)

            lblQueueMsg.Visible = False
            'lblQueueMsg1.Visible = False

            lbldescNote.Visible = False
            btnCancelPayment.Enabled = False
            lblStatus.Visible = False
            'lblCancelTrans.Visible = False

        Finally
            opExec.closeConnection()
        End Try


    End Sub

    Protected Sub txtDepositAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDepositAmount.TextChanged
        calculateSellBtcPrices()
    End Sub

    Protected Sub calculateSellBtcPrices()

        getBTCprices()

        If (ddlCurrency.SelectedValue = "EUR") Then
            btcBid = btcFrontEurBid
        Else
            btcBid = btcFrontUsdBid
        End If

        If (IsNumeric(Request("txtDepositAmount").Trim)) Then
            If (Convert.ToDouble(Request("txtDepositAmount") * btcBid) >= BtcBidMin And Convert.ToDouble(Request("txtDepositAmount") * btcBid) <= BtcBidMax) Then
                If (btcBid <> 0) Then txtUsdAmount.Text = Convert.ToInt64(Request("txtDepositAmount") * btcBid)
            Else
                txtUsdAmount.Text = ""
                txtDepositAmount.Text = ""
                Response.Write("<script>alert('Amount should be between " & BtcBidMin & " and  " & BtcBidMax & "')</script>")
            End If
        Else
            txtUsdAmount.Text = ""
            txtDepositAmount.Text = ""
            ddlCurrency.SelectedIndex = 0
            Response.Write("<script>alert('Not valid BTC')</script>")
        End If
    End Sub

    Protected Sub calculateSellUsdPrices()

        getBTCprices()

        If (ddlCurrency.SelectedValue = "EUR") Then
            btcBid = btcFrontEurBid
        Else
            btcBid = btcFrontUsdBid
        End If

        If (Request("txtUsdAmount").Trim) = "" And Request("txtDepositAmount").Trim = "" Then
            txtUsdAmount.Text = ""
            txtDepositAmount.Text = ""
            Return
        End If


        If (IsNumeric(Request("txtUsdAmount").Trim)) Then
            If (Convert.ToDouble(Request("txtUsdAmount")) >= BtcBidMin And Convert.ToDouble(Request("txtUsdAmount")) <= BtcBidMax) Then
                If (btcBid <> 0) Then txtDepositAmount.Text = String.Format("{0:0.00000000}", Convert.ToInt64(Request("txtUsdAmount")) / btcBid)
            Else
                txtUsdAmount.Text = ""
                txtDepositAmount.Text = ""
                Response.Write("<script>alert('Amount should be between " & BtcBidMin & " and  " & BtcBidMax & "')</script>")
            End If
        Else
            txtUsdAmount.Text = ""
            txtDepositAmount.Text = ""
            ddlCurrency.SelectedIndex = 0
            Response.Write("<script>alert('Not valid BTC')</script>")
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


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=SellBitcoins")
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

        ManageBtcButtons()
        getBTCprices()

        If (Page.IsPostBack = False) Then

            ddlWithdraw.Items.Clear()
            Dim ls As ListItem
            ls = New ListItem
            ls.Value = ""
            ls.Text = ""
            ddlWithdraw.Items.Add(ls)
            Dim paypal, Iban, Cash As String

            Dim opExec As New rpchost.cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT IBAN,PaypalEmail,CashPickUpCountry FROM MembersForex where ID=" & Session("UserID"))
            If reader.HasRows = True Then
                reader.Read()

                ' paypal = IIf(IsDBNull(reader("PaypalEmail")), "", reader("PaypalEmail"))
                Iban = IIf(IsDBNull(reader("IBAN")), "", reader("IBAN"))
                ' Cash = IIf(IsDBNull(reader("CashPickUpCountry")), "", reader("CashPickUpCountry"))

                'If (Not paypal.Equals("")) Then
                '    ls = New ListItem
                '    ls.Value = "Paypal"
                '    ls.Text = "Paypal"
                '    ddlWithdraw.Items.Add(ls)
                'End If

                If (Not Iban.Equals("")) Then
                    ls = New ListItem
                    ls.Value = "Bank Account"
                    ls.Text = "Bank Account"
                    ddlWithdraw.Items.Add(ls)
                End If

                'If (Not Cash.Equals("")) Then
                '    ls = New ListItem
                '    ls.Value = "Cash Pickup"
                '    ls.Text = "Cash Pickup"
                '    ddlWithdraw.Items.Add(ls)
                'End If
            End If
            ddlWithdraw.DataBind()
        End If

        lblAmountLimit.Text = "Amount must be between " & BtcBidMin & " and " & BtcBidMax

        If (BidMessage <> "") Then
            btnSubmit.Text = BidMessage
            btnSubmit.Enabled = False
            ddlWithdraw.Enabled = False
            Return
        Else
            btnSubmit.Text = "Reserve Transaction"
            btnSubmit.Enabled = True
            ddlWithdraw.Enabled = True
        End If


        Dim PaymentStat As String = isUserHasPendingBtcPayments(Session("UserID"))

        If (Session("Queue") <> Nothing And Session("Queue") <> 0 And isQueueIdFinished(Session("Queue"))) Then
            Session("Queue") = Nothing
            Response.Redirect("Transactions.aspx")
        End If


        If (PaymentStat = "Pending" Or PaymentStat = "Process") Then

            txtDepositAmount.Text = pendingBtcAmount
            txtUsdAmount.Text = pendingUsdAmount
            ddlWithdraw.SelectedValue = pendingWithdrawMethod

            ddlCurrency.SelectedValue = pendingCurrency

            txtDepositAmount.Enabled = False
            txtUsdAmount.Enabled = False
            ddlWithdraw.Enabled = False
            ddlCurrency.Enabled = False

            lblQueueMsg.Text = "Please send <span class=head09_13>" & txtDepositAmount.Text & " btc </span> to our BTC wallet address <span class=head09_13> 3KkqpDGGNxQrh2FBKcLucncbxRdXcWhRH6 </span> "

            lbldescNote.Text = "When you send the bitcoin from your wallet, In the description section write <span class=head09_13>''TransactionID = " & Queue & "''</span> as reference <a href= ""#"" onclick=""window.open('picture/BtcSendExample.gif','_blank')"" > [See an Example]</a>"
            btnCancelPayment.Enabled = True
            lblQueueMsg.Visible = True
            lblStatus.Visible = True

            lblPaypalEmail.Visible = True

            lbldescNote.Visible = True
            btnSubmit.Enabled = False
            If (PaymentStat = "Pending") Then
                lblStatus.Text = "You have a Sell transaction in <a href='transactions.aspx' class=RedTextBold title='Transactions history'>PENDING</a> mode"

            ElseIf (PaymentStat = "Process") Then
                lblStatus.Text = "You have a buy transaction in <a href='transactions.aspx' class=RedTextBold title='Transactions history'>PROCESS</a> mode"

            End If

            Dim PaypalEmail As String = getUserPaypalEmail(Session("UserId"))

            If (ddlWithdraw.SelectedValue = "Paypal") Then
                If (PaypalEmail.Trim <> "") Then
                    lblPaypalEmail.Text = "We will send you money to the following paypal email account : " & PaypalEmail
                    'btnSubmit.Enabled = True

                Else
                    lblPaypalEmail.Text = "Your Paypal Email is empty. Please access your <a href='profile.aspx' target=_blank>Profile</a> section and provide your Paypal email"
                    btnSubmit.Enabled = False
                End If

            ElseIf (ddlWithdraw.SelectedValue = "Cash Pickup") Then
                If (Cash.Trim <> "") Then
                    lblPaypalEmail.Text = "We will send you cash to the following country : " & Cash & ". <a href='" & PickupLink & "' title='Pickup points' class='Redtextbold' target=_blank>[Check the pickup points]</a>"
                    ' btnSubmit.Enabled = True
                Else
                    lblPaypalEmail.Text = "You did not specified a Cash Pickup country. Access your <a href='profile.aspx' target=_blank>Profile</a> section and provide your Cash Pickup country"
                    btnSubmit.Enabled = False
                End If

            ElseIf (ddlWithdraw.SelectedValue = "Bank Account") Then
                If (BankIBAN.Trim <> "") Then
                    lblPaypalEmail.Text = "We will send you money to your bank account : " & BankIBAN & ". It takes 1 to 4 days for your money to arrive to your bank. Withdrawal to bank account is FREE. Please check our <a href=fees.aspx target=_blank>transfer fees</a>"
                    'btnSubmit.Enabled = True
                Else
                    lblPaypalEmail.Text = "Your Bank IBAN is empty. Please access your <a href='profile.aspx' target=_blank>Profile</a> section and provide your Bank IBAN"
                    btnSubmit.Enabled = False
                End If
            End If

        Else

            txtDepositAmount.Enabled = True

            ddlWithdraw.Enabled = True
            ddlCurrency.Enabled = True

            lblQueueMsg.Text = ""
            lbldescNote.Text = ""
        End If

    End Sub



    Protected Sub ManageBtcButtons()

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from ManageBtcButtons")
        Try

            If reader.HasRows = True Then
                reader.Read()
                BtcBidMin = IIf(IsDBNull(reader("BtcBidMin")) Or reader("BtcBidMin") = "", 0, Convert.ToInt16(reader("BtcBidMin")))
                BtcBidMax = IIf(IsDBNull(reader("BtcBidMax")) Or reader("BtcBidMax") = "", 0, Convert.ToInt16(reader("BtcBidMax")))
                BidMessage = IIf(IsDBNull(reader("BidMessage")), "", reader("BidMessage"))
            End If


        Catch ex As Exception

            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Sub


    Protected Function getUserPaypalEmail(ByVal userId As Integer) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID") & " ")
        Try

            Dim res As String

            If reader.HasRows = True Then

                reader.Read()

                res = IIf(IsDBNull(reader("PaypalEmail")), "", reader("PaypalEmail").trim)
                Cash = IIf(IsDBNull(reader("CashPickupcountry")), "", reader("CashPickupcountry").trim)
                PickupLink = getPickupLink(Cash)
                BankIBAN = IIf(IsDBNull(reader("IBAN")), "", reader("IBAN").trim)
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

    Protected Function getUserIBAN(ByVal userId As Integer) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID") & " ")
        Try

            Dim BankIBAN As String

            If reader.HasRows = True Then

                reader.Read()


                BankIBAN = IIf(IsDBNull(reader("IBAN")), "", reader("IBAN").trim)
            Else

                BankIBAN = ""
            End If

            Return BankIBAN
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Function

    Protected Function getPickupLink(ByVal Country As String) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select PickupBranchesLink from countryWithdraw where CountryName = '" & Country & "' ")
        Try

            Dim res As String

            If reader.HasRows = True Then

                reader.Read()

                res = reader("PickupBranchesLink")
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

    Protected Function isUserHasPendingBtcPayments(ByVal userId As Integer) As String
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where (status='Pending' or status='Process' ) and UserID = " & Session("UserID") & " and OrderType='Sell'  ")
        Try

            Dim res As String

            If reader.HasRows = True Then
                reader.Read()
                pendingUsdAmount = reader("AmountUSD")
                pendingBtcAmount = reader("AmountBTC")
                pendingWithdrawMethod = reader("WithdrawMethod")
                pendingCurrency = reader("Currency")
                Queue = reader("ID")
                res = reader("Status")
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

    Protected Function isQueueIdFinished(ByVal QueueId As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Payments where ID = " & QueueId)
        Try

            Dim res As Boolean


            If reader.HasRows = True Then
                reader.Read()
                If (reader("Status") = "Finished") Then
                    res = True
                Else
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

    Protected Sub ddlWithdraw_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlWithdraw.SelectedIndexChanged

        'Dim PaypalEmail As String = getUserPaypalEmail(Session("UserId"))

        'If (ddlWithdraw.SelectedValue = "0") Then
        '    lblPaypalEmail.Text = ""
        '    btnSubmit.Enabled = True

        'ElseIf (ddlWithdraw.SelectedValue = "Paypal") Then
        '    If (PaypalEmail.Trim <> "") Then
        '        lblPaypalEmail.Text = "We will send you money to the following paypal email account : " & PaypalEmail
        '        btnSubmit.Enabled = True

        '    Else
        '        lblPaypalEmail.Text = "Your Paypal Email is empty. Please access your <a href='profile.aspx' target=_blank>Profile</a> section and provide your Paypal email"
        '        btnSubmit.Enabled = False
        '    End If

        'ElseIf (ddlWithdraw.SelectedValue = "Cash Pickup") Then
        '    If (Cash.Trim <> "") Then
        '        lblPaypalEmail.Text = "We will send you cash to the following country : " & Cash & ". <a href='" & PickupLink & "' title='Pickup points' class='Redtextbold' target=_blank>[Check the pickup points]</a>"
        '        btnSubmit.Enabled = True
        '    Else
        '        lblPaypalEmail.Text = "You did not specified a Cash Pickup country. Access your <a href='profile.aspx' target=_blank>Profile</a> section and provide your Cash Pickup country"
        '        btnSubmit.Enabled = False
        '    End If

        'ElseIf (ddlWithdraw.SelectedValue = "Bank Account") Then

        BankIBAN = getUserIBAN(Session("UserId"))

        If (BankIBAN.Trim <> "") Then
            lblPaypalEmail.Text = "We will send you money to your bank account : " & BankIBAN & ". It takes maximum 4 days for your money to arrive to your bank.<br> Wihdrawal to Bank accounts is FREE"
            btnSubmit.Enabled = True
        Else
            lblPaypalEmail.Text = "Your Bank IBAN is empty. Please access your <a href='profile.aspx' target=_blank>Profile</a> section and provide your Bank IBAN"
            btnSubmit.Enabled = False
        End If
        ' End If


    End Sub

    Protected Sub btnCancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelPayment.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=SellBitcoins")
        End If

        Dim opExec As New rpchost.cs_Operation
        Try
            opExec.ExecuteSql("update Payments set [Status]='Canceled' where UserID=" & Session("UserID") & " and [Status] = 'Pending' and ID= " & Queue)

            Try
                SendNotification.Email("SELL BTC Payment Canceled by you on: " & Logger.GenerateTimeZone("Eastern Standard Time"), "Payment Details : <br><br> UserID = " & Session("UserID") & "<br>TransactionID = " & Queue & "<br><br>Best Regards<br>Rpchost.com ", Session("Email"))
            Catch ex As Exception
            End Try

            Response.Redirect("Transactions.aspx")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Sub ddlCurrency_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCurrency.SelectedIndexChanged

        'txtUsdAmount.Text = ""
        'txtDepositAmount.Text = ""

        calculateSellUsdPrices()

    End Sub

    Protected Sub txtUsdAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUsdAmount.TextChanged
        calculateSellUsdPrices()
    End Sub
End Class
