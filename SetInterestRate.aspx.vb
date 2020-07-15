Imports System.Data.OleDb

Partial Class SetInterestRate
    Inherits System.Web.UI.Page

    Protected Sub btnChangeRate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangeRate.Click

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Rate set Rate=" & Request("txtRate") & " ")
        opExec.closeConnection()

        Response.Redirect("SetInterestRate.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Dim opExecPlan As New rpchost.cs_Operation
        Dim readerPlan As OleDbDataReader = opExecPlan.rdGetReader("select Rate from Rate")
        Try

            If readerPlan.HasRows = True Then
                readerPlan.Read()

                txtRate.Text = readerPlan("Rate")

            End If

        Catch ex As Exception

        Finally
            opExecPlan.closeConnection()
        End Try
    End Sub
End Class
