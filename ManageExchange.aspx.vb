
Partial Class ManageExchange
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

    End Sub

    Protected Sub grdWithdrawal_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdWithdrawal.RowUpdating
        Dim BalanceUSD As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("USDBalance"), TextBox).Text
        Dim ID As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        Dim BalanceBTC As String = DirectCast(grdWithdrawal.Rows(e.RowIndex).FindControl("BTCBalance"), TextBox).Text
      
        If (BalanceBTC.Trim = "") Then
            BalanceBTC = 0
        End If
        If (BalanceUSD.Trim = "") Then
            BalanceUSD = 0
        End If
      
        Dim opExec As New rpchost.cs_Operation


        opExec.ExecuteSql("update Exchange set USDBALANCE = " & BalanceUSD & " ,BTCBalance = " & BalanceBTC & " where UserID= " & UserID)
        opExec.closeConnection()
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        If (Request("txtUserID").Trim = "") Then
            Return
        End If
        If (Not IsNumeric(Request("txtBalanceUSD").Trim) Or Not IsNumeric(Request("txtBalanceBTC").Trim)) Then
            Return
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Exchange (UserID,USDBalance,BTCBalance) values (" & Request("txtUserID").Trim & "," & Request("txtBalanceUSD").Trim & "," & Request("txtBalanceBTC").Trim & ") ")
        opExec.closeConnection()

        Response.Redirect("ManageExchange.aspx")
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/Backend.aspx")
    End Sub
End Class
