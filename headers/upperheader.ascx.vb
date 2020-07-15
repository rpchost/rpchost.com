Imports System.Data.OleDb
Imports rpchost


Partial Class upperheader
    Inherits System.Web.UI.UserControl

    'Public lblText As Label

    'Protected WithEvents lblText As System.Web.UI.WebControls.Label

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim marquee As New Marquee
        ' lblText.Text = Marquee()
      
    End Sub

    Public Function Marquee() As String

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from News")
        Try

            If reader.HasRows = True Then

                While reader.Read()
                    strMarquee = strMarquee & " - " & reader("Description")
                End While

            End If

            Return strMarquee

        Catch ex As Exception

        Finally

            opExec.closeConnection()

        End Try

    End Function

End Class
