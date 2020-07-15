Imports System.Data.OleDb
Imports rpchost


Partial Class EditDailyAnalysis
    Inherits System.Web.UI.Page

    Dim conn As rpchost.cs_Connection
    Dim opExec As cs_Operation


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        opExec = New cs_Operation
        Dim sqlParam As String

        sqlParam = "insert into Comments (Comments) values ('" & Request("txtNews") & "')"
        opExec.ExecuteSql(sqlParam)

        Response.Redirect("EditDailyAnalysis.aspx")

    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub
End Class



