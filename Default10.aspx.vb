Imports System.Net
Imports System.IO

Partial Class Default10
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim MethodString As String = "/accounts"
        Dim DataString As String = "{}"
        PrivateRequest(MethodString, DataString)
    End Sub

    Private Function PrivateRequest(ByVal sMethod As String, ByVal sData As String) As String
        Dim key As String = "d83fb5472d72ef92ab9bf034d931097c"
        Dim secret As String = "ve44b7ey/0wfHxalDjXTk48S4iNyF2CfwtMfXP5Yp+JC8vpAySUh49O7LsATMrqdrLga8UJYYlOazhY7YFZTbg=="
        Dim url As String = "https://api-public.sandbox.pro.coinbase.com"
        Dim nonce As String = (TimeToUnix(DateTime.Now) - 3600).ToString
        Dim targetURI As New Uri(url & sMethod)

        Dim encoding As New ASCIIEncoding()
        Dim postdataStr As String = sData
        Dim postdata As Byte() = encoding.GetBytes(postdataStr)

        Dim encText As New System.Text.UTF8Encoding()
        postdata = encText.GetBytes(postdataStr)

        Dim messageStr As String = String.Concat(nonce, "POST", targetURI, sData)

        Dim base64DecodedSecret As Byte() = Convert.FromBase64String(secret)


        Dim encText1 As New System.Text.UTF8Encoding()
        Dim message As Byte() = encText1.GetBytes(messageStr)

        Dim signature = getHash(base64DecodedSecret, message)
        Dim signatureStr = Convert.ToBase64String(signature)

        Dim webRequest__1 As HttpWebRequest = DirectCast(WebRequest.Create(url), HttpWebRequest)
        webRequest__1.ContentType = ("application/json")
        webRequest__1.Method = "POST"
        webRequest__1.UserAgent = ".NET Framework Test Client"
        webRequest__1.Headers.Add("CB-ACCESS-SIGN", signatureStr)
        webRequest__1.Headers.Add("CB-ACCESS-TIMESTAMP", nonce)
        webRequest__1.Headers.Add("CB-ACCESS-KEY", key)
        webRequest__1.Headers.Add("CB-ACCESS-PASSPHRASE", "rpc")

        Dim postreqstream As Stream = webRequest__1.GetRequestStream()
        postreqstream.Write(postdata, 0, postdata.Length)
        postreqstream.Close()

        Try
            Using webResponse As WebResponse = webRequest__1.GetResponse()
                Using str As Stream = webResponse.GetResponseStream()
                    Using sr As New StreamReader(str)
                        Dim responseContent3 As String = sr.ReadToEnd
                        Return responseContent3
                    End Using
                End Using
            End Using
        Catch wex As WebException
            Using response As HttpWebResponse = DirectCast(wex.Response, HttpWebResponse)
                Using str As Stream = response.GetResponseStream()
                    Using sr As New StreamReader(str)
                        Dim responseContent3 As String = sr.ReadToEnd
                        Return responseContent3
                    End Using
                End Using
            End Using
        End Try
    End Function

    Private Function getHash(ByVal keyByte As Byte(), ByVal messageBytes As Byte()) As Byte()
        Using hmacsha256 = New System.Security.Cryptography.HMACSHA256(keyByte)
            Dim result As [Byte]() = hmacsha256.ComputeHash(messageBytes)
            Return result
        End Using
    End Function

    Public Function TimeToUnix(ByVal dteDate As Date) As String
        If dteDate.IsDaylightSavingTime = True Then
            dteDate = DateAdd(DateInterval.Hour, -1, dteDate)
        End If
        TimeToUnix = DateDiff(DateInterval.Second, #1/1/1970#, dteDate)
    End Function


    Private Sub postman()

    End Sub


End Class
