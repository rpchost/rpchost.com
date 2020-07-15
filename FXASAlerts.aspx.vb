
Imports System.Data.SqlClient


Namespace rpchost


    Partial Class FXASAlerts
        Inherits System.Web.UI.Page

        Dim conn As cs_ConnectionSQL
        Dim opExec As cs_OperationSQL


        Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

            opExec = New rpchost.cs_OperationSQL
            Dim sqlParam As String

            sqlParam = "update Marquee set MarqueeText = '" & txtAlerts.Text & "' "
            opExec.ExecuteSql(sqlParam)

            Response.Write("Alert edited.")

        End Sub


       

        Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
            Response.Redirect("backend/backend.aspx")
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            Dim dd As New grabdata
            lblAlert.Text = dd.getMarquee()

        End Sub
    End Class


End Namespace