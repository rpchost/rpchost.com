Imports System
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web


Namespace rpchost


Public Class cs_LogFile


    Private Shared strFilePath As String = HttpContext.Current.Server.MapPath("Log.txt")

    Public Sub New()
    End Sub

    Public WriteOnly Property setFilePath() As String
        Set(ByVal Value As String)
            strFilePath = Value
        End Set
    End Property

    Public Shared Sub WriteFile(ByVal input As String)
            Dim LogFile As New FileInfo(strFilePath)

            Try

                If LogFile.Exists Then

                    Dim fs As New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite)
                    fs.Lock(0, SeekOrigin.End)

                    Dim w As New StreamWriter(fs)
                    w.BaseStream.Seek(0, SeekOrigin.End)
                    w.WriteLine()
                    w.Write(vbCrLf & "Log Entry : ")
                    w.Write("{0} {1} " & vbCrLf, DateTime.Now.ToLongTimeString(), DateTime.Now.ToLongDateString())
                    w.WriteLine()
                    w.Write(vbCrLf + input + vbCrLf)
                    w.WriteLine()
                    w.Write("------------------------------------" & vbCrLf)
                    w.WriteLine()

                    fs.Unlock(0, SeekOrigin.End)

                    w.Flush()

                    w.Close()

                Else
                    HttpContext.Current.Response.Write("Log file does not exist")
                End If

            Catch ex As Exception
                HttpContext.Current.Response.Write("Error Description : " & ex.Message)

            End Try

    End Sub

End Class

End Namespace
