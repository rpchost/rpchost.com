Imports System.Data.OleDb


Namespace rpchost


    Partial Class CreateSignal
        Inherits System.Web.UI.Page


        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


            Dim opExec As cs_Operation : opExec = New cs_Operation
            Try

                If (Request.QueryString("query") = "I") Then
                    opExec.ExecuteSql("insert into Signal([Signal],Comments,[Status],[Pivot],dtDateSignal,dtDateClose,[Entry],SL,[Target],SignalType,[curr],StudyTime,isFreeSignal,AmountK,Profit) values ('" & Request.QueryString("signal") & "','','" & Request.QueryString("status") & "','','" & Request.QueryString("signalopen") & "','" & Request.QueryString("signalclose") & "','" & Request.QueryString("Rate") & "','" & Request.QueryString("SL") & "','" & Request.QueryString("Target") & "','" & Request.QueryString("Type") & "','" & Request.QueryString("Symbol") & "','',yes," & Request.QueryString("amount") & ",0)")
                    Response.Write("insert into Signal([Signal],Comments,[Status],[Pivot],dtDateSignal,dtDateClose,[Entry],SL,[Target],SignalType,[curr],StudyTime,isFreeSignal,AmountK,Profit) values ('" & Request.QueryString("signal") & "','','" & Request.QueryString("status") & "','','" & Request.QueryString("signalopen") & "','" & Request.QueryString("signalclose") & "','" & Request.QueryString("Rate") & "','" & Request.QueryString("SL") & "','" & Request.QueryString("Target") & "','" & Request.QueryString("Type") & "','" & Request.QueryString("Symbol") & "','',yes," & Request.QueryString("amount") & ",0)")

                End If
                If (Request.QueryString("query") = "U") Then
                    opExec.ExecuteSql("update Signal set [Status] = 'C' where [Status] = 'T' and SignalType <> '" & Request.QueryString("type") & "' and [curr] = '" & Request.QueryString("curr") & "' ")
                End If
                If (Request.QueryString("query") = "D") Then
                    opExec.ExecuteSql("Delete from Signal")
                End If

                opExec.closeConnection()


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
