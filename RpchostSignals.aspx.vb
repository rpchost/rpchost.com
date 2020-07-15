Imports rpchost
Imports System.Data.OleDb
Imports System.Data

Partial Class RpchostSignals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim strSignals As String = ""

        Dim arr() As String


        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select SqwakText from SqwakBox")
        Try

            If reader.HasRows = True Then

                While reader.Read()

                    strSignals = reader("SqwakText")

                End While


            End If

            Dim dt As New DataTable

            arr = strSignals.Split("@")

            Dim i As Integer = 0

            dt.Columns.Add("Rpchost.com Forex Signals  -  [Time Zone is GMT + 2]")



            While (i < arr.Length)
                
                Dim dtrow As DataRow = dt.NewRow()
                Dim DC As New DataColumn()
                'dt.Columns.Add(DC)
                dtrow(0) = arr(i)

                'dtrow(i) = arr(i)
                dt.Rows.Add(dtrow)

                i = i + 1
            End While


            grdSignals.Visible = True

            grdSignals.DataSource = dt
            grdSignals.DataBind()


        Catch ex As Exception

        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

    End Sub


End Class
