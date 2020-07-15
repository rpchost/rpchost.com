Imports System.Data.OleDb
Imports System.Web.Security
Imports System.Configuration
Imports System.Collections.Specialized
Imports System.Web.Hosting
Imports System.Globalization
Imports System.Data


Namespace rpchost

    Public Class cs_Operation

        'Inheritance from the connection class
        Inherits cs_Connection

        Public ErrMess As String
        Public Passed As Boolean = True
        Public rdReader As OleDbDataReader
        Public scalaredValue As String

        'Constructor
        Public Sub cs_Operation()

        End Sub


#Region "Execute Sql Operation (Insert , Update)"
        Public Function ExecuteSql(ByVal StrSql As String) As Boolean

            sqlConn = New OleDbConnection(conn)
            sqlComm = New OleDbCommand(StrSql, sqlConn)
            Dim myTrans As OleDbTransaction = Nothing


            Try
                sqlConn.Open()

                'Start a local transaction.
                myTrans = sqlConn.BeginTransaction()

                ' Enlist the command in the current transaction.
                sqlComm.Transaction = myTrans


                sqlComm.CommandText = StrSql
                sqlComm.ExecuteNonQuery()
                myTrans.Commit() 'Operation executed successfully

            Catch e As Exception

                'HttpContext.Current.Response.Write("Error Description11 : " & e.Message)

                cs_LogFile.WriteFile("Error Description \\n" + e.Message + "\\n" + e.StackTrace)
                sqlConn.Dispose()
                sqlComm.Dispose()


                Try
                    Passed = False
                    ErrMess = StrSql
                    'myTrans.Rollback() ' RollBack the transaction
                Catch ex As OleDbException
                    Passed = False
                End Try
            Finally
                'sqlConn.Close()

                sqlConn.Dispose()
            End Try

            ExecuteSql = Passed

        End Function

#End Region

#Region "Returning Reader from SQL Routines"
        Public Function rdGetReader(ByVal strSQL As String) As OleDbDataReader

            Dim Reader As OleDbDataReader

            Try
                sqlConn = New OleDbConnection(conn)
                sqlComm = New OleDbCommand(strSQL, sqlConn)
                sqlComm.CommandText = strSQL
                sqlComm.Connection.Open()
                Reader = sqlComm.ExecuteReader()
            Catch ex As Exception
                'cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
                HttpContext.Current.Response.Write("TEST " & strSQL)
                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If
            Finally
                sqlComm = Nothing

            End Try
            rdGetReader = Reader

        End Function
#End Region




        Public Function ExecuteScalaredSql(ByVal StrSql As String) As String

            sqlConn = New OleDbConnection(conn)
            sqlComm = New OleDbCommand(StrSql, sqlConn)

            sqlConn.Open()

            'Start a local transaction.
            Dim myTrans As OleDbTransaction = sqlConn.BeginTransaction()

            ' Enlist the command in the current transaction.
            sqlComm.Transaction = myTrans

            Try
                sqlComm.CommandText = StrSql
                sqlComm.ExecuteNonQuery()
                myTrans.Commit() 'Operation executed successfully

                sqlComm.CommandText = "Select @@Identity"

                scalaredValue = sqlComm.ExecuteScalar().ToString()

            Catch e As Exception
                scalaredValue = ""
                cs_LogFile.WriteFile("Error Description \\n" + e.Message + "\\n" + e.StackTrace)
                Try
                    Passed = False
                    ErrMess = StrSql
                    myTrans.Rollback() ' RollBack the transaction
                Catch ex As OleDbException
                    Passed = False
                End Try
            Finally
                sqlConn.Close()
            End Try

            Return (scalaredValue)

        End Function



      





#Region "Returning Reader from SQL Routines"
        Public Function rdGetReaderSync(ByVal strSQL As String) As OleDbDataReader

            Dim Reader As OleDbDataReader

            Try
                sqlConn = New OleDbConnection(conn)
                sqlComm = New OleDbCommand(strSQL, sqlConn)
                sqlComm.CommandText = strSQL
                sqlComm.Connection.Open()
                Reader = sqlComm.ExecuteReader()
            Catch ex As Exception
                cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If
            Finally
                sqlComm = Nothing

            End Try
            rdGetReaderSync = Reader

        End Function
#End Region


#Region "Returning Reader from SQL Routines"
        Public Function rdGetReaderInspection(ByVal strSQL As String) As OleDbDataReader

            Dim Reader As OleDbDataReader

            Try
                sqlConn = New OleDbConnection(connInspection)
                sqlComm = New OleDbCommand(strSQL, sqlConn)
                sqlComm.CommandText = strSQL
                sqlComm.Connection.Open()
                Reader = sqlComm.ExecuteReader()
            Catch ex As Exception
                'cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)


                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If
            Finally
                sqlComm = Nothing

            End Try
            rdGetReaderInspection = Reader

        End Function
#End Region

#Region "Dataset/reader Returning SQL Routines "

        Public Function dsGetDataSet(ByVal strSQL As String) As DataSet

            Dim Reader As OleDbDataReader
            Dim oAdapter As OleDbDataAdapter
            Dim oRs As DataSet

            Try
                'Setup Connection object
                sqlConn = New OleDbConnection(conn)

                'Set up Command object
                sqlComm = New OleDbCommand(strSQL, sqlConn)
                With sqlComm
                    .CommandText = strSQL
                    .Connection.Open()
                End With

                'Setup Adapter object and fill dataset
                oAdapter = New OleDbDataAdapter
                oRs = New DataSet
                With oAdapter
                    .SelectCommand = sqlComm
                    .Fill(oRs)
                End With

                dsGetDataSet = oRs

            Finally 'If an exception happens, it will trickle up to the calling
                'routine.
                'Then close and destroy everything.

                If Not sqlConn Is Nothing Then
                    If sqlConn.State <> ConnectionState.Closed Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If
                oAdapter = Nothing
                sqlConn = Nothing
                oRs = Nothing
            End Try
        End Function
