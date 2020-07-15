Imports System.Net
Imports System.IO

Partial Class GetBitcoinPrice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim PictureURL As String = GetHTML("https://bitconnect.co/")

        '  Dim request As WebRequest = WebRequest.Create("http://www.bitconnect.co")

        '  Dim response As WebResponse
        '  response = Request.GetResponse()
        'Dim data As Stream = response.GetResponseStream()
        'Dim html As String = String.Empty



    End Sub


    Function GetHTML(ByVal strPage As String) As String
        Dim strReply As String = "NULL"
        'Dim objErr As ErrObject

        Net.WebRequest.DefaultWebProxy = Nothing
        Net.ServicePointManager.UseNagleAlgorithm = False
        Net.ServicePointManager.Expect100Continue = False
        ' Net.ServicePointManager.DefaultConnectionLimit = 48


        Try
            Dim objHttpRequest As System.Net.HttpWebRequest
            Dim objHttpResponse As System.Net.HttpWebResponse
            objHttpRequest = System.Net.HttpWebRequest.Create(strPage)
            objHttpResponse = objHttpRequest.GetResponse
            Dim objStrmReader As New StreamReader(objHttpResponse.GetResponseStream)

            strReply = objStrmReader.ReadToEnd()

        Catch ex As Exception
            strReply = "ERROR! " + ex.Message.ToString
        End Try

        Return strReply



     


    End Function


End Class
