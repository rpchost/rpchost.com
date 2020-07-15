Imports rpchost
Imports System.Data.OleDb


Partial Class PerformanceDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation

        Dim strYear As String = Request.QueryString("year")
        Dim strMonth As String = Request.QueryString("month")
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT [ID], [Signal], [Status], [dtDateSignal],[dtDateClose], [Entry], [SL], [Target], [Comments],[profit] FROM [Signal] where year(dtDateSignal) = " + strYear + " and month(dtDateSignal) = " + strMonth + "  order by dtDateSignal DESC")
        Try

            If reader.HasRows = True Then

                If (strMonth = Month(Now)) Then
                    Response.Write("Month not finished yet .. wait till end of month")
                Else

                    GridView1.DataSource = reader
                    GridView1.DataBind()
                End If
            Else

                Response.Write("No signals for this month")

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
