
Imports System.Data.OleDb

Namespace rpchost


    Partial Class AddReleasedNews
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation

        Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
            opExec = New cs_Operation
            Dim sqlParam As String

            sqlParam = "insert into ReportAnalysis (ReportName,TimeRelease,[Pair],TradingPair,isTradable) values ('" & Request("txtNews") & "','" & Request("txtDtRelease") & "','" & Request("txtPair") & "','" & Request("txtTradingPair") & "',yes)"
            opExec.ExecuteSql(sqlParam)

            Response.Redirect("AddReleasedNews.aspx")
        End Sub
    End Class


End Namespace