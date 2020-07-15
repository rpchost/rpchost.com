Imports rpchost
Imports System.Data.OleDb

Partial Class SignalsRefresh
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim strSignals As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Signal where year(dtDateSignal) = year(now) and month(dtDateSignal) = month(now) order by dtDateSignal DESC ")
        Try

            Dim stat As String = ""


            If reader.HasRows = True Then



                While reader.Read()

                    If (reader("Status") = "T") Then
                        stat = "Trading"
                        strSignals = strSignals & reader("ID") & " - " & reader("Signal") & " - " & stat & " - Open Time = " & reader("dtDateSignal") & " - Profit = " & reader("Profit") & "@"
                    Else
                        stat = "Closed"
                        strSignals = strSignals & reader("ID") & " - " & reader("Signal") & " - " & stat & " - Open Time = " & reader("dtDateSignal") & " - Close Time = " & reader("dtDateClose") & " - Profit = " & reader("Profit") & "@"
                    End If



                End While



            End If

            Dim strReportURL As String = "http://www.rpchost.com/InsertSquak.aspx?value=" + strSignals

            'Response.Write("<script language=javascript>")
            'Response.Write("window.open ('" & strReportURL & "', 'CustomPopUp', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='50', height='50', top=5, left=5');")
            'Response.Write("</script>")

            Response.Write("<script>")
            Response.Write("window.open('" & strReportURL & "','_blank')")
            Response.Write("</script>")


        Catch ex As Exception

        Finally
            opExec.closeConnection()
            'reader.Close()
        End Try

    End Sub


End Class
