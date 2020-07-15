Imports System.Data.OleDb

Partial Class BuyBitcoins
    Inherits System.Web.UI.Page

    Protected Sub btnPayCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayCC.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=1")
        'Response.Redirect("Contribution.aspx")
    End Sub

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

        If (strPaymntCrCd = True) Then
            lblCrPendingPaymnt.Text = "1 pending CREDITCARD transaction "
        End If
        If (strPaymntPaypal = True) Then
            lblPayplPendingPaymnt.Text = "1 pending PAYPAL transaction "
        End If
        If (strBankPaymntBnk = True) Then
            lblBnkPendingPaymnt.Text = "1 pending BANKTRANSFER transaction "
        End If

        If (strBankPaymntPerfect = True) Then
            lblPMPendingPaymnt.Text = "1 pending PERFECTMONEY transaction "
        End If
        If (strBankPaymntWester = True) Then
            lblWesterPendingPaymnt.Text = "1 pending WESTERUNION transaction "
        End If
        If (strRev = True) Then
            lblRevolutPendingPaymnt.Text = "1 pending REVOLUT transaction "
        End If
        If (strOMT = True) Then
            lblOMTPendingPaymnt.Text = "1 pending OMT transaction "
        End If

        If (Not isUserVerified(Session("UserID"))) Then
            lblVerMessage.Text = "Account not verified"
            lblVerMessage.CssClass = "RedNormalText"
            lblVerMessage.NavigateUrl = "AccountVerification.aspx"

            lblPaypalMessage.Text = "Account not verified"
            lblPaypalMessage.CssClass = "RedNormalText"
            lblPaypalMessage.NavigateUrl = "AccountVerification.aspx"

            btnPayCC.Enabled = False
            btnPayPaypal.Enabled = False

        Else
            lblVerMessage.Text = "Account verified"
            lblVerMessage.CssClass = "GreenText"

            lblPaypalMessage.Text = "Account verified"
            lblPaypalMessage.CssClass = "GreenText"

            btnPayCC.Enabled = True
            ' btnPayPaypal.Enabled = True
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

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

    Protected Sub btnPayPaypal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayPaypal.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=2")
    End Sub

    Protected Sub btnPayBankTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayBankTransfer.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=3")
    End Sub

    Protected Sub btnPayPerf_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayPerf.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=4")
    End Sub

    Protected Sub btnPayMoneyGram_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayMoneyGram.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=5")
    End Sub

    Protected Sub btnPayRevolut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayRevolut.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=6")
    End Sub

    Protected Sub btnOmt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOmt.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=7")
    End Sub

    Protected Sub btnWise_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWise.Click
        Response.Redirect("BuyBitcoins_CC.aspx?type=8")
    End Sub
End Class
