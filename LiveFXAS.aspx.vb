
Imports System.Data.OleDb

Namespace Rpchost


    Partial Class LiveFXAS
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation



        Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
            Response.Redirect("FXAS.aspx")
        End Sub

        Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

            opExec = New cs_Operation
            Dim sqlParam As String

            sqlParam = "insert into [Comments] (Comments) values ('" & txtExpiry.Text & "')"
            opExec.ExecuteSql(sqlParam)

            Response.Redirect("LiveFXAS.aspx")

        End Sub
    End Class


End Namespace
