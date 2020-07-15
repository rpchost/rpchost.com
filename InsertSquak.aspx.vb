Imports rpchost

Partial Class InsertSquak
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Dim strSignals As String


        strSignals = Request.QueryString("value")



        Dim opExec As New cs_Operation
        opExec.ExecuteSql("update SqwakBox set SqwakText = '" & strSignals & "' ")
        opExec.closeConnection()

        Response.Write("<script language=javascript>")
        Response.Write("window.close();")
        Response.Write("</script>")


    End Sub
End Class
