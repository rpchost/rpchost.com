Imports System.Data.OleDb

Partial Class ManageWithdrawRequests
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub


    Protected Sub grdWithdrawRequests_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdWithdrawRequests.RowUpdating
        Dim WithdrawBtc As String = DirectCast(grdWithdrawRequests.Rows(e.RowIndex).FindControl("WithdrawBtc"), TextBox).Text
        Dim WithdrawUsd As String = DirectCast(grdWithdrawRequests.Rows(e.RowIndex).FindControl("WithdrawUsd"), TextBox).Text
        'Dim RequestDate As String = DirectCast(grdExchageRequests.Rows(e.RowIndex).FindControl("RequestDate"), TextBox).Text
        Dim DoneByAdmin As Boolean = DirectCast(grdWithdrawRequests.Rows(e.RowIndex).FindControl("DoneByAdmin"), CheckBox).Checked
        Dim ID As String = DirectCast(grdWithdrawRequests.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdWithdrawRequests.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        If (WithdrawUsd.Trim = "") Then
            WithdrawUsd = 0
        End If
        If (WithdrawBtc.Trim = "") Then
            WithdrawBtc = 0
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update WithdrawalRequests set WithdrawUsd = " & WithdrawUsd & " ,WithdrawBtc = " & WithdrawBtc & ",DoneByAdmin = " & DoneByAdmin & " where ID = " & ID)
        opExec.closeConnection()

        txtUserID.Text = UserID

    End Sub


    Protected Sub Execute_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdWithdrawRequests.Rows(index).FindControl("ID"), Label).Text
        Dim UserID As String = DirectCast(grdWithdrawRequests.Rows(index).FindControl("UserID"), Label).Text
        Dim WithdrawBtc As String = DirectCast(grdWithdrawRequests.Rows(index).FindControl("WithdrawBtc"), Label).Text
        Dim WithdrawUsd As String = DirectCast(grdWithdrawRequests.Rows(index).FindControl("WithdrawUsd"), Label).Text
        Dim DoneByAdmin As String = DirectCast(grdWithdrawRequests.Rows(index).FindControl("DoneByAdmin"), Label).Text
        Dim Executed As String = DirectCast(grdWithdrawRequests.Rows(index).FindControl("test"), Label).Text

        If (DoneByAdmin = "True" And Executed <> "Y") Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update Exchange set  BtcBalance =  ROUND(BtcBalance - " & WithdrawBtc & ",7),UsdBalance=ROUND(UsdBalance-" & WithdrawUsd & ",2) where UserID = " & UserID)
            opExec.closeConnection()

            opExec = New rpchost.cs_Operation
            opExec.ExecuteSql("update WithdrawalRequests set  test = 'Y' where ID = " & ID)
            opExec.closeConnection()

        End If

        Response.Redirect("ManageWithdrawRequests.aspx")


    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation

        Dim WithdrawBtc As Double
        Dim WithdrawUsd As Double

        If (Request("txtUserID").Trim = "" Or Not IsNumeric(Request("txtUserID").Trim)) Then
            Return
        End If

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from WithdrawalRequests where UserID = " & Request("txtUserID").Trim & " and DoneByAdmin = true ")
        Try
            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("WithdrawUsd"))) Then
                        If (reader("WithdrawUsd") > 0) Then
                            WithdrawUsd = reader("WithdrawUsd")
                        End If
                    End If
                    If (Not IsDBNull(reader("WithdrawBtc"))) Then
                        If (reader("WithdrawBtc") > 0) Then
                            WithdrawBtc = reader("WithdrawBtc")
                        End If
                    End If

                End While

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

      

        Dim opExec2 As New rpchost.cs_Operation
        opExec2.ExecuteSql("delete from WithdrawalRequests where userID = " & Request("txtUserID").Trim & " and DoneByAdmin=yes")
        opExec2.closeConnection()

        Dim opExec3 As New rpchost.cs_Operation
        opExec3.ExecuteSql("update Account set BalanceUSD = BalanceUSD - " & WithdrawUsd & ",BalanceBTC = BalanceBTC - " & WithdrawBtc & " where userID = " & Request("txtUserID").Trim & " ")
        opExec3.closeConnection()

        Response.Redirect("ManageWithdrawRequests.aspx")

    End Sub

  
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
