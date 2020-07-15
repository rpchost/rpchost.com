Imports System.Data.OleDb
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web

Partial Class EmailGroup
    Inherits System.Web.UI.Page


    Sub WriteToFile(ByVal str As String, ByVal strFile As String)

        Dim fp As StreamWriter

        Try
            If (File.Exists(Server.MapPath(strFile)) = False) Then
                fp = File.CreateText(Server.MapPath(strFile))
            Else

                fp = File.AppendText(Server.MapPath(strFile))
            End If

            fp.WriteLine(str)

            fp.Close()
        Catch err As Exception
            'lblStatus.Text = "File Creation failed. Reason is as follows "" & err.ToString()"
        Finally

        End Try

    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim i, j, k As Integer

        ' File.WriteAllText(Server.MapPath("TEXT1.txt"), "")

        ' WriteToFile("11", "TEXT1.txt")
        ' WriteToFile("22", "TEXT1.txt")
        ' WriteToFile("33", "TEXT1.txt")

        Dim strMarquee As String = ""

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex")
        Try

            If reader.HasRows = True Then

                While (reader.Read())
                    If (i < 19) Then

                        If (i = 0) Then
                            j = j + 1
                        End If

                        WriteToFile(reader("email"), "Email/email" & j & ".txt")

                        i = i + 1

                    End If

                    If (i >= 19) Then
                        i = 0
                    End If

                End While


            End If


        Catch ex As Exception

        Finally
            opExec.closeConnection()
            'reader.Close()
        End Try

    End Sub


End Class
