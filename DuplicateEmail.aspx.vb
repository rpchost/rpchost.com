Imports System.Data.OleDb
Imports System.Data


Partial Class DuplicateEmail
    Inherits System.Web.UI.Page


    Dim tt As String


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM Table2") ' where ID = " & Trim(txtUsername.Text) & " and Pwd = '" & Trim(txtPwd.Text) & "' ")
        Try
            Dim sqlParam As String



            While reader.Read
                If (isIN(reader("Email")) = True) Then

                    sqlParam = "Delete from Table2 where ID=" & reader("ID")
                    opExec.ExecuteSql(sqlParam)
                    tt = tt & reader("Email") & " --------------- "


                End If
            End While

            Response.Write("tt = " & tt)

        Catch ex As Exception
            'Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try
    End Sub


    Private Function isIN(ByVal email As String) As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM Table3 where SentEmail = '" & Trim(email) & "' ")
        Try

            If reader.HasRows = True Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception
            'Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Function



End Class
