Imports System.IO


Partial Class getMT4Indicators
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dirInfo As New DirectoryInfo("C:\Documents and Settings\Administrator\Desktop\MT4 Indicators")

        articleList.DataSource = dirInfo.GetFiles()
        articleList.DataBind()
    End Sub


End Class
