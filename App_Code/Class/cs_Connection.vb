Imports System
Imports System.Data
Imports System.Data.OleDb
Imports System.Security.Permissions
Imports System.IO


Namespace rpchost


Public Class cs_Connection
    Implements IDisposable

    Public Shared setErrNum As String

    Public sqlConn As OleDbConnection
    Public sqlComm As OleDbCommand
        Public conn As String = "Provider=Microsoft.Jet.OLEDB.4.0;data source= " & HttpContext.Current.Server.MapPath("~/db/db_maindata.mdb") 'C:/Inetpub/wwwroot/rpchost/db/db_maindata.mdb" 
        Public connSync As String = "Provider=Microsoft.Jet.OLEDB.4.0;data source=C:/db_maindata_Real.mdb"
        Public connInspection As String = "Provider=Microsoft.Jet.OLEDB.4.0;Mode=16;data source= " & HttpContext.Current.Server.MapPath("db/DB_PLATES.mdb")

    'Constructor
    Public Sub cs_Connection()
    End Sub

    Public Sub cs_Connection(ByVal setConnString As String)
        conn = setConnString
    End Sub

#Region "Set property modifiers"

    'Public ReadOnly Property getUserID() As String
    '    Get
    '        Return UID
    '    End Get
    'End Property
    'Public ReadOnly Property getInitialCatalog() As String
    '    Get
    '        Return CATALOG
    '    End Get
    'End Property
    'Public ReadOnly Property getDataSource() As String
    '    Get
    '        Return dataSource
    '    End Get
    'End Property

    'Public WriteOnly Property setUserID() As String
    '    Set(ByVal Value As String)
    '        UID = Value
    '    End Set
    'End Property
    'Public WriteOnly Property setInitialCatalog() As String
    '    Set(ByVal Value As String)
    '        CATALOG = Value
    '    End Set
    'End Property
    'Public WriteOnly Property setDataSource() As String
    '    Set(ByVal Value As String)
    '        dataSource = Value
    '    End Set
    'End Property
#End Region

    Public Sub connection(ByVal strSQL As String)

        Try
            sqlConn = New OleDbConnection(conn)
            sqlComm = New OleDbCommand(strSQL, sqlConn)
        Catch ex As Exception
            setErrNum = "Error occured in the connection class. Error description : " & ex.Message
        End Try

        End Sub

        Public Sub connection(ByVal strSQL As String, ByVal Flag As Integer)

            Try
                sqlConn = New OleDbConnection(connSync)
                sqlComm = New OleDbCommand(strSQL, sqlConn)


            Catch ex As Exception
                setErrNum = "Error occured in the connection class. Error description : " & ex.Message
            End Try

        End Sub

    Public Sub openConnection()
        Try
            sqlConn.Open()
        Catch ex As OleDbException
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
