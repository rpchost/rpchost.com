Imports rpchost
Imports System.Data.OleDb

Partial Class Default3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReaderInspection("select * from signal")
        Try

            If reader.HasRows = True Then

                While reader.Read()

                    str = reader("Signal")

                End While

                Response.Write(str)

            End If



        Catch ex As Exception

        Finally


            Dispose()
            opExec.Dispose()

        End Try



    End Sub
End Class
