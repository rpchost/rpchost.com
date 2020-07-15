Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Permissions
Imports System.IO


Namespace rpchost


    Public Class cs_ConnectionSQL
        Implements IDisposable

        Public Shared setErrNum As String

        Public sqlConn As SqlConnection


        Public sqlComm As SqlCommand
        'Public conn As String = "Data Source=184.168.47.21;Integrated Security=False;User ID=rpchost;Connect Timeout=15;Encrypt=False;Packet Size=4096"
        Public conn As String = "Provider=Microsoft.Jet.OLEDB.4.0;data source= " & HttpContext.Current.Server.MapPath("db/db_maindata.mdb") 'C:/Inetpub/wwwroot/rpchost/db/db_maindata.mdb" 

        'Constructor
        Public Sub cs_ConnectionSQL()
        End Sub

        Public Sub cs_ConnectionSQL(ByVal setConnString As String)
            conn = setConnString
        End Sub

#Region "Set property modifiers"

#End Region

        Public Sub connection(ByVal strSQL As String)

            Try
                sqlConn = New SqlConnection(conn)
                sqlComm = New SqlCommand(strSQL, sqlConn)
            Catch ex As Exception
                setErrNum = "Error occured in the connection class. Error description : " & ex.Message
            End Try

        End Sub

        Public Sub connection(ByVal strSQL As String, ByVal Flag As Integer)

            Try
                sqlConn = New SqlConnection(conn)
                sqlComm = New SqlCommand(strSQL, sqlConn)
            Catch ex As Exception
                setErrNum = "Error occured in the connection class. Error description : " & ex.Message
            End Try

        End Sub

        Public Sub openConnection()
            Try
                sqlConn.Open()
            Catch ex As SqlException
                setErrNum = ex.Message + " You must change the Data source"
            Catch ex As Exception
                setErrNum = ex.Message
            End Try
        End Sub

        Public Sub closeConnection()
            'Close the connection
            Try
                'sqlConn.Close()
                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If

            Catch ex As Exception

                HttpContext.Current.Response.Write(ex.Message)
            End Try

        End Sub

        'Destructor
        Public Overloads Sub Dispose() Implements IDisposable.Dispose
            Dispose(True)
            GC.SuppressFinalize(Me) 'Garbage Collector
        End Sub

        Protected Overridable Overloads Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                ' Free other state (managed objects).
            End If
            ' Free your own state (unmanaged objects).
            ' Set large fields to null
        End Sub



    End Class

End Namespace
