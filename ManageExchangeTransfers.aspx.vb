Imports System.Data.OleDb

Partial Class ManageExchangeTransfers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub


    Protected Sub grdExchangeTransfers_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdExchangeTransfers.RowUpdating
        Dim UsdTransfer As String = DirectCast(grdExchangeTransfers.Rows(e.RowIndex).FindControl("UsdTransfer"), TextBox).Text
        Dim BtcTransfer As String = DirectCast(grdExchangeTransfers.Rows(e.RowIndex).FindControl("BtcTransfer"), TextBox).Text
        'Dim RequestDate As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("RequestDate"), TextBox).Text
        Dim DoneByAdmin As Boolean = DirectCast(grdExchangeTransfers.Rows(e.RowIndex).FindControl("DoneByAdmin"), CheckBox).Checked
        Dim ID As String = DirectCast(grdExchangeTransfers.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdExchangeTransfers.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        If (UsdTransfer.Trim = "") Then
            UsdTransfer = 0
        End If
        If (BtcTransfer.Trim = "") Then
            BtcTransfer = 0
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update ExchangeTransferRequest set UsdTransfer = " & UsdTransfer & " ,BtcTransfer = " & BtcTransfer & ",DoneByAdmin = " & DoneByAdmin & " where ID = " & ID)
        opExec.closeConnection()

        txtUserID.Text = UserID

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation

        Dim UsdTransfer As Double
        Dim BtcTransfer As Double

        If (Request("txtUserID").Trim = "" Or Not IsNumeric(Request("txtUserID").Trim)) Then
            Return
        End If

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ExchangeTransferRequest where UserID = " & Request("txtUserID").Trim & " and DoneByAdmin = true ")
        Try
            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("UsdTransfer"))) Then
                        If (reader("UsdTransfer") > 0) Then
                            UsdTransfer = reader("UsdTransfer")
                        End If
                    End If
                    If (Not IsDBNull(reader("BtcTransfer"))) Then
                        If (reader("BtcTransfer") > 0) Then
                            BtcTransfer = reader("BtcTransfer")
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
            opExec1.ExecuteSql("update Exchange set UsdBalance = UsdBalance - " & UsdTransfer & " ,BtcBalance = BtcBalance - " & BtcTransfer & " where userID = " & Request("txtUserID").Trim)
        End If
        opExec1.closeConnection()

        Dim opExec2 As New rpchost.cs_Operation
        opExec2.ExecuteSql("delete from ExchangeTransferRequest where userID = " & Request("txtUserID").Trim & " and DoneByAdmin=yes")
        opExec2.closeConnection()

        Dim opExec3 As New rpchost.cs_Operation
        opExec3.ExecuteSql("update account set BalanceUSD = BalanceUSD + " & UsdTransfer & ",BalanceBTC = BalanceBTC + " & BtcTransfer & " where userID = " & Request("txtUserID").Trim & " ")
        opExec3.closeConnection()

        Response.Redirect("ManageExchangeTransfers.aspx")

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
