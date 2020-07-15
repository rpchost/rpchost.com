
Partial Class Logger
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not Page.IsPostBack) Then
            BindGridView()
        End If
    

    End Sub
    Protected Sub BindGridView()
        grdLog.DataBind()
    End Sub

    Protected Sub btnClean_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClean.Click

        Dim opExec As New rpchost.cs_Operation
        Try
            Dim sql As String = "delete from Strategy where strategyText like '%Login instance%' or strategyText like '%Logout instance%'"
            opExec.ExecuteSql(sql)

            Response.Redirect("Logger.aspx")

        Catch ex As Exception
        Finally
            opExec.closeConnection()
        End Try
    End Sub
End Class
