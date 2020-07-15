Imports System.Data.OleDb
Imports rpchost

Partial Class ManageInternalExchanges
    Inherits System.Web.UI.Page

    Public btcUsdAsk As Double
    Public btcUsdBid As Double

    Public MainUsdBalance As Double
    Public MainBtcBalance As Double

    Private Email As String
    Private Name As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub


    Protected Sub grdExchageRequests_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdExchageRequests.RowUpdating
        Dim UsdAmountToBtc As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("UsdAmountToBtc"), TextBox).Text
        Dim BtcAmountToUsd As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("BtcAmountToUsd"), TextBox).Text
        Dim DoneByAdmin As Boolean = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("DoneByAdmin"), CheckBox).Checked
        Dim ID As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text
        Dim EurAmountReserved As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("EurAmountReserved"), TextBox).Text
        Dim BtcAmountReserved As String = String.Format("{0:0.0000000}", DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("BtcAmountReserved"), TextBox).Text)
        Dim Done As Boolean = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("DoneByAdmin"), CheckBox).Checked

        Dim ProfitBTC As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("ProfitBTC"), TextBox).Text
        Dim ProfitEUR As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("ProfitEUR"), TextBox).Text

        Dim CoinbasePrice As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("CoinbasePrice"), TextBox).Text
        Dim Coinbase As Double = 0

        If (CoinbasePrice <> "" And IsNumeric(CoinbasePrice)) Then
            Coinbase = CDbl(CoinbasePrice)
        End If

        Dim EurProfit As Double = 0
        Dim BtcProfit As Double = 0

        If (UsdAmountToBtc.Trim = "") Then
            UsdAmountToBtc = 0
        End If
        If (BtcAmountToUsd.Trim = "") Then
            BtcAmountToUsd = 0
        End If

        If (Coinbase <> 0 And Done = True) Then

            If (UsdAmountToBtc > 0 And BtcAmountReserved <> 0) Then
                BtcProfit = Coinbase - BtcAmountReserved
            End If
            If (BtcAmountToUsd > 0 And EurAmountReserved <> 0) Then
                EurProfit = Coinbase - EurAmountReserved
            End If

        Else
            EurProfit = IIf(ProfitEUR = "", 0, ProfitEUR)
            BtcProfit = IIf(ProfitBTC = "", 0, ProfitBTC)
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update InternalExchangeRequests set UsdAmountToBtc = " & UsdAmountToBtc & " ,BtcAmountToUsd = " & BtcAmountToUsd & ",DoneByAdmin = " & DoneByAdmin & ",ProfitEUR = '" & String.Format("{0:0.00000}", EurProfit) & "',ProfitBTC = '" & String.Format("{0:0.000000000}", BtcProfit) & "', CoinbasePrice = " & Coinbase & " where ID = " & ID)
        opExec.closeConnection()

        txtUserID.Text = UserID

    End Sub


    Protected Sub grdExchageRequests_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExchageRequests.Load

        Dim row As Object

        Dim Executed As Boolean
        Dim Refunded As Boolean

        For Each row In grdExchageRequests.Rows

            Executed = DirectCast(row.FindControl("DoneByAdmin"), Label).Text
            Refunded = DirectCast(row.FindControl("Refunded"), Label).Text

            If (Executed = True) Then
                DirectCast(row.FindControl("Execute"), Button).Enabled = False
            Else
                DirectCast(row.FindControl("Execute"), Button).Enabled = True

                DirectCast(row.FindControl("UserID"), HyperLink).CssClass = "RedTextBold"
                DirectCast(row.FindControl("MainUsdBalance"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("MainBTCBalance"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("UsdAmountToBtc"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("BtcAmountReserved"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("BtcAmountToUsd"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("EurAmountReserved"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("CoinbasePrice"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("DateRequest"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("Refunded"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("DoneByAdmin"), Label).CssClass = "RedTextBold"
                DirectCast(row.FindControl("BTCEUR"), Label).CssClass = "RedTextBold"

            End If

            If (Refunded = True) Then
                DirectCast(row.FindControl("Refund"), Button).Enabled = False
            Else
                DirectCast(row.FindControl("Refund"), Button).Enabled = True
            End If

        Next

    End Sub

    Protected Sub Execute_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim UserID As String = DirectCast(grdExchageRequests.Rows(index).FindControl("UserID"), HyperLink).Text
        Dim UsdAmountToBtc As String = String.Format("{0:0.0000000}", DirectCast(grdExchageRequests.Rows(index).FindControl("UsdAmountToBtc"), Label).Text)
        Dim BtcAmountToUsd As String = DirectCast(grdExchageRequests.Rows(index).FindControl("BtcAmountToUsd"), Label).Text
        Dim EurAmountReserved As String = DirectCast(grdExchageRequests.Rows(index).FindControl("EurAmountReserved"), Label).Text
        Dim BtcAmountReserved As String = String.Format("{0:0.0000000}", DirectCast(grdExchageRequests.Rows(index).FindControl("BtcAmountReserved"), Label).Text)
        Dim Done As String = DirectCast(grdExchageRequests.Rows(index).FindControl("DoneByAdmin"), Label).Text
        Dim ID As Integer = DirectCast(grdExchageRequests.Rows(index).FindControl("ID"), Label).Text

        If (UsdAmountToBtc <> "" And Done = "False") Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Exchange set UsdBalance = ROUND(UsdBalance - " & UsdAmountToBtc & ",2) ,BtcBalance = ROUND(BtcBalance + " & BtcAmountReserved & ",7) where UserID = " & UserID)
            opExec.closeConnection()

            getBalances(UserID)

            opExec = New rpchost.cs_Operation
            opExec.ExecuteSql("update InternalExchangeRequests set DoneByAdmin = yes, MainUsdBalance=" & MainUsdBalance & ",MainBtcBalance=" & MainBtcBalance & " where ID = " & ID)
            opExec.closeConnection()

            'SendAlert(UserID, ID)

        End If
        If (BtcAmountToUsd <> "" And Done = "False") Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Exchange set UsdBalance = ROUND(UsdBalance + " & EurAmountReserved & ",2) ,BtcBalance = ROUND(BtcBalance,7) - ROUND(" & BtcAmountToUsd & ",7) where UserID = " & UserID)
            opExec.closeConnection()

            getBalances(UserID)

            opExec = New rpchost.cs_Operation
            opExec.ExecuteSql("update InternalExchangeRequests set DoneByAdmin = yes,MainUsdBalance = " & MainUsdBalance & ",MainBtcBalance=" & MainBtcBalance & " where ID = " & ID)
            opExec.closeConnection()

            'SendAlert(UserID, ID)
        End If

        Response.Redirect("ManageInternalExchanges.aspx")

    End Sub

    Protected Function SendAlert(ByVal UserID As String, ByVal ExchangeID As Integer) As Boolean

        getUserInfo(UserID)

        Try
            SendNotification.Email("Your Rpchost.com Exchange operation has been executed successfully", "<br><br> Dear " & Name & " , Your Operation having the Exchange ID = " & ExchangeID & " has been executed successfully. <br><br>Thank you for Exchanging with Rpchost.com", Email)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    Protected Sub getUserInfo(ByVal UserID As Integer)
        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select Email,FirstName, LastName from MembersForex where ID = " & UserID)
        Try

            If reader.HasRows = True Then

                reader.Read()

                Email = reader("Email")
                Name = reader("FirstName") & " " & reader("LastName")

            Else

                Email = ""
                Name = ""

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub


    Protected Sub Refund_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim UserID As String = DirectCast(grdExchageRequests.Rows(index).FindControl("UserID"), Label).Text
        Dim UsdAmountToBtc As String = String.Format("{0:0.00000000}", DirectCast(grdExchageRequests.Rows(index).FindControl("UsdAmountToBtc"), Label).Text)
        Dim BtcAmountToUsd As String = DirectCast(grdExchageRequests.Rows(index).FindControl("BtcAmountToUsd"), Label).Text
        Dim EurAmountReserved As String = DirectCast(grdExchageRequests.Rows(index).FindControl("EurAmountReserved"), Label).Text
        Dim BtcAmountReserved As String = String.Format("{0:0.00000000}", DirectCast(grdExchageRequests.Rows(index).FindControl("BtcAmountReserved"), Label).Text)
        Dim Done As String = DirectCast(grdExchageRequests.Rows(index).FindControl("DoneByAdmin"), Label).Text
        Dim ID As Integer = DirectCast(grdExchageRequests.Rows(index).FindControl("ID"), Label).Text
        Dim Refunded As Boolean = DirectCast(grdExchageRequests.Rows(index).FindControl("Refunded"), Label).Text

        If (UsdAmountToBtc <> "" And Done = "True" And Refunded = "False") Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Exchange set UsdBalance = ROUND(UsdBalance + " & UsdAmountToBtc & ",2) ,BtcBalance = ROUND(BtcBalance - " & BtcAmountReserved & ",7) where UserID = " & UserID)
            opExec.closeConnection()

            getBalances(UserID)

            opExec = New rpchost.cs_Operation
            opExec.ExecuteSql("update InternalExchangeRequests set MainUsdBalance=" & MainUsdBalance & ",MainBtcBalance=" & MainBtcBalance & ", Refunded=1 where ID = " & ID)
            opExec.closeConnection()


        End If
        If (BtcAmountToUsd <> "" And Done = "True" And Refunded = "False") Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Exchange set UsdBalance = ROUND(UsdBalance - " & EurAmountReserved & ",2) ,BtcBalance = ROUND(BtcBalance,7) + ROUND(" & BtcAmountToUsd & ",7) where UserID = " & UserID)
            opExec.closeConnection()

            getBalances(UserID)

            opExec = New rpchost.cs_Operation
            opExec.ExecuteSql("update InternalExchangeRequests set MainUsdBalance = " & MainUsdBalance & ",MainBtcBalance=" & MainBtcBalance & " , Refunded=1 where ID = " & ID)
            opExec.closeConnection()
        End If

        Response.Redirect("ManageInternalExchanges.aspx")

    End Sub

    Protected Sub getBalances(ByVal UserID As Integer)

        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select UsdBalance, BtcBalance from Exchange where UserID = " & UserID & " ")
        Try
            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("UsdBalance"))) Then
                        MainUsdBalance = reader("UsdBalance")
                    Else
                        MainUsdBalance = 0
                    End If

                    If (Not IsDBNull(reader("BtcBalance"))) Then
                        MainBtcBalance = reader("BtcBalance")
                    Else
                        MainBtcBalance = 0
                    End If

                End While

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation

        Dim UsdAmountToBtc As Double
        Dim BtcAmountToUsd As Double

        getBTCprices()

        If (Request("txtUserID").Trim = "" Or Not IsNumeric(Request("txtUserID").Trim)) Then
            Return
        End If

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InternalExchangeRequests where UserID = " & Request("txtUserID").Trim & " and DoneByAdmin = true ")
        Try
            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("UsdAmountToBtc"))) Then
                        If (reader("UsdAmountToBtc") > 0) Then
                            UsdAmountToBtc = reader("UsdAmountToBtc")
                        End If
                    End If
                    If (Not IsDBNull(reader("BtcAmountToUsd"))) Then
                        If (reader("BtcAmountToUsd") > 0) Then
                            BtcAmountToUsd = reader("BtcAmountToUsd")
                        End If
                    End If

                End While

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

        Dim opExec1 As New rpchost.cs_Operation
        ' If (isUserHasInternalExchangeRecord(Request("txtUserID").Trim)) Then
        If (BtcAmountToUsd > 0) Then
            opExec1.ExecuteSql("update Exchange set  BtcBalance = BtcBalance - " & BtcAmountToUsd & ", UsdBalance = UsdBalance + " & String.Format("{0:0.00000000}", BtcAmountToUsd * btcUsdBid) & ",  Exchanged=1  where userID = " & Request("txtUserID").Trim)
        End If
        If (UsdAmountToBtc > 0) Then
            opExec1.ExecuteSql("update Exchange set UsdBalance = UsdBalance - " & UsdAmountToBtc & ",  BtcBalance = BtcBalance + " & String.Format("{0:0.00000000}", UsdAmountToBtc / btcUsdAsk) & ",  Exchanged=1  where userID = " & Request("txtUserID").Trim)
        End If

        ' End If
        opExec1.closeConnection()

        Dim opExec2 As New rpchost.cs_Operation
        opExec2.ExecuteSql("delete from InternalExchangeRequests where userID = " & Request("txtUserID").Trim & " and DoneByAdmin=yes")
        opExec2.closeConnection()

        Response.Redirect("ManageInternalExchanges.aspx")

    End Sub

    Protected Function getBTCprices() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()
                btcUsdAsk = IIf(IsDBNull(reader("BtcUsdAsk")), 0, reader("BtcUsdAsk"))
                btcUsdBid = IIf(IsDBNull(reader("btcUsdBid")), 0, reader("btcUsdBid"))

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

    Protected Function isUserHasInternalExchangeRecord(ByVal UserID As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InternalExchangeRequests where UserID = " & Request("txtUserID").Trim & " ")
        Try

            If reader.HasRows = True Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Function

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim boolUsd As Boolean = False
        Dim boolBtc As Boolean = False

        For Each li As ListItem In chkFilter.Items

            If li.Selected Then
                If (li.Value = "UsdAmountSentFromAccount") Then
                    boolUsd = True
                End If
                If (li.Value = "BtcAmountSentFromAccount") Then
                    boolBtc = True
                End If
            Else

            End If

        Next
        AccessDataSource1.SelectCommand = "SELECT * FROM [InternalExchangeRequests] where UsdAmountSentFromAccount= " & boolUsd & " and  BtcAmountSentFromAccount= " & boolBtc & " "
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
End Class
