
Imports System.Data.OleDb

Namespace rpchost


    Partial Class RealAccount
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation


        'Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        '  opExec = New cs_Operation
        'Dim sqlParam As String

        '    sqlParam = "insert into Comments (Comments) values ('" & Request("txtName") & " - " & Request("txtEmail") & "')"
        '   opExec.ExecuteSql(sqlParam)

        '   lblMess.Text = "Thank you, you will be notified soon."

        ' End Sub


    End Class


End Namespace
