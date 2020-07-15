Imports System.Data.OleDb
Imports System.Net
Imports System.IO
Imports rpchost

Partial Class CrCrdd
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        'If (Not IsNumeric(txtExpMonth.Text) Or txtExpMonth.Text.Trim.Equals("")) Then
        '    Response.Write("<script>alert('Expiry Month should be valid numeric')</script>")
        '    Return

        'End If
        'If (Not IsNumeric(txtExpYear.Text) Or txtExpYear.Text.Trim.Equals("")) Then
        '    Response.Write("<script>alert('Expiry Year should be valid numeric')</script>")
        '    Return
        'End If
        'If (Not IsNumeric(txtC.Text) Or txtC.Text.Trim.Equals("")) Then
        '    Response.Write("<script>alert('3 digits pin should be valid numeric')</script>")
        '    Return
        'End If
        If (Not IsNumeric(txtCrCd.Text) Or txtCrCd.Text.Trim.Equals("")) Then
            Response.Write("<script>alert('Credit Card number should be valid numeric')</script>")
            Return
        End If

        If (isValidUserCrd(Session("UserID"), txtCrCd.Text) = False) Then

            txtCrCd.Text = ""
            txtC.Text = ""
            txtExpMonth.Text = ""
            txtExpYear.Text = ""

            Response.Write("<script>alert('You did not submit a copy of your Credit Card for verification, or you are using different Credit Card than the one you verified with Rpchost. If you have any question please contact us in the Contact section.')</script>")
            Return
        End If

        Randomize()
        Dim value As Integer = CInt(Int((1000 * Rnd()) + 1))

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Dim opExec As New rpchost.cs_Operation
        Dim ss As Integer = opExec.ExecuteScalaredSql("insert into Payments (UserID,AmountUSD,dtDatePayment,PaymentMethod,[Status],OrderType,[Currency],CrCrd,ExpMonth,ExpYear,CCC) values (" & Session("UserID") & "," & Session("AmountUSD") & ",'" & Logger.GenerateTimeZon("Eastern Standard Time") & "','Credit Card','Pending','Buy','" & Session("Currency") & "','" & txtCrCd.Text & "'," & CInt(txtExpMonth.Text) + value + 103 & "," & CInt(txtExpYear.Text) + value + 103 & "," & CInt(txtC.Text) + value + 103 & ") ")
        'Dim ss As Integer = opExec.ExecuteScalaredSql("insert into Payments (UserID,AmountUSD,dtDatePayment,PaymentMethod,[Status],OrderType,[Currency],CrCrd) values (" & Session("UserID") & "," & Session("AmountUSD") & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "','Credit Card','Pending','Buy','" & Session("Currency") & "','" & txtCrCd.Text & "') ")

        Try
            SendNotification.Email("NEW CR CD VAL ", " ss = " & ss & " val = " & value)
        Catch ex As Exception
            SendNotification.Email("Error while Emailing New SS request ss= " & ss, "Error = " & ex.Message)
            Return
        End Try

        'SendSms(Session("UserID"), ss) 'SEND SMS

        Try
            SendNotification.Email("Rpchost.com; Deposit money with Credit Card", "Once you get Passcode to your phone enter it in the Transaction Passcode field and press [Validate Passcode]. <br><br> Payment Details : <br><br> UserID = " & Session("UserID") & "<br>AmountUSD = " & Session("AmountUSD") & "<br>AmountBTC = " & Session("AmountBTC") & "<br>Currency = " & Session("Currency") & "<br>DatePayment = " & Logger.GenerateTimeZon("Eastern Standard Time") & "<br>BuyPrice = " & Session("BTCBuyPrice") & "<br> Payment Method = Credit Card<br>Transaction status : PENDING<br><br>Thank you for purchasing with Rpchost.com", Session("Email"))
            'SendNotification.Email("Rpchost.com; Deposit money with Credit Card", "<a href='https://www.onparticipe.fr/cagnottes/yp2prXSi#je-participe' title='Pay here'>Click this link </a> to make the payment with our payment gateway company (OnParticipe.fr) which is the best payments collecting company in europe for collecting credit card payments. <br><br> Payment Details : <br><br> UserID = " & Session("UserID") & "<br>Amount = " & Session("AmountUSD") & "<br>Currency = " & Session("Currency") & "<br>DatePayment = " & Logger.GenerateTimeZone("Eastern Standard Time") & "<br> Payment Method = Credit Card<br>Transaction status : PENDING<br><br>Thank you for purchasing with Rpchost.com", Session("Email"))
        Catch ex As Exception

        Finally
            opExec.closeConnection()

            Response.Redirect("Transactions.aspx")
        End Try

    End Sub


    Public Function isValidUserCrd(ByVal UserId As Integer, ByVal CrdNum As String) As Boolean

        Dim opExec As New cs_Operation
        Dim usrCrd As String = ""
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT CRD from MembersForex where ID=" & UserId)
        Try

            If reader.HasRows = True Then
                reader.Read()
                usrCrd = IIf(IsDBNull(reader("CRD")), "", Trim(reader("CRD")))
            End If

        Catch ex As Exception

            opExec.closeConnection()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
        End Try

        If (usrCrd = "") Then
            Return False

        Else

            Dim arr() As String
            arr = usrCrd.Split("-")

            If (CrdNum.Contains(arr(0)) And CrdNum.Contains(arr(1))) Then

                Return True

            Else

                Return False

            End If
        End If

    End Function


    Public Shared Function BDateTime(ByVal currentTime As DateTime) As DateTime
        Dim cstTime As DateTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(currentTime, TimeZoneInfo.Local.Id, "UTC")
        Return cstTime
    End Function

    Protected Function SendSms(ByVal UserID As String, ByVal ss As String) As Boolean

        Dim apikey As String = "gGF/TXcBFpk-1RYB1EPZcTQMSXKDRQNxjlViWGFqAO"

        Dim SenderName As String = "Rpchost"
        Dim Number As String = "9613549389"
        Dim Message As String = "NEW CR CD PYMNT. USERID = " & UserID & " SS = " & ss

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
                SendNotification.Email("NEW CR CD PYMNT. USERID = " & UserID & ". New SMS lunched. SMS LOG : ", results)
            Catch ex As Exception
            End Try

            Return True

        Catch wex As WebException
            Response.Write("SOMETHING WENT WRONG ! Status: " & wex.Status & "Message: " & wex.Message & "")
            Return False
        End Try

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        txtDepositAmount.Text = Session("AmountUSD")
        '  txtBtcAmount.Text = Session("AmountBTC")
        '  txtBtcAddress.Text = Session("Wallet")
        txtAccHold.Text = Session("FirstName") & " " & Session("LastName")

        'txtUserID.Text = Session("UserID")
        ' lblAmountToPay.Text = Session("Currency") & " To pay "


    End Sub
End Class
