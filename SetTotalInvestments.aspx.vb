
Imports System.Data.OleDb

Partial Class SetTotalInvestments
    Inherits System.Web.UI.Page

    Protected Sub btntotalInvestments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btntotalInvestments.Click

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update TotalInvestments set TotalInvestments='" & Request("txtTotalInvestments") & "' ")
        opExec.closeConnection()

        Response.Redirect("SetTotalInvestments.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Dim opExecPlan As New rpchost.cs_Operation
        Dim readerPlan As OleDbDataReader = opExecPlan.rdGetReader("select TotalInvestments from TotalInvestments")
        Try

            If readerPlan.HasRows = True Then
                readerPlan.Read()

                txtTotalInvestments.Text = readerPlan("TotalInvestments")

            End If

        Catch ex As Exception

        Finally
            opExecPlan.closeConnection()
        End Try
    End Sub
End Class
