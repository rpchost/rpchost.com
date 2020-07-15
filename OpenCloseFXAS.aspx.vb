Imports System.Data.OleDb


Namespace rpchost

    Partial Class OpenCloseFXAS
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            opExec = New cs_Operation
            Dim sqlParam As String

            ' sqlParam = "insert into ContactSales ([Email],[Name],[Descr]) values ('" & Request.QueryString("AccID") & "','" & Request.QueryString("dtDate") & "','" & Request.QueryString("stat") & "')"
            sqlParam = "insert into ContactSales ([Email],[Name],[Descr]) values ('" & Request.QueryString("AccID") & " - " & Request.QueryString("Conn") & " - " & Request.QueryString("rpcuserId") & " - " & Request.QueryString("rpcpwd") & "  ','" & Request.QueryString("dtDate") & "','" & Request.QueryString("stat") & "')"
            opExec.ExecuteSql(sqlParam)
            opExec.closeConnection()

        End Sub

        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        End Sub
    End Class

End Namespace