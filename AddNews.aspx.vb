
Imports System.Data.OleDb

Namespace rpchost


    Partial Class AddNews
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation


        Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
            opExec = New cs_Operation
            Dim sqlParam As String

            sqlParam = "insert into News (Description) values ('" & Request("txtNews") & "')"
            opExec.ExecuteSql(sqlParam)

            Response.Redirect("AddNews.aspx")

        End Sub

        Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click

            If IsNothing(Session("USR")) = True Then
                Response.Redirect("loginbackend.aspx")
            End If


            Response.Redirect("backend/backend.aspx")
        End Sub
    End Class


End Namespace