Imports System
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web





Public Class WriteSignals



    Private strFilePath As String = "C:\Program Files (x86)\MetaTrader - AAAFx\MQL4\Files\Signals.txt"

    Public Sub New()
    End Sub

    Public WriteOnly Property setFilePath() As String
        Set(ByVal Value As String)
            strFilePath = Value
        End Set
    End Property

    Public Sub WriteFile(ByVal input As String)
        Dim SignalFile As New FileInfo(strFilePath)

        Try




            Dim fs As New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite)
            fs.Lock(0, SeekOrigin.End)

            ' Dim R As New StreamReader(fs)

            ' If Not (R.ReadToEnd.Contains(input)) Then

            Dim w As New StreamWriter(fs)


            w.BaseStream.Seek(0, SeekOrigin.End)

            w.Write(input + vbCrLf)

            'w.WriteLine()

            fs.Unlock(0, SeekOrigin.End)
            w.Flush()

            w.Close()

            '  End If

            '  R.Close()


            ' Else
            ' HttpContext.Current.Response.Write("Log file does not exist")
            ' End If

        Catch ex As Exception
            HttpContext.Current.Response.Write("Error Description : " & ex.Message)

        End Try




    End Sub

End Class


