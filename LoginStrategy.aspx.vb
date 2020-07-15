Imports System.Data

Partial Class LoginStrategy
    Inherits System.Web.UI.Page


    Dim conn As rpchost.cs_Connection
    Dim opExec As rpchost.cs_Operation

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        lblMess.Text = ""
        txtUsrName.TabIndex = 10
        txtPsw.TabIndex = 20
        btnLogin.TabIndex = 30
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim intS As String
        Dim sqlSelect As String
        Dim drLoad As OleDb.OleDbDataReader

        Dim strLoginDate As String

        If IsNumeric(txtUsrName.Text) Then

            Try

                opExec = New rpchost.cs_Operation
                ' conn = New rpchost.cs_Connection

                sqlSelect = "SELECT * FROM MembersForex where ID = " & Trim(txtUsrName.Text) & " and Pwd = '" & Trim(txtPsw.Text) & "' "

                drLoad = opExec.rdGetReader(sqlSelect)

                If drLoad.HasRows = True Then
                    drLoad.Read()
                    Session("UsrID") = drLoad("ID")
                    Session("Name") = drLoad("FirstName") & " " & drLoad("LastName")
                    Response.Redirect("Forex-strategies.aspx")

                Else
                    lblMess.Text = "Invalid username or password"
                End If


            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        Else
            lblMess.Text = "User ID must be numeric"
        End If
    End Sub
End Class
