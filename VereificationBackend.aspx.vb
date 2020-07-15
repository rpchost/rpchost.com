

Partial Class VereificationBackend
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grdVerify_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdVerify.RowUpdating
        ' Dim PaymentReceived As Boolean = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("PaymentReceived"), CheckBox).Checked
        Dim ID As String = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        Dim PassportFile As String = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("PassportFile"), TextBox).Text
        Dim ProofFile As String = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("ProofFile"), TextBox).Text
        Dim PassportStatus As String = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("PassportStatus"), TextBox).Text
        Dim ProofStatus As String = DirectCast(grdVerify.Rows(e.RowIndex).FindControl("ProofStatus"), TextBox).Text


        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Verification set PassportFile = '" & PassportFile & "',ProofFile = '" & ProofFile & "',PassportStatus = '" & PassportStatus & "',ProofStatus = '" & ProofStatus & "' where ID = " & ID)
        opExec.closeConnection()



    End Sub

End Class