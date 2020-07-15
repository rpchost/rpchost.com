Imports rpchost
Imports System.Data.OleDb

Partial Class GetSignals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Dim Ds As New rpchost.cs_Operation



        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from signal order by ID DESC ")
        Try

            If reader.HasRows = True Then

                While reader.Read()
                    str = str & reader("ID") & "&" & reader("Signal") & "&" & reader("Status") & "&" & reader("dtDateSignal") & "&" & reader("dtDateClose") & "%" & reader("isFixed") & " - "
                End While

                Response.Write(str & "@" & getMarquee())

            End If



        Catch ex As Exception

        Finally
            Ds.closeConnection()
            reader.Close()
            Dispose()
        End Try

    End Sub

    Public Function getMarquee() As String

        Dim Ds As New rpchost.cs_Operation


        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Marquee")
        Try

            If reader.HasRows = True Then

                reader.Read()
                str = reader("MarqueeText") + "!" + reader("GBP") + "!" + reader("EUR")

                Return str

            End If



        Catch ex As Exception

        Finally
            Ds.closeConnection()
            reader.Close()
            Dispose()
        End Try

    End Function


End Class
