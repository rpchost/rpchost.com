
Partial Class AccountWithdrawalRequest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

    End Sub

    Protected Sub grdWithdrawal_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdWithdrawal.RowUpdating
        Dim BalanceUSD As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("BalanceUSD"), TextBox).Text
        Dim ID As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("ID"), TextBox).Text

        Dim BalanceBTC As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("BalanceBTC"), TextBox).Text
        Dim WithdrawUsdAmount As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("WithdrawUsdAmount"), TextBox).Text
        Dim WithdrawUsdAmountTo As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("WithdrawUsdAmountTo"), TextBox).Text
        Dim UsdWithDrawInProcess As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("UsdWithDrawInProcess"), CheckBox).Checked
        Dim WithdrawBTC As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("WithdrawBTC"), TextBox).Text
        Dim BtcWithDrawInProcess As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("BtcWithDrawInProcess"), CheckBox).Checked

        If (BalanceBTC.Trim = "") Then
            BalanceBTC = 0
        End If
        If (BalanceUSD.Trim = "") Then
            BalanceUSD = 0
        End If
        If (WithdrawUsdAmount.Trim = "") Then
            WithdrawUsdAmount = 0
        End If
        If (WithdrawBTC.Trim = "") Then
            WithdrawBTC = 0
        End If

        Dim opExec As New rpchost.cs_Operation
       

        opExec.ExecuteSql("update Account set BalanceUSD = " & BalanceUSD & " ,BalanceBTC = " & BalanceBTC & ",WithdrawUsdAmount = " & WithdrawUsdAmount & ",UsdWithDrawInProcess = " & UsdWithDrawInProcess & ",WithdrawBTC = " & WithdrawBTC & ",BtcWithDrawInProcess = " & BtcWithDrawInProcess & " where ID= " & ID)
        opExec.closeConnection()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim boolUsd As Boolean = False
        Dim boolBtc As Boolean = False

        For Each li As ListItem In chkFilter.Items

            If li.Selected Then
                If (li.Value = "UsdWithdrawInProcess") Then
                    boolUsd = True
                End If
                If (li.Value = "BtcWithdrawInProcess") Then
                    boolBtc = True
                End If
            Else

            End If

        Next


        AccessDataSource1.SelectCommand = "SELECT * FROM [Account] where UsdWithDrawInProcess= " & boolUsd & " and  BtcWithDrawInProcess= " & boolBtc & " "
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        If (Request("txtUserID").Trim = "") Then
            Return
        End If
        If (Not IsNumeric(Request("txtBalanceUSD").Trim) Or Not IsNumeric(Request("txtBalanceBTC").Trim)) Then
            Return
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Account (UserID,BalanceUSD,BalanceBTC) values (" & Request("txtUserID").Trim & "," & Request("txtBalanceUSD").Trim & "," & Request("txtBalanceBTC").Trim & ") ")
        opExec.closeConnection()

        Response.Redirect("AccountWithdrawalRequest.aspx")
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/Backend.aspx")
    End Sub
End Class
