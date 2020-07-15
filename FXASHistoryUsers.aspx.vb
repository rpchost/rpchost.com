Imports System.Data.OleDb


Namespace rpchost



    Partial Class FXASHistoryUsers
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
         
        End Sub

        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
            opExec = New cs_Operation
            Dim sqlParam As String

            ' sqlParam = "insert into ContactSales ([Email],[Name],[Descr]) values ('" & Request.QueryString("AccID") & "','" & Request.QueryString("dtDate") & "','" & Request.QueryString("stat") & "')"
            sqlParam = "Delete from ContactSales"
            opExec.ExecuteSql(sqlParam)
        End Sub
    End Class


End Namespace