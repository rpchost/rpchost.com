Imports System.Net
Imports System.IO
Imports System.Security.Cryptography

Partial Class Coinbase
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim apikey As String = "4j9TFRjQ2bWnCQSDvD2IFTiigvQa0PUpt0LahLlZ5iDbUhE08ldrrFkuO+JwTuFZsHMG9eYK/TddzT3u7ljUcA=="

        Dim URL As String = "https://public.sandbox.pro.coinbase.com"
        Dim PostData As String = "type=send&amount=0.0002,size=0.01&side=Buy&product_id=BTC-EUR"


        Dim req As HttpWebRequest = WebRequest.Create(URL)

        req.Method = "POST"
        Dim encoding As New ASCIIEncoding()
        Dim byte1 As Byte() = encoding.GetBytes(PostData)
        req.ContentType = "application/json"

        req.Headers.Add("Charset", "utf-8")

       

        Dim secretKey As Byte() = Text.Encoding.UTF8.GetBytes("")
        Dim message As String = String.Format("{0}GET/v2/prices", "")

        Dim hmac As New HMACSHA256(secretKey)
        hmac.Initialize()
        Dim bytes As Byte() = Text.Encoding.UTF8.GetBytes("")
        Dim rawHmac As Byte() = hmac.ComputeHash(bytes)

      
         

        req.Headers.Add("CB-ACCESS-KEY", "1d4db1a427054932db633e59ad9b6f86")
        req.Headers.Add("CB-ACCESS-TIMESTAMP", "3200")
        req.Headers.Add("price", "1.0")
        req.Headers.Add("size", "1.0")
        req.Headers.Add("side", "buy")
        req.Headers.Add("product_id", "BTC-USD")
        req.Headers.Add("Access-Control-Allow-Origin", "*")
        req.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS")

        req.Headers.Add("Access-Control-Allow-Credentials", "true")

        req.Headers.Add("Access-Control-Allow-Headers", "Authorization, Content-Type")

        'req.Headers.Add("CB-ACCESS-TIMESTAMP", timestamp)
        req.Headers.Add("CB-ACCESS-PASSPHRASE", "6r1filjgxjv")

        req.ContentLength = byte1.Length

        'ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
        Dim newStream As Stream = req.GetRequestStream()
        newStream.Write(byte1, 0, byte1.Length)

        Try
            Dim resp As HttpWebResponse = req.GetResponse()
            Dim sr As New StreamReader(resp.GetResponseStream())
            Dim results As String = sr.ReadToEnd()
            sr.Close()



        Catch wex As WebException
            Response.Write("SOMETHING WENT WRONG ! Status: " & wex.Status & "Message: " & wex.Message & "")

        End Try
    End Sub
End Class
