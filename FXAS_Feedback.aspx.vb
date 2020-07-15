
Partial Class FXAS_Feedback
    Inherits System.Web.UI.Page

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
       
        Dim opExec As New rpchost.cs_Operation
        Dim sqlParam As String

        sqlParam = "insert into IndMess (IndicatorMessages,dtDate) values ('" & Request("txtName") & " - " & Request("txtEmail") & " - " & Request("txtFeedback") & "','" & System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Now)) & "')"
        opExec.ExecuteSql(sqlParam)
        opExec.closeConnection()

        lblMess.Text = "Feedback posted"

        Response.Redirect("FXAS_Feedback.aspx")


    End Sub
End Class
