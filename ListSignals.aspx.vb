
Partial Class ListSignals
    Inherits System.Web.UI.Page

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Dim dd As New grabdata
    '    dd.DeleteSignals()

    '    Response.Redirect("ListSignals.aspx")

    'End Sub

    Protected Sub btnInsertSignal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertSignal.Click
        Dim dd As New grabdata

        If (Request("txtSignal").Trim <> "" And Request("txtStatus").Trim <> "" And Request("txtEntry").Trim <> "" And Request("txtSL").Trim <> "" And Request("txtTarget").Trim <> "" And Request("txtCurr").Trim <> "" And Request("txtDateSignal").Trim <> "") Then

            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("insert into signal ([Status],[Signal],[Entry],[SL],[Target],[Curr],dtDateSignal) values ('T','" & Request("txtSignal").Trim & "','" & Request("txtEntry").Trim & "','" & Request("txtSL").Trim & "','" & Request("txtTarget").Trim & "','" & Request("txtCurr").Trim & "','" & Request("txtDateSignal").Trim & "')")
            opExec.closeConnection()

            Response.Redirect("ListSignals.aspx")

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        txtDateSignal.Text = Logger.GenerateTimeZon("Eastern Standard Time")

    End Sub

End Class
