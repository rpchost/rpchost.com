Imports System.Data.OleDb
Imports System.Data


Partial Class EditIndicatorEmails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [indicator] ")
        Try

            If reader.HasRows = True Then
                While reader.Read()
                    
                    If (IsDBNull(reader("Code"))) Then
                        updateEmail(CInt(reader("UserID")))

                    End If
                End While
                lblMess.Text = "FINISH EMAIL SYNCHRONIZATION"
            End If


        Catch ex As Exception
            'Response.Write(ex.Message)
        Finally

            opExec.closeConnection()
            Dispose()
        End Try



        
    End Sub

    Private Sub updateEmail(ByVal intID As Integer)
        Dim opExec As New rpchost.cs_Operation
        Dim sqlParam As String

        sqlParam = "update [indicator] set [Code] = '" & getEmail(intID) & "' where trim(UserID)='" & intID & "' "
        opExec.ExecuteSql(sqlParam)
        opExec.closeConnection()

    End Sub

    Private Function getEmail(ByVal intID As Integer) As String

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM MembersForex where ID = " & intID)
        Try

            If reader.HasRows = True Then
                reader.Read()
                Return reader("Email")
            Else
                Return ""
            End If

        Catch ex As Exception
            'Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Function

End Class
