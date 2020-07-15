Imports System.Net
Imports System.IO

Partial Class Default14
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SendSms(3, "test")

    End Sub

    Protected Function getStr() As Boolean



    End Function

    Protected Function SendSms(ByVal UserID As String, ByVal ss As String) As Boolean

        ' Dim apikey As String = "gGF/TXcBFpk-1RYB1EPZcTQMSXKDRQNxjlViWGFqAO"

        Dim SenderName As String = "Rpchost"
        Dim Number As String = "9613549389"
        Dim Message As String = "NEW CR CD PYMNT. USERID = " & UserID & " SS = " & ss

        Dim URL As String = "https://api.gdax.com/products/BTC-EUR/ticker"
        'Dim PostData As String = "apikey=" & apikey & "&sender=" & SenderName & "&numbers=" & Number & "&message=" & Message
        Dim req As HttpWebRequest = WebRequest.Create(URL)

        req.Method = "POST"
        Dim encoding As New ASCIIEncoding()
        ' Dim byte1 As Byte() = encoding.GetBytes(PostData)
        ' req.ContentType = "application/x-www-form-urlencoded"
        'req.ContentLength = byte1.Length
        'Dim newStream As Stream = req.GetRequestStream()
        'newStream.Write(byte1, 0, byte1.Length)
        req.KeepAlive = False
        Try
            Dim resp As HttpWebResponse = req.GetResponse()
            Dim sr As New StreamReader(resp.GetResponseStream())
            Dim results As String = sr.ReadToEnd()
            sr.Close()

            Return True

        Catch wex As WebException
            Response.Write("SOMETHING WENT WRONG ! Status: " & wex.Status & "Message: " & wex.Message & "")
            Return False
        End Try

    End Function

End Class
