Imports rpchost
Imports System.Data.OleDb


Partial Class TradingSignals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim opExec As New cs_Operation

        Dim strMarquee As String = ""
        Dim strStatus As String = ""

        Dim reader As OleDbDataReader = opExec.rdGetReader("select Status from Membersforex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (reader("Status") <> "P") Then

                    Response.Write("<br><br><span class=RedTextBold>This service costs 15 USD / month, please <a href=buybitcoin.aspx target='_Parent' title='Deposit 15$'>deposit</a> the amount in order to activate this service. <br>You can also deposit 20$ to get the signals by sms</a>")

                End If


            End If


        Catch ex As Exception

        Finally
            opExec.closeConnection()
        End Try


        opExec = New cs_Operation
        reader = opExec.rdGetReader("SELECT [ID], [Signal], [Status], [dtDateSignal],[dtDateClose], [Entry], [SL], [Target], [Comments], [Profit] FROM [Signal] where status = 'T' order by dtDateSignal DESC")
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

    Protected Function isMember(ByVal userID As String) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select Status,ID from membersForex where ID= " & userID)
        Try

            If reader.HasRows = True Then

                reader.Read()
                If (reader("Status") = "M") Then
                    Return True
                Else
                    Return False
                End If

            Else

                Return False

            End If



        Catch ex As Exception

            opExec.closeConnection()
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)
            Return False


        Finally
            opExec.closeConnection()

            Dispose()

        End Try
    End Function

End Class
