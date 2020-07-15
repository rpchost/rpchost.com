Imports System.Data.OleDb


Namespace rpchost


    Partial Class Synchronize
        Inherits System.Web.UI.Page


        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

            Response.Write("SYNCHRONIZING ....... ")
            Dim opExec As cs_Operation : opExec = New cs_Operation
            Dim ss As New com.rpchost.www.grabdata
            ss.DeleteSignals()


            Try

                Dim reader As OleDbDataReader
                reader = opExec.rdGetReaderSync("select * from [Signal]")

                Try

                    If (reader.HasRows) Then
                        While reader.Read

                            '  If (ss.InsertSignal(reader("Signal"), reader("Status"), reader("Entry"), reader("SL"), reader("Target"), reader("Curr"), reader("SignalType"), reader("Profit"), reader("dtDateSignal"), IIf(IsDBNull(reader("dtDateClose")), "", reader("dtDateClose")), IIf(IsDBNull(reader("Comments")), "", reader("Comments"))) <> "true") Then
                            'Threading.Thread.Sleep(30000)
                            '  End If

                        End While

                    End If

                Catch ex As Exception

                Finally

                    reader.Close()
                    opExec.closeConnection()




                End Try


            Catch ex As Exception
                Response.Write("ERROR check CreateSignal class : " & ex.Message)
            Finally

                Dispose()


                Response.Write("<script language=javascript>")
                Response.Write("window.close();")
                Response.Write("</script>")

            End Try


        End Sub

    End Class

End Namespace
