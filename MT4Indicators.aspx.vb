Imports System.IO

Partial Class MT4Indicators
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dirInfo As New DirectoryInfo(Server.MapPath("MT4Indicators"))


        Dim hc1 As New HyperLinkColumn
        hc1.DataTextField = "Name"

        hc1.DataNavigateUrlField = "Name"

        hc1.DataNavigateUrlFormatString = "MT4Indicators/{0}"

        hc1.HeaderText = "Indicator Name"

        articleList.Columns.Add(hc1)


        articleList.DataSource = dirInfo.GetFiles()


        articleList.DataBind()
    End Sub
End Class
