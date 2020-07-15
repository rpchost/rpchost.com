Imports System.Net
Imports System
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web


Namespace rpchost


Public Class getLastGBP

    Private Shared strFilePath As String = HttpContext.Current.Server.MapPath("LastGBP.htm")
    Private Shared strFilePathBack As String = HttpContext.Current.Server.MapPath("LastGBPBack.htm")

    Public strEURJPY, strGBP, strAUDUSD, strGBPJPY, strEURCHF As String

    Public Function GrabPage() As String
        Try

            'writeToHtml("http://localhost/forex/Rates.html")
            writeToHtml("http://www.mgforex.com/eng/forex-tools/content/forex-rates.htm")

            GetGBP()
            GetGBPJPY()
            GetEURCHF()

            'strEURJPY = strGBP 'GetEURJPY()

            'Return GetGBP()

        Catch ex As System.IO.IOException
            HttpContext.Current.Response.Write(ex.Message)
        Catch ex As Exception
            'HttpContext.Current.Response.Write("At the current time there is high traffic on the server, please try again within seconds. <br><br> Traffic ...")
            HttpContext.Current.Response.Write(ex.Message)
        Finally
            'Dispose()
        End Try
    End Function

    Private Function getHtml(ByVal str As String) As String

        Dim objResponse As System.Net.WebResponse
        Dim objRequest As System.Net.WebRequest
        objRequest = HttpWebRequest.Create(str)
        objResponse = objRequest.GetResponse()
        Dim sr As New System.IO.StreamReader(objResponse.GetResponseStream())
        Return sr.ReadToEnd()

    End Function

    Private Sub writeToHtml(ByVal Str As String)

        Dim LogFile As New FileInfo(strFilePath)
        Dim fs1 As FileStream
        Dim w1 As StreamWriter

        If LogFile.Exists Then

            Try
                LogFile.Delete()
                fs1 = New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)
            Catch ex As Exception
                fs1 = New FileStream(strFilePathBack, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)
            End Try

            fs1.Lock(0, SeekOrigin.End)
            w1 = New StreamWriter(fs1)

            w1.BaseStream.Seek(0, SeekOrigin.End)

            w1.Write(getHtml(Str))

            fs1.Unlock(0, SeekOrigin.End)

            w1.Flush()

            w1.Close()
            fs1.Close()

        End If

    End Sub

    Private Function GetGBP() As String

        Dim strEcon As String
        Dim strRes As String
        Dim strLine As String
        Dim fs As FileStream
        Dim w As StreamReader
        Dim strText As String

        Try
            fs = New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        Catch ex As Exception
            fs = New FileStream(strFilePathBack, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        End Try
       
        w = New StreamReader(fs)

        strLine = Trim(w.ReadLine)


        While InStr(1, strLine, "GBPUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While
        strLine = ""
        While InStr(1, strLine, "GBPUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        strText = strLine

        strEcon = ""

        Dim arr() As String
        arr = strLine.Split("GBPUSD")
        strLine = arr(1)
        arr = strLine.Split("right")
        strLine = arr(1)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        strGBP = strLine



        While InStr(1, strLine, "AUDUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        arr = strLine.Split("AUDUSD")
        strLine = arr(7)
        arr = strLine.Split("td")
        strLine = arr(2)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        strAUDUSD = strLine


        While InStr(1, strLine, "EURJPY") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        arr = strLine.Split("EURJPY")
        strLine = arr(4)
        arr = strLine.Split("td")
        strLine = arr(2)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        strEURJPY = strLine

        fs.Close()
        w.Close()


        Return strLine

    End Function



    Private Function GetGBPJPY() As String

        Dim strEcon As String
        Dim strRes As String
        Dim strLine As String
        Dim fs As FileStream
        Dim w As StreamReader
        Dim strText As String

        Try
            fs = New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        Catch ex As Exception
            fs = New FileStream(strFilePathBack, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        End Try

        w = New StreamReader(fs)

        strLine = Trim(w.ReadLine)


        While InStr(1, strLine, "GBPUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While
        strLine = ""
        While InStr(1, strLine, "GBPUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        strText = strLine

        strEcon = ""

        Dim arr() As String
        arr = strLine.Split("GBPUSD")
        strLine = arr(1)
        arr = strLine.Split("right")
        strLine = arr(1)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        'strGBP = strLine


        While InStr(1, strLine, "GBPJPY") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        arr = strLine.Split("GBPJPY")
        strLine = arr(4)
        arr = strLine.Split("td")
        strLine = arr(2)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        strGBPJPY = strLine


        fs.Close()
        w.Close()


        Return strLine

    End Function


    Private Function GetEURCHF() As String

        Dim strEcon As String
        Dim strRes As String
        Dim strLine As String
        Dim fs As FileStream
        Dim w As StreamReader
        Dim strText As String

        Try
            fs = New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        Catch ex As Exception
            fs = New FileStream(strFilePathBack, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        End Try

        w = New StreamReader(fs)

        strLine = Trim(w.ReadLine)


        While InStr(1, strLine, "GBPUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While
        strLine = ""
        While InStr(1, strLine, "GBPUSD") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        strText = strLine

        strEcon = ""

        Dim arr() As String
        arr = strLine.Split("GBPUSD")
        strLine = arr(1)
        arr = strLine.Split("right")
        strLine = arr(1)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        'strGBP = strLine


        While InStr(1, strLine, "EURCHF") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        arr = strLine.Split("EURCHF")
        strLine = arr(14)
        arr = strLine.Split("td")
        strLine = arr(2)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        strEURCHF = strLine

        fs.Close()
        w.Close()


        Return strLine

    End Function

    Private Function GetEURJPY() As String

        Dim strEcon As String
        Dim strRes As String
        Dim strLine As String
        Dim fs As FileStream
        Dim w As StreamReader

        fs = New FileStream(strFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None)

        w = New StreamReader(fs)

        strLine = Trim(w.ReadLine)

        While InStr(1, strLine, "EURJPY") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While
        strLine = ""
        While InStr(1, strLine, "EURJPY") = 0 And w.Peek >= 0
            strLine = Trim(w.ReadLine)
        End While

        strEcon = ""

        Dim arr() As String
        arr = strLine.Split("EURJPY")
        strLine = arr(1)
        arr = strLine.Split("right")
        strLine = arr(1)
        arr = strLine.Split(">")
        strLine = arr(1)
        arr = strLine.Split("<")
        strLine = arr(0)

        fs.Close()
        w.Close()

        Return strLine

    End Function

End Class

End Namespace
