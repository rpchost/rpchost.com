Imports System.Data.OleDb

Partial Class StartStopExchange
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        If (Page.IsPostBack = False) Then

            Dim str As String = ""
            Dim opExec As New rpchost.cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select ActivatePaymntComm,ActivateLending from Prices")
            Try

                If reader.HasRows = True Then

                    reader.Read()

                    chkComm.Checked = reader("ActivatePaymntComm")
                    chkLending.Checked = reader("ActivateLending")

                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End If
    End Sub

    Protected Sub btcSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btcSubmit.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Prices set ActivatePaymntComm = " & chkComm.Checked & ", ActivateLending= " & chkLending.Checked & "")
        opExec.closeConnection()

        Response.Redirect("StartStopExchange.aspx")
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/Backend.aspx")
    End Sub
End Class
