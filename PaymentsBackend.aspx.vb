Imports rpchost
Imports System.Data.OleDb

Partial Class PaymentsBackend
    Inherits System.Web.UI.Page

    Private amountBtc As String
    Private amount As String
    Private BtcAddress As String
    Private BUY_Price As String
    Private Currency As String
    Private UserID As String
    Private Email As String
    Private Status As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub

    

    Protected Sub grdPayments_Editing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grdPayments.RowEditing

        Dim row As Object

        For Each row In grdPayments.Rows
            If (row.Cells(13).Text = "Buy") Then
                row.Cells(13).ForeColor = Drawing.Color.Blue
            End If
            If (row.Cells(13).Text = "Sell") Then
                row.Cells(13).ForeColor = Drawing.Color.Red
            End If

            If (row.Cells(14).Text = "Pending") Then
                row.Cells(14).ForeColor = Drawing.Color.DarkMagenta
            End If
            If (row.Cells(14).Text = "Process") Then
                row.Cells(14).ForeColor = Drawing.Color.Maroon
            End If
            If (row.Cells(14).Text = "Finished") Then
                row.Cells(14).ForeColor = Drawing.Color.DarkGreen
            End If

        Next

    End Sub


    Protected Sub grdPayments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)

        If (e.CommandArgument = "Button1") Then
            Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                           GridViewRow)
            Dim index As Integer = gvRow.RowIndex

            Dim ID As String = DirectCast(grdPayments.SelectedRow.FindControl("ID"), Label).Text
            Status = DirectCast(grdPayments.SelectedRow.FindControl("Status"), Label).Text


            Dim refunded As String = DirectCast(grdPayments.SelectedRow.FindControl("MTCN"), Label).Text


            If (Status = "Canceled" And refunded <> "Yes") Then

                Dim opExec As New rpchost.cs_Operation
                opExec.ExecuteSql("update Payments set MTCN = 'Yes'  where ID = " & ID)
                opExec.closeConnection()

                Response.Redirect("PaymentsBackend.aspx")

            End If
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdPayments.Rows(index).FindControl("ID"), Label).Text
        Dim Status = DirectCast(grdPayments.Rows(index).FindControl("Status"), Label).Text
        Dim Amount = DirectCast(grdPayments.Rows(index).FindControl("AmountUSD"), Label).Text

        ' Dim Canceled As String = DirectCast(grdPayments.Rows(index).FindControl("MTCN"), Label).Text

        Dim orderType As String = DirectCast(grdPayments.Rows(index).FindControl("orderType"), Label).Text


        If (Status = "Pending") Then

            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Payments set  [Status]='Canceled'  where ID = " & ID)
            opExec.closeConnection()

            'If (orderType = "Buy") Then RecalcReserve(Convert.ToDouble(Amount))

            Response.Redirect("PaymentsBackend.aspx")

        End If

    End Sub


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

    Protected Sub grdPayments_Select(ByVal sender As Object, ByVal e As EventArgs) Handles grdPayments.SelectedIndexChanged

       
        UserID = DirectCast(grdPayments.SelectedRow.FindControl("UserID"), HyperLink).Text
        Dim ID As String = DirectCast(grdPayments.SelectedRow.FindControl("ID"), Label).Text
        Status = DirectCast(grdPayments.SelectedRow.FindControl("Status"), Label).Text

        amountBtc = DirectCast(grdPayments.SelectedRow.FindControl("AmountBtc"), Label).Text
        BtcAddress = DirectCast(grdPayments.SelectedRow.FindControl("BtcAddress"), Label).Text
        BUY_Price = DirectCast(grdPayments.SelectedRow.FindControl("BUY_Price"), Label).Text
        Currency = DirectCast(grdPayments.SelectedRow.FindControl("Currency"), Label).Text
        Amount = DirectCast(grdPayments.SelectedRow.FindControl("AmountUSD"), Label).Text

        Dim plan As String = DirectCast(grdPayments.SelectedRow.FindControl("Plan"), Label).Text
        Dim PaymentMethod As String = DirectCast(grdPayments.SelectedRow.FindControl("PaymentMethod"), Label).Text


        If (plan <> "Yes") Then
            Dim rDate As String = Logger.GenerateTimeZone("Eastern Standard Time")
            SendAlert(UserID, getUserMail(UserID), amountBtc, rDate, amount, Currency, ID, Status, PaymentMethod)

            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Payments set Plan = 'Yes'  where ID = " & ID)
            opExec.closeConnection()

            Response.Redirect("PaymentsBackend.aspx")

        End If
    End Sub


    Protected Sub grdPayments_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdPayments.RowUpdating
        Dim PaymentReceived As Boolean = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("PaymentReceived"), CheckBox).Checked
        Dim ID As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        UserID = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        Status = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("Status"), TextBox).Text
        Dim TransactionProfit As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("TransactionProfit"), TextBox).Text

        Dim GrossPaidByClient As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("GrossPaidByClient"), TextBox).Text
        Dim PaypalFee As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("PaypalFee"), TextBox).Text
        Dim OtherFees As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("OtherFees"), TextBox).Text
        Dim NetPaidByClient As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("NetPaidByClient"), TextBox).Text
        Dim RealBtcValue As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("RealBtcValue"), TextBox).Text
        Dim OrderType As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("OrderType"), TextBox).Text

        amountBtc = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("AmountBtc"), TextBox).Text
        Dim Amount As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("AmountUSD"), TextBox).Text
        BtcAddress = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("BtcAddress"), TextBox).Text
        BUY_Price = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("BUY_Price"), TextBox).Text
        Dim Sell_Price As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("Sell_Price"), TextBox).Text
        Currency = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("Currency"), TextBox).Text
        Dim BlockChain As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("BlockChain"), TextBox).Text

        Dim PaymentMethod As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("PaymentMethod"), TextBox).Text
        Dim WithDrawMethod As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("WithDrawMethod"), TextBox).Text
        Dim dtDatePayment As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("dtDatePayment"), TextBox).Text


        Dim CrCrd As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("CrCrd"), TextBox).Text
        Dim ExpMonth As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("ExpMonth"), TextBox).Text
        Dim ExpYear As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("ExpYear"), TextBox).Text
        Dim CCC As String = DirectCast(grdPayments.Rows(e.RowIndex).FindControl("CCC"), TextBox).Text


        If (NetPaidByClient.Trim = "") Then NetPaidByClient = "0"
        If (RealBtcValue.Trim = "") Then RealBtcValue = "0"
        If (GrossPaidByClient.Trim = "") Then GrossPaidByClient = "0"
        If (PaypalFee.Trim = "") Then PaypalFee = "0"
        If (OtherFees.Trim = "") Then OtherFees = "0"
        If (Amount.Trim = "") Then Amount = "0"
        If (amountBtc.Trim = "") Then amountBtc = "0"
        If (BUY_Price.Trim = "") Then BUY_Price = "0"
        If (Sell_Price.Trim = "") Then Sell_Price = "0"

        If (ExpMonth.Trim = "") Then ExpMonth = "0"
        If (ExpYear.Trim = "") Then ExpYear = "0"
        If (CCC.Trim = "") Then CCC = "0"

        Dim profit As Double = Convert.ToDouble(NetPaidByClient) - Convert.ToDouble(RealBtcValue) - Convert.ToDouble(OtherFees)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Payments set CrCrd= '" & CrCrd & "',ExpMonth= " & ExpMonth & ",ExpYear= " & ExpYear & ",CCC= " & CCC & ",UserID= " & UserID & " , [Currency]='" & Currency & "',dtDatePayment='" & dtDatePayment & "',BUY_Price= " & Convert.ToDouble(BUY_Price) & ",Sell_Price= " & Convert.ToDouble(Sell_Price) & ",AmountUSD = " & Convert.ToDouble(Amount) & ",BtcAddress = '" & BtcAddress & "',WithDrawMethod = '" & WithDrawMethod & "',PaymentMethod = '" & PaymentMethod & "',Amountbtc = " & Convert.ToDouble(amountBtc) & ", PaymentReceived = " & PaymentReceived & ",  [Status]='" & Status & "',  OrderType='" & OrderType & "',  [TransactionProfit]=" & profit & ",  GrossPaidByClient='" & Convert.ToDouble(GrossPaidByClient) & "',  PaypalFee='" & Convert.ToDouble(PaypalFee) & "',  OtherFees='" & Convert.ToDouble(OtherFees) & "',NetPaidByClient='" & Convert.ToDouble(NetPaidByClient) & "',RealBtcValue='" & Convert.ToDouble(RealBtcValue) & "',BlockChain='" & BlockChain & "'  where ID = " & ID)
        opExec.closeConnection()

    End Sub

    Protected Function getUserMail(ByVal UserID As Integer) As String

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT Email from MembersForex where ID=" & UserID)
        Try

            If reader.HasRows = True Then
                reader.Read()
                Return Trim(reader("Email"))
            Else
                Return ""
            End If

        Catch ex As Exception

            opExec.closeConnection()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
        End Try

    End Function

    Protected Sub grdPayments_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPayments.Load

        Dim row As Object

        Dim stat As String

        For Each row In grdPayments.Rows

            Try
                stat = DirectCast(row.FindControl("Status"), Label).Text
            Catch ex As Exception
                stat = DirectCast(row.FindControl("Status"), TextBox).Text
            End Try

            If (stat = "Pending") Then
                Try
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Red
                Catch ex As Exception
                    DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Red
                End Try



            End If
            If (stat = "Finished") Then
                Try
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Green
                Catch ex As Exception
                    DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Green
                End Try


            End If

            If (row.Cells(13).Text = "Buy") Then
                row.Cells(13).ForeColor = Drawing.Color.Blue
            End If
            If (row.Cells(13).Text = "Sell") Then
                row.Cells(13).ForeColor = Drawing.Color.Violet
            End If

            If (row.Cells(14).Text = "Pending") Then
                row.Cells(14).ForeColor = Drawing.Color.DarkMagenta
            End If
            If (row.Cells(14).Text = "Process") Then
                row.Cells(14).ForeColor = Drawing.Color.Maroon
            End If
            If (row.Cells(14).Text = "Finished") Then
                row.Cells(14).ForeColor = Drawing.Color.DarkGreen
            End If

        Next

    End Sub

    Protected Function SendAlert(ByVal UserID As String, ByVal Email As String, ByVal AmountBtc As String, ByVal dt As Date, ByVal Amount As String, ByVal Curr As String, ByVal ID As String, ByVal Status As String, ByVal PaymentMethod As String) As Boolean

        Try

            If (Status <> "Process") Then
                SendNotification.Email("Rpchost.com Deposit report", "<br><br> TransactionID : " & ID & "<br> UserID : " & UserID & "<br>Deposit Date : " & dt & "<br>Amount : " & Amount & "<br>Paid Currency : " & Curr & "<br>Payment Method : " & PaymentMethod & "<br>Transaction status : " & Status & " <br><br>Best Regards <br> Rpchost.com", Email)
            Else
                SendNotification.Email("Rpchost.com Payment Received", "<br><br> TransactionID : " & ID & "<br> UserID : " & UserID & "<br>Deposit Date = " & dt & "<br>Amount : " & Amount & "<br>Paid Currency : " & Curr & "<br>Payment Method : " & PaymentMethod & "<br>Transaction status : Payment Received and we are transfering it to your Rpchost account, please give us maximum 2 business days to finish the transfer. <br><br><b>Best Regards</b> <br> <b>Rpchost.com</b>", Email)
            End If

            Return True
        Catch ex As Exception
            Return False
            SendNotification.Email("Rpchost.com Buy BTC report Error for UserID = " & UserID & " TransactionID = " & ID, "rpchost.payments@gmail.com")
        End Try

    End Function

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub

    Protected Sub btnClearCanceled_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearCanceled.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("delete from Payments where Status = 'Canceled' ")
        opExec.closeConnection()

        Response.Redirect("PaymentsBackend.aspx")
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Payments (UserID,btcAddress,AmountUSD,AmountBtc,[Currency],dtDatePayment) values (" & txtUserID.Text & ",'" & txtbtcAddress.Text & "', " & txtAmountUSD.Text & ", " & txtAmountBtc.Text & ", '" & txtCurrency.Text & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "') ")
        opExec.closeConnection()

        Response.Redirect("PaymentsBackend.aspx")
    End Sub
End Class
