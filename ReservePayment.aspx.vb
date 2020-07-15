Imports System.Data.OleDb
Imports System.Net
Imports System.IO

Partial Class ReservePayment
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Dim paymentMethod As String = ""
        Dim OMTN As String = ""
        Dim SenderName As String = ""

        If (Request.QueryString("type") = Nothing) Then
            Response.Redirect("BuyBitcoin.aspx")
        End If
        If (Request.QueryString("type") = "1") Then
            paymentMethod = "CREDITCARD"
        End If
        If (Request.QueryString("type") = "2") Then
            paymentMethod = "PAYPAL"
        End If
        If (Request.QueryString("type") = "3") Then
            paymentMethod = "BANKTRANSFER"
        End If
        If (Request.QueryString("type") = "4") Then
            paymentMethod = "PERFECTMONEY"
        End If
        If (Request.QueryString("type") = "5") Then
            paymentMethod = "WESTERUNION"
        End If
        If (Request.QueryString("type") = "7") Then
            paymentMethod = "OMT"
            'SenderName = Session("FName") + " " + Session("LName")
            'OMTN = Session("OMTN")
        End If
        If (Request.QueryString("type") = "8") Then
            paymentMethod = "WISE"
        End If

        Dim opExec As New rpchost.cs_Operation
        Dim rDate As String = Logger.GenerateTimeZone("Eastern Standard Time")

        Dim rr As New Rate
        Dim Amount As Double = Session("AmountUSD")
        Dim TransID As Integer
        Try

            TransID = opExec.ExecuteScalaredSql("insert into Payments (UserID,AmountUSD, dtDatePayment,BUY_Price, PaymentMethod,[Status],OrderType,[Currency]) values (" & Session("UserID") & "," & Amount & ",'" & rDate & "'," & Session("BTCBuyPrice") & ",'" & paymentMethod & "','Pending','Buy','" & Session("Currency") & "') ")

            Try
                SendNotification.Email("BUY BTC Payment Reserved Successfully on: " & rDate, "Payment Details : <br><br> UserID = " & Session("UserID") & "<br>AmountUSD = " & Session("AmountUSD") & "<br>Currency = " & Session("Currency") & "<br>DatePayment = " & rDate & "<br> Payment Method = " & paymentMethod & "<br>Transaction status : PENDING<br><br>Thank you for Depositing", Session("Email"))
            Catch ex As Exception
            End Try

            SendSms(Session("UserID"), paymentMethod) ' Send notification sms

            If (Request.QueryString("type") = "5") Then
                Try
                    If (Session("Currency") = "EUR") Then
                        SendNotification.Email("Rpchost.com WesterUnion payment details", "Please send payment by WesterUnion to our agent in Europe with the following details : <br><br> <b>Recipient Name</b> : SVITLANA MONYUK<br> <b>Country</b> : CYPRUS <br> <b>Amount</b> : " & Session("AmountUSD") & " " & Session("Currency") & "<br> <b>Message to Recipient</b>: TR[" & TransID & "] <br><br> <u>Once you made the payment with WesterUnion make sure you press [Confirm WU paid] button in your <a href='https://rpchost.com/transactions.aspx' target=_blank>Transactions</a> section and provide the MTCN number and your full name exactly as it appears in the WU receipt, once we receive the payment we will send you the purchased BTC instantly</u><br> <u>This offer will stay valid for 48 hours </u><br><br> Thank you for your purchase request<br>Rpchost.com", Session("Email"))
                    End If
                    If (Session("Currency") = "USD") Then
                        SendNotification.Email("Rpchost.com WesterUnion payment details", "Please send payment by WesterUnion to our agent in Middle East with the following details : <br><br> <b>Recipient Name</b> : JOSEPH CHALHOUB<br> <b>Country</b> : LEBANON <br> <b>City </b>: BEIRUT <br> <b>Amount</b> : " & Session("AmountUSD") & " " & Session("Currency") & "<br> <b>Message to Recipient</b>: TR[" & TransID & "] <br><br> <u>Once you made the payment with WesterUnion make sure you press [Confirm WU paid] button in your <a href='https://rpchost.com/transactions.aspx' target=_blank>Transactions</a> section and provide the MTCN number and your full name exactly as it appears in the WU receipt, once we receive the payment we will send you the purchased BTC instantly</u><br> <u>This offer will stay valid for 48 hours </u><br><br> Thank you for your purchase request<br>Rpchost.com", Session("Email"))
                    End If
                Catch ex As Exception
                End Try
            End If

            Logger.GenerateLog("New Deposit created; Payment Method = " & paymentMethod & "; Transaction ID = " & TransID, Logger.GenerateTimeZone("Middle East Standard Time"), "PaymentsBackend.aspx")

        Catch ex As Exception
            Response.Write(ex.Message)
            SendNotification.Email("Payment did not Reserved Successfully. Check the insert into Payments SQL", "Payment Details : " & vbCrLf & " UserID = " & Session("UserID") & " " & vbCrLf & " AmountUSD = " & Session("AmountUSD") & " " & vbCrLf & " DatePayment = " & rDate & " " & vbCrLf & " BuyPrice = " & Session("BTCBuyPrice") & " " & vbCrLf & " Payment Method = " & paymentMethod & " " & vbCrLf & " Error Details " & ex.Message)
        Finally
            opExec.closeConnection()

            If (Request.QueryString("type") = "1") Then
                Response.Redirect("ValidatePhone.aspx?TransID=" & TransID)
            Else
                Response.Redirect("Transactions.aspx")
            End If

        End Try
    End Sub

    Protected Function SendSms(ByVal UserID As String, ByVal paymentMethod As String) As Boolean

        Dim apikey As String = "gGF/TXcBFpk-1RYB1EPZcTQMSXKDRQNxjlViWGFqAO"

        Dim SenderName As String = "Rpchost"
        Dim Number As String = "9613549389"

        Dim Message As String = "PAYMENT DEPOSIT REQUESTED [ " & paymentMethod & " ]. USERID = " & UserID

        Dim URL As String = "https://api.txtlocal.com/send/?"
        Dim PostData As String = "apikey=" & apikey & "&sender=" & SenderName & "&numbers=" & Number & "&message=" & Message
        Dim req As HttpWebRequest = WebRequest.Create(URL)

        req.Method = "POST"
        Dim encoding As New ASCIIEncoding()
        Dim byte1 As Byte() = encoding.GetBytes(PostData)
        req.ContentType = "application/x-www-form-urlencoded"
        req.ContentLength = byte1.Length
        Dim newStream As Stream = req.GetRequestStream()
        newStream.Write(byte1, 0, byte1.Length)

        Try
            Dim resp As HttpWebResponse = req.GetResponse()
            Dim sr As New StreamReader(resp.GetResponseStream())
            Dim results As String = sr.ReadToEnd()
            sr.Close()

            Try
                SendNotification.Email("PAYMENT DEPOSIT REQUESTED [ " & paymentMethod & " ]. USERID = " & UserID & " . New SMS lunched. SMS LOG : ", results)
            Catch ex As Exception
            End Try

            Return True

        Catch wex As WebException
            Response.Write("SOMETHING WENT WRONG ! Status: " & wex.Status & "Message: " & wex.Message & "")
            Return False
        End Try

    End Function

    Private Function RecalcReserve(ByVal Amount As Double) As Boolean
        Try

            If (Amount > 0) Then

                Dim intAmount As Integer = Convert.ToInt64(Amount)

                Dim opExec As New rpchost.cs_Operation

                If isReserveUnderFld("Max", "Ask", Amount) Then
                    opExec.ExecuteSql("update ManageBtcButtons set btcAskMax = btcAskMax - " & intAmount & ",BuyReserve = BuyReserve - " & intAmount & "  ")

                Else
                    opExec.ExecuteSql("update ManageBtcButtons set BuyReserve = BuyReserve - " & intAmount & " ")
                End If


                opExec.closeConnection()



                Return True
            Else
                Return False
            End If

        Catch ex As Exception

        End Try

    End Function

    Private Function isReserveUnderFld(ByVal MaxMin As String, ByVal AskBid As String, ByVal Amount As Double) As Boolean
        Dim opExec As New rpchost.cs_Operation

        Dim fld As String
        fld = "Btc" & AskBid & MaxMin
        Dim RemReserve As Double = 0

        Dim reader As OleDbDataReader = opExec.rdGetReader("select btcAskMin," & fld & ", BuyReserve from ManageBtcButtons")
        Try

            If reader.HasRows = True Then

                reader.Read()

                RemReserve = reader("BuyReserve") - Amount

                If (RemReserve < reader("btcAskMin")) Then
                    ResetMin()
                End If

                If (RemReserve < reader(fld)) Then
                    Return True
                Else
                    Return False
                End If

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
            Return False
        Finally
            opExec.closeConnection()
        End Try

    End Function

    Private Function ResetMin() As Boolean
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update ManageBtcButtons set btcAskMin = '0', AskMessage='Btc Reserve is empty .. we are recharging' ")
        opExec.closeConnection()
    End Function

End Class
