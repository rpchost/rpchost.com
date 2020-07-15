Imports System.Data.OleDb
Imports System.Net
Imports System.IO

Partial Class Transactions
    Inherits System.Web.UI.Page

    Dim PC As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Transactions")
        End If

        AccessDataSource1.SelectCommand = "Select * from Payments where UserID=" & Session("UserID") & " order by dtDatePayment desc"
        grdHistory.DataBind()

        '        AccessDataSource2.SelectCommand = "Select * from Offers where Status <> 'Running' and UserID=" & Session("UserID") & " order by DateOffer desc"
        'grdOffers.DataBind()

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If


        Dim row As Object

        Dim stat As String

        For Each row In grdHistory.Rows

            Try
                stat = DirectCast(row.FindControl("Status"), Label).Text
            Catch ex As Exception
                stat = DirectCast(row.FindControl("Status"), TextBox).Text
            End Try

            If (stat = "Invalid Passcode") Then
                If DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("CREDITCARD") Or DirectCast(row.FindControl("PaymentMethod"), Label).Text.Equals("Credit Card") Then
                    DirectCast(row.FindControl("btnPass"), Button).Enabled = True
                    DirectCast(row.FindControl("btnPass"), Button).Visible = True
                    DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = True
                    DirectCast(row.FindControl("btnPass"), Button).Text = "ReIssue Passcode"
                    DirectCast(row.FindControl("btnConfirm"), Button).Visible = False
                    DirectCast(row.FindControl("btnConfirmOmt"), Button).Visible = False
                    DirectCast(row.FindControl("ClientPassCode"), TextBox).Enabled = False
                    DirectCast(row.FindControl("ClientPassCode"), TextBox).Text = ""
                End If
            End If

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
                    DirectCast(row.FindControl("btnPass"), Button).Visible = True
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


            If (row.Cells(11).Text = "Buy") Then
                row.Cells(11).ForeColor = Drawing.Color.Blue
            End If
            If (row.Cells(11).Text = "Sell") Then
                row.Cells(11).ForeColor = Drawing.Color.Violet
            End If

            If (row.Cells(12).Text = "Pending") Then
                row.Cells(12).ForeColor = Drawing.Color.DarkMagenta
            End If
            If (row.Cells(12).Text = "Process") Then
                row.Cells(12).ForeColor = Drawing.Color.Violet
            End If
            If (row.Cells(12).Text = "Finished") Then
                row.Cells(12).ForeColor = Drawing.Color.DarkGreen
            End If

        Next


        'For Each row In grdOffers.Rows

        '    Try
        '        stat = DirectCast(row.FindControl("Status"), Label).Text
        '    Catch ex As Exception
        '        stat = DirectCast(row.FindControl("Status"), TextBox).Text
        '    End Try

        '    If (stat = "Pending") Then
        '        Try
        '            DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Red
        '        Catch ex As Exception
        '            DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Red
        '        End Try

        '        DirectCast(row.FindControl("btnOffers"), Button).Enabled = True
        '        DirectCast(row.FindControl("btnOffers"), Button).Visible = True

        '    End If
        '    If (stat = "Finished" Or stat = "Paid") Then
        '        Try
        '            DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Green
        '        Catch ex As Exception
        '            DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Green
        '        End Try

        '        DirectCast(row.FindControl("btnOffers"), Button).Visible = False
        '        DirectCast(row.FindControl("btnBuy"), Button).Visible = False

        '    End If

        '    If (stat = "Canceled") Then

        '        DirectCast(row.FindControl("btnOffers"), Button).Visible = False

        '    End If

        'Next

    End Sub

    Private Function getAdminPassCode(ByVal TransID As Integer) As String
        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select AdminPassCode from Payments where ID = " & TransID)
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("AdminPassCode")

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
            Return "-1"
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

    Public Shared Function BDateTime(ByVal currentTime As DateTime) As DateTime
        Dim cstTime As DateTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(currentTime, TimeZoneInfo.Local.Id, "UTC")
        Return cstTime
    End Function


    Protected Sub btnPass_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
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

            Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")

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
                Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
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

    Protected Function SendSms(ByVal ii As String, ByVal vv As String, ByVal PC As String) As Boolean

        Dim apikey As String = "gGF/TXcBFpk-1RYB1EPZcTQMSXKDRQNxjlViWGFqAO"

        Dim SenderName As String = "Rpchost"
        Dim Number As String = "9613549389"
        Dim Message As String = ""
        If (Not PC.Equals("")) Then Message = "VALIDATE PC. DII = " & ii & " VV = " & vv & " PC = " & PC
        If (PC.Equals("")) Then Message = "REISSUE PC. DII = " & ii

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
                If (Not vv.Equals("")) Then SendNotification.Email("VALIDATE PASSCODE. New SMS lunched. SMS LOG : ", results)

                If (vv.Equals("")) Then SendNotification.Email("REISSUE PASSCODE. New SMS lunched. SMS LOG : ", results)

            Catch ex As Exception

            End Try

            Return True

            'html.Text = results
        Catch wex As WebException
            Response.Write("SOMETHING WENT WRONG ! Status: " & wex.Status & "Message: " & wex.Message & "")
            Return False
        End Try

    End Function


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


    'Protected Sub btnOffers_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
    '                                        GridViewRow)
    '    Dim index As Integer = gvRow.RowIndex

    '    Dim ID As String = DirectCast(grdOffers.Rows(index).FindControl("ID"), Label).Text
    '    Dim Status = DirectCast(grdOffers.Rows(index).FindControl("Status"), Label).Text

    '    If (Status = "Pending") Then

    '        Dim opExec As New rpchost.cs_Operation
    '        opExec.ExecuteSql("update Offers set[Status]='Running',Wallet='' where ID = " & ID)
    '        opExec.closeConnection()

    '        Response.Redirect("Transactions.aspx")

    '    End If

    'End Sub


    'Protected Sub btnbuy_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
    '                                        GridViewRow)
    '    Dim index As Integer = gvRow.RowIndex

    '    Dim ID As String = DirectCast(grdOffers.Rows(index).FindControl("ID"), Label).Text
    '    Dim Status = DirectCast(grdOffers.Rows(index).FindControl("Status"), Label).Text
    '    Dim wallet As String = DirectCast(grdOffers.Rows(index).FindControl("Wallet"), Label).Text
    '    Dim Amount As String = DirectCast(grdOffers.Rows(index).FindControl("Amount"), Label).Text
    '    Dim SellPrice As String = DirectCast(grdOffers.Rows(index).FindControl("SellPrice"), Label).Text
    '    Dim SellCurrency As String = DirectCast(grdOffers.Rows(index).FindControl("SellCurrency"), Label).Text

    '    If (Status = "Pending") Then

    '        Response.Redirect("OfferPayment.aspx?Amount=" & Amount & "&wallet=" & wallet.Trim & "&Price=" & SellPrice & "&Currency=" & SellCurrency & "&OfferID=" & ID)

    '    End If

    'End Sub

    Private Function RecalcReserve(ByVal Amount As Double) As Boolean
        Try

            If (Amount > 0) Then
                Dim opExec As New rpchost.cs_Operation

                opExec.ExecuteSql("update ManageBtcButtons set btcAskMax = btcAskMax + " & Amount & " ,BuyReserve = BuyReserve + " & Amount & "  ")
                opExec.closeConnection()

                Return True
            Else
                Return False
            End If

        Catch ex As Exception

        End Try

    End Function

    Protected Sub grdHistory_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdHistory.Load

        Dim row As Object

        For Each row In grdHistory.Rows
            If (row.Cells(10).Text = "Buy") Then
                row.Cells(10).ForeColor = Drawing.Color.Blue
            End If
            If (row.Cells(10).Text = "Sell") Then
                row.Cells(10).ForeColor = Drawing.Color.Red
            End If

            If (row.Cells(11).Text = "Pending") Then
                row.Cells(11).ForeColor = Drawing.Color.DarkMagenta
            End If
            If (row.Cells(11).Text = "Process") Then
                row.Cells(11).ForeColor = Drawing.Color.Violet
            End If
            If (row.Cells(11).Text = "Finished") Then
                row.Cells(11).ForeColor = Drawing.Color.DarkGreen
            End If

        Next


    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click

    End Sub
End Class
