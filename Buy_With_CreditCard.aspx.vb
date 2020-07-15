Imports rpchost
Imports System.Data.OleDb

Partial Class Buy_With_CreditCard
    Inherits System.Web.UI.Page


    Private btcUsdAsk As Double
    Private btcUsdBid As Double
    Private MinAsk As Double
    Private MinBid As Double


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Buy_With_CreditCard")
        End If


        If (isUserVerified(Session("UserID")) = False) Then
            lblVerification.Text = "You have to be verified. Verify your documents <a href=profile.aspx>here</a>"

            btnSubmit.Enabled = False
            btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
            btnSubmit.Text = "Verify your acount First "

            txtDepositAmount.Enabled = False
            txtBtcAddress.Enabled = False
            txtBtcAmount.Enabled = False

            Return

        End If

        If (isUserHasCreditCard(Session("UserID")) = False) Then

            lblVerification.Text = "You have to set all your credit card data with correct data. Set Credit card data <a href=profile.aspx>here</a>"

            btnSubmit.Enabled = False
            btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
            btnSubmit.Text = "Set your Credit Card"

            txtDepositAmount.Enabled = False
            txtBtcAddress.Enabled = False
            txtBtcAmount.Enabled = False

            Return

        End If


        lblAmountToPay.Text = "USD amount you want to pay "

        getBTCprices()

        If (MinAsk > 0) Then
            lblAmountToPay.Text = lblAmountToPay.Text & " (Minimum amount " & MinAsk & " USD )"
        End If


        If (isPaymentInProcess(Session("UserID"))) Then
            btnSubmit.Enabled = False
            btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
            btnSubmit.Text = "Payment In Process "
            lblVerification.Text = "Payment in Process"
            txtDepositAmount.Enabled = False
            txtBtcAddress.Enabled = False
            txtBtcAmount.Enabled = False

        Else
            btnSubmit.Enabled = True
            btnSubmit.CssClass = "INPUTTEXTbtn"
            txtDepositAmount.Enabled = True
            txtBtcAddress.Enabled = True
            txtBtcAmount.Enabled = True
        End If

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

    Protected Sub txtDepositAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDepositAmount.TextChanged

        getBTCprices()

        If (IsNumeric(Request("txtDepositAmount").Trim)) Then
            If (Convert.ToDouble(Request("txtDepositAmount").Trim) > 0) Then

                txtBtcAmount.Text = String.Format("{0:0.00000000}", Convert.ToDouble(Request("txtDepositAmount")) / btcUsdAsk)
            End If
        End If
    End Sub

    Protected Sub txtBtcAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBtcAmount.TextChanged
        getBTCprices()

        If (IsNumeric(Request("txtBtcAmount").Trim)) Then
            If (Convert.ToDouble(Request("txtBtcAmount").Trim) > 0) Then
                txtDepositAmount.Text = Convert.ToDouble(Request("txtBtcAmount")) * btcUsdAsk
            End If
        End If
    End Sub


    Protected Function getBTCprices() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()
                btcUsdAsk = IIf(IsDBNull(reader("BtcUsdAsk")), 0, reader("BtcUsdAsk") + reader("BCC"))
                btcUsdBid = IIf(IsDBNull(reader("btcUsdBid")), 0, reader("btcUsdBid") - reader("BCC"))
                MinAsk = IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))
                MinBid = IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))

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




    Protected Function isPaymentInProcess(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from Payments where PaymentReceived=0 and PaymentCanceled=0 and PaymentMethod='USDBTCCREDITCARD' and UserID=" & UserID)
        Try

            If reader.HasRows = True Then
                reader.Read()
                txtDepositAmount.Text = reader("AmountUSD")
                txtBtcAmount.Text = reader("AmountBTC")
                txtBtcAddress.Text = reader("BtcAddress")

                Return True
            Else
                Return False
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


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        If (Not IsNumeric(Request("txtBtcAmount").Trim)) Then
            Response.Write("<script>alert('Not valid BTC amount')</script>")
        End If
        If (Request("txtBtcAmount").Trim = "") Then
            Response.Write("<script>alert('Btc amount should not be empty')</script>")
        End If

        If (Not IsNumeric(Request("txtDepositAmount").Trim)) Then
            Response.Write("<script>alert('Not valid USD amount')</script>")
        End If
        If (Request("txtDepositAmount").Trim = "") Then
            Response.Write("<script>alert('USD amount should not be empty')</script>")
        End If

        If (Request("txtBtcAddress").Trim = "") Then
            Response.Write("<script>alert('Btc Address should not be empty')</script>")
        End If


        getBTCprices()

        If (MinAsk > 0 And Request("txtDepositAmount") < MinAsk) Then
            Response.Write("<script>alert('Deposit Amount must be >= Minimum amount')</script>")
            Return
        End If


        Dim opExec As New rpchost.cs_Operation
        Try
            opExec.ExecuteSql("insert into Payments (UserID,AmountUSD,AmountBTC, dtDatePayment,BUY_Price, PaymentMethod,BtcAddress) values (" & Session("UserID") & "," & txtDepositAmount.Text & "," & txtBtcAmount.Text & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "'," & btcUsdAsk & ",'USDBTCCREDITCARD','" & txtBtcAddress.Text.Trim & "') ")
            Response.Redirect("Buy_With_CreditCard.aspx")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Sub btnCancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelPayment.Click
        Dim opExec As New rpchost.cs_Operation
        Try
            opExec.ExecuteSql("update Payments set PaymentCanceled=1 where UserID=" & Session("UserID") & " and PaymentMethod='USDBTCCREDITCARD' ")
            Response.Redirect("Buy_With_CreditCard.aspx")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub
End Class
