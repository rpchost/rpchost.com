
Partial Class Auto_Trading_Video1
    Inherits System.Web.UI.Page



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.ContentType = "wmv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=Movie1.wmv")
        Response.TransmitFile(Server.MapPath("Movie1.wmv"))
        Response.End()
    End Sub
End Class
