Imports rpchost
Imports System.Data.OleDb

Partial Class FeedBack
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Table1]")
        Try

            If reader.HasRows = True Then

                GridView1.DataSource = reader
                GridView1.DataBind()


            End If



        Catch ex As Exception

            'opExec.closeConnection()
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)



        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Sub

End Class
