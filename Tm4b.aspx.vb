Imports System.Net
Imports Newtonsoft.Json
Imports System.IO


Partial Class Tm4b
    Inherits System.Web.UI.Page

    Dim ss As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim apikey As String = "gGF/TXcBFpk-1RYB1EPZcTQMSXKDRQNxjlViWGFqAO"

        'Dim SenderName As String = "Rpchost"
        'Dim Number As String = "9613549389"
        'Dim Message As String = " Message "
        'Dim URL As String = "https://api.txtlocal.com/send/?"
        'Dim PostData As String = "apikey=" & apikey & "&sender=" & SenderName & "&numbers=" & Number & "&message=" & Message
        'Dim req As HttpWebRequest = WebRequest.Create(URL)


        'req.Method = "POST"
        'Dim encoding As New ASCIIEncoding()
        'Dim byte1 As Byte() = encoding.GetBytes(PostData)
        'req.ContentType = "application/x-www-form-urlencoded"
        'req.ContentLength = byte1.Length
        'Dim newStream As Stream = req.GetRequestStream()
        'newStream.Write(byte1, 0, byte1.Length)

        'Try
        '    Dim resp As HttpWebResponse = req.GetResponse()
        '    Dim sr As New StreamReader(resp.GetResponseStream())
        '    Dim results As String = sr.ReadToEnd()
        '    sr.Close()
        '    html.Text = results
        'Catch wex As WebException
        '    Response.Write("SOMETHING WENT AWRY!Status: " & wex.Status & "Message: " & wex.Message & "")
        'End Try

    End Sub



End Class
