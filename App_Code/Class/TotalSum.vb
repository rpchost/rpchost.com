
Imports System.Data.OleDb

Imports System.Net
Imports System
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web
Imports System.Threading
Imports System.Globalization
Imports System.Data
Imports Microsoft.VisualBasic

Namespace rpchost

    Public Class TotalSum

        Public Function getTotalSum() As Double

            Dim sqlTotal As String
            Dim dblSum As Double

            Dim opExec As rpchost.cs_Operation

            opExec = New rpchost.cs_Operation
            Dim reader As OleDbDataReader

            sqlTotal = "select sum(profit) as total from signal where status = 'C' and year(dtdatesignal) = '" & Year(Now) & "' and month(dtdatesignal) = '" & Month(Now) & "' and Day(dtdatesignal) = '" & Day(Now) & "' "

            'opExec = New rpchost.cs_Operation

            Try
                Dim readerTotal As OleDbDataReader = opExec.rdGetReader(sqlTotal)
                readerTotal.Read()

                Return readerTotal("total")
            Catch ex As Exception
                Return 0
            Finally
                opExec.closeConnection()
                opExec = Nothing

            End Try

        End Function

        Public Function getTotalSumMonth() As Double

            Dim sqlTotal As String
            Dim dblSum As Double

            Dim opExec As rpchost.cs_Operation
            opExec = New rpchost.cs_Operation
            Dim reader As OleDbDataReader

            sqlTotal = "select sum(profit) as total from signal where status = 'C' and year(dtdatesignal) = '" & Year(Now) & "' and month(dtdatesignal) = '" & Month(Now) & "'  "

            'opExec = New rpchost.cs_Operation

            Try
                Dim readerTotal As OleDbDataReader = opExec.rdGetReader(sqlTotal)
                readerTotal.Read()

                Return readerTotal("total")
            Catch ex As Exception
                Return 0
            Finally
                opExec.closeConnection()
                opExec = Nothing

            End Try

        End Function

        Private Sub SetStopLossToBreak(ByVal intID As Integer, ByVal strEntry As String)

            Dim conn As New rpchost.cs_Operation
            Try
                Dim strSQL As String
                conn.openConnection()

                Dim strInsert As String = "update Signal set [SL] = """ & strEntry & """ where ID = " & intID
                strSQL = "update Signal set [SL] = '" & strEntry & "' where ID = " & intID
                conn.ExecuteSql(strSQL)

            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.Message)
                HttpContext.Current.Response.Write(ex.Source)
            Finally
                conn.closeConnection()
                conn = Nothing

            End Try

        End Sub

    End Class


End Namespace