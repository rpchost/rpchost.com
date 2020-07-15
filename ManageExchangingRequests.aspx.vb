Imports System.Data.OleDb

Partial Class ManageExchangingRequests
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub


    Protected Sub grdExchageRequests_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdExchageRequests.RowUpdating
        Dim BtcAmountSentFromAccount As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("BtcAmountSentFromAccount"), TextBox).Text
        Dim UsdAmountSentFromAccount As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("UsdAmountSentFromAccount"), TextBox).Text
        'Dim RequestDate As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("RequestDate"), TextBox).Text
        Dim DoneByAdmin As Boolean = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("DoneByAdmin"), CheckBox).Checked
        Dim ID As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        If (BtcAmountSentFromAccount.Trim = "") Then
            BtcAmountSentFromAccount = 0
        End If
        If (UsdAmountSentFromAccount.Trim = "") Then
            UsdAmountSentFromAccount = 0
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update ExchangeRequest set UsdAmountSentFromAccount = " & UsdAmountSentFromAccount & " ,BtcAmountSentFromAccount = " & BtcAmountSentFromAccount & ",DoneByAdmin = " & DoneByAdmin & " where ID = " & ID)
        opExec.closeConnection()

        txtUserID.Text = UserID

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation

        Dim UsdAmountToSendToExchange As Double
        Dim BtcAmountToSendToExchange As Double

        If (Request("txtUserID").Trim = "" Or Not IsNumeric(Request("txtUserID").Trim)) Then
            Return
        End If

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ExchangeRequest where UserID = " & Request("txtUserID").Trim & " and DoneByAdmin = true ")
        Try
            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("UsdAmountSentFromAccount"))) Then
                        If (reader("UsdAmountSentFromAccount") > 0) Then
                            UsdAmountToSendToExchange = reader("UsdAmountSentFromAccount")
                        End If
                    End If
                    If (Not IsDBNull(reader("BtcAmountSentFromAccount"))) Then
                        If (reader("BtcAmountSentFromAccount") > 0) Then
                            BtcAmountToSendToExchange = reader("BtcAmountSentFromAccount")
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
        If (isUserHasExchangeRecord(Request("txtUserID").Trim)) Then
            opExec1.ExecuteSql("update Exchange set UsdBalance = UsdBalance + " & UsdAmountToSendToExchange & " ,BtcBalance = BtcBalance + " & BtcAmountToSendToExchange & " where userID = " & Request("txtUserID").Trim)
        Else
            opExec1.ExecuteSql("insert into Exchange (UsdBalance,BtcBalance,UserID) values (" & UsdAmountToSendToExchange & "," & BtcAmountToSendToExchange & "," & Request("txtUserID").Trim & ") ")
        End If
        opExec1.closeConnection()

        Dim opExec2 As New rpchost.cs_Operation
        opExec2.ExecuteSql("delete from ExchangeRequest where userID = " & Request("txtUserID").Trim & " and DoneByAdmin=yes")
        opExec2.closeConnection()

        Dim opExec3 As New rpchost.cs_Operation
        opExec3.ExecuteSql("update account set BalanceUSD = BalanceUSD - " & UsdAmountToSendToExchange & ",BalanceBTC = BalanceBTC - " & BtcAmountToSendToExchange & " where userID = " & Request("txtUserID").Trim & " ")
        opExec3.closeConnection()

        Response.Redirect("ManageExchangingRequests.aspx")

    End Sub

    Protected Function isUserHasExchangeRecord(ByVal UserID As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Exchange where UserID = " & Request("txtUserID").Trim & " ")
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
        AccessDataSource1.SelectCommand = "SELECT * FROM [ExchangeRequest] where UsdAmountSentFromAccount= " & boolUsd & " and  BtcAmountSentFromAccount= " & boolBtc & " "
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
End Class
