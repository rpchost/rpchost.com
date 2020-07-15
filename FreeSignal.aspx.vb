Imports rpchost
Imports System.Data.OleDb


Partial Class FreeSignal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT [ID],[OrderID], [Signal], [Status], [dtDateSignal],[dtDateClose], [Entry], [SL], [Target], [Comments],[profit] FROM [Signal] where year(dtDateSignal) = year(now) and month(dtDateSignal) = month(now) and (day(dtDateSignal) < day(now) or Status = 'C') order by dtDateSignal DESC")
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
