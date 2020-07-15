Imports rpchost
Imports System.Data.OleDb
Imports System.Data

Partial Class Sentiment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opExec As New cs_Operation

        Dim ds As New DataSet()
        Dim da As New OleDbDataAdapter(" select Type, Flow   from Charting where Currency = '" & Request.QueryString("curr") & "'  ", opExec.conn)
        da.Fill(ds)
        Chart1.DataSource = ds


        lblCurrencyStudy.Text = GetCurrencyStudy(Request.QueryString("curr"))

    End Sub

    Protected Function GetCurrencyStudy(ByVal Currency As String) As String
        Dim opExec As New cs_Operation
        Dim res As String = ""

        Dim resStudy As String = ""
        Dim resBuy As Integer = 0
        Dim resSell As Integer = 0

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Charting where Currency = '" & Currency & "' ")
        Try

            If reader.HasRows = True Then

                While reader.Read

                    If (reader("Type").Equals("Buy")) Then
                        res = res & Currency & " BUY volume is " & reader("Flow") & " % <br><br>"
                        resBuy = CInt(reader("Flow"))
                    End If
                    If (reader("Type").Equals("Sell")) Then
                        res = res & Currency & " SELL volume is " & reader("Flow") & " % <br>"
                        resSell = CInt(reader("Flow"))
                    End If

                    If (resBuy > resSell And resBuy > 60) Then
                        resStudy = " Traders are Buying " & Currency & " in high numbers. <br> we recommend that you consider BUYING " & Currency
                    End If
                    If (resBuy > resSell And resBuy <= 60) Then
                        resStudy = " Traders are Buying " & Currency & " in low numbers. <br> we recommend that you wait and analyse the " & Currency & " before you Buy. "
                    End If

                    If (resBuy < resSell And resSell > 60) Then
                        resStudy = " Traders are Selling " & Currency & " in high numbers. <br> we recommend that you consider SELLING " & Currency
                    End If
                    If (resBuy < resSell And resBuy <= 60) Then
                        resStudy = " Traders are Selling " & Currency & " in low numbers. <br> we recommend that you wait and analyse the " & Currency & " before you sell. "
                    End If
                End While


                Return res & resStudy

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
            Return "-1"
        Finally
            opExec.closeConnection()
        End Try
    End Function

End Class

