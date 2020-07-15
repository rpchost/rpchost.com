Imports System.Data.OleDb
Imports System.Data


Partial Class GetUserID
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        lblRes.Text = ""

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM MembersForex where [Email] = '" & Trim(txtEmail.Text) & "' ")
        ' Try

        If reader.HasRows = True Then

            reader.Read()

            lblRes.Text = "UserID = " & reader("ID") & " <br> password = " & reader("pwd")

        Else
            lblRes.Text = "You are not a registered user. please register first."

        End If

        ' Catch ex As Exception
        'Response.Write(ex.Message)
        ' Finally
        opExec.closeConnection()
        Dispose()
        ' End Try
    End Sub

    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblRes.Text = ""
    End Sub
End Class