#End Region

#Region "Execute (Insert/Delete) Stored Procedure ... Return Value : Boolean"
        Public Function ExecuteStoredProcedure(ByVal strProcedureName As String, ByVal strParamName As String(), ByVal strParamValue As Object) As Boolean

            'sqlConn = New SqlConnection(conn)
            'sqlComm = New SqlCommand

            'sqlConn.Open()

            ''strParams should contain the following:
            ''- Name of the Stored Procedure
            ''- All the Parameters to pass to the Stored Procedure

            ''Set the sqlCommand Properties
            'sqlComm.Connection = sqlConn
            'sqlComm.CommandType = CommandType.StoredProcedure
            'sqlComm.CommandText = strProcedureName


            ''Loop through the Parameter Names and Values
            'Dim i As Int16
            'i = 0

            'Dim sqlParam As SqlParameter

            'Do While i < strParamName.Length() - 1
            '    'Set sqlParameter Properties
            '    sqlParam = New SqlClient.SqlParameter(strParamName(i), strParamValue(i))
            '    sqlComm.Parameters.Add(sqlParam)
            '    i = i + 1
            'Loop

            'Passed = True

            'Try
            '    sqlComm.ExecuteNonQuery()
            'Catch e As Exception
            '    Passed = False
            'Finally
            '    sqlConn.Close()
            'End Try

            'ExecuteStoredProcedure = Passed

        End Function
#End Region

#Region "Execute (Select) Stored Procedure ... Return Value : DataReader"
        Public Function ExecuteStoredProcedureDR(ByVal strProcedureName As String, ByVal strParamName As String(), ByVal strParamValue As String()) As System.Data.OleDb.OleDbDataReader

            sqlConn = New OleDbConnection(conn)
            sqlComm = New OleDbCommand

            'strParams Contains the Following:
            '- Name of the Stored Procedure
            '- All the Parameters to pass to the Stored Procedure

            'Set the sqlCommand Properties
            sqlComm.Connection = sqlConn
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = strProcedureName

            'Loop through the Parameter Names and Values
            Dim i As Int16
            i = 0

            Dim sqlParam As OleDbParameter

            Do While i < strParamName.Length() - 1
                'Set sqlParameter Properties
                sqlParam = New OleDb.OleDbParameter(strParamName(i), strParamValue(i))
                sqlComm.Parameters.Add(sqlParam)
                i = i + 1
            Loop

            Try
                sqlConn.Open()
                ExecuteStoredProcedureDR = sqlComm.ExecuteReader()
            Catch ex As Exception
                'cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace + "\\n" + ex.Source)
                Passed = False
                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If
            Finally
                sqlComm = Nothing
            End Try


        End Function
#End Region

#Region "Execute (Select) Stored Procedure ... Return Value : DataSet"
        Public Function ExecuteStoredProcedureDS(ByVal strProcedureName As String, ByVal strSql As String) As DataSet

            Dim oAdapter As OleDbDataAdapter
            Dim sqlParam As OleDbParameter
            Dim oRs As DataSet

            sqlConn = New OleDbConnection(conn)
            sqlComm = New OleDbCommand
            sqlParam = New OleDbParameter

            'strParams Contains the Following:
            '- Name of the Stored Procedure

            Try
                'Set the sqlCommand Properties
                sqlComm.Connection = sqlConn
                sqlComm.CommandType = CommandType.StoredProcedure
                sqlComm.CommandText = strProcedureName

                'Set sqlParameter Properties

                sqlParam.ParameterName = "@strSql"
                sqlParam.DbType = SqlDbType.VarChar
                sqlComm.Parameters.Add(sqlParam)

                oAdapter = New OleDbDataAdapter
                oRs = New DataSet
                sqlComm.Parameters("@strSql").Value = strSql

                sqlConn.Open()

                With oAdapter
                    .SelectCommand = sqlComm
                    .Fill(oRs)
                End With

                ExecuteStoredProcedureDS = oRs

            Catch ex As Exception
                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                    oRs = Nothing
                End If
            Finally
                sqlComm = Nothing
                oRs = Nothing
            End Try
        End Function

#End Region


#Region "Execute (Select) Stored Procedure ... Return Value : DataReader"
        Public Function ExecuteSP_DR(ByVal strProcedureName As String, ByVal strSql As String) As OleDb.OleDbDataReader

            sqlConn = New OleDbConnection(conn)
            sqlComm = New OleDbCommand

            Dim sqlParam As New OleDbParameter

            'strParams Contains the Following:
            '- Name of the Stored Procedure
            '- All the Parameters to pass to the Stored Procedure

            Try

                'Set the sqlCommand Properties
                sqlComm.Connection = sqlConn
                sqlComm.CommandType = CommandType.StoredProcedure
                sqlComm.CommandText = strProcedureName

                sqlParam.ParameterName = "@strSql"
                sqlParam.DbType = SqlDbType.VarChar
                sqlComm.Parameters.Add(sqlParam)
                sqlComm.Parameters("@strSql").Value = strSql

                'Loop through the Parameter Names and Values
                Dim i As Int16
                i = 0


                sqlConn.Open()
                ExecuteSP_DR = sqlComm.ExecuteReader

            Catch ex As Exception
                cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
                If Not sqlConn Is Nothing Then
                    If (sqlConn.State <> ConnectionState.Closed) Then
                        sqlConn.Close()
                    End If
                    sqlConn = Nothing
                End If
            Finally
                sqlComm = Nothing
            End Try

        End Function

#End Region




    End Class

End Namespace
