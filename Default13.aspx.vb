Imports System.Net
Imports System.IO

Partial Class Default13
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write(placeOrder())

        Dim MethodString As String = "/accounts"
        Dim DataString As String = "{}"
        'Response.Write(PrivateRequest(MethodString, DataString))

    End Sub

    Private Function PrivateRequest(ByVal sMethod As String, ByVal sData As String) As String
        Dim key As String = "1d4db1a427054932db633e59ad9b6f86"
        Dim secret As String = "A9tI8RepyTkP496nFYMvhvwTA2Y7sTjA971+5TCF6yFbb5a7a7S5BTFdtmxeGtcYtfplt9UI9Ckitv58tT07OQ=="
        Dim url As String = "https://public.sandbox.pro.coinbase.com"
        Dim nonce As String = (TimeToUnix(DateTime.Now) - 3600).ToString
        Dim targetURI As New Uri(url & sMethod)

        Dim postdataStr As String = sData
        Dim postdata = New Byte(postdataStr.Length - 1) {}
        Dim encText As New System.Text.UTF8Encoding()
        postdata = encText.GetBytes(postdataStr)

        Dim messageStr As String = String.Concat(nonce, "POST", targetURI, sData)

        Dim base64DecodedSecret As Byte() = Convert.FromBase64String(secret)

        Dim message = New Byte(messageStr.Length - 1) {}
        Dim encText1 As New System.Text.UTF8Encoding()
        message = encText1.GetBytes(messageStr)

        Dim signature = getHash(base64DecodedSecret, message)
        Dim signatureStr = Convert.ToBase64String(signature)

        Dim webRequest__1 As HttpWebRequest = DirectCast(WebRequest.Create(url), HttpWebRequest)
        webRequest__1.ContentType = ("application/json")
        webRequest__1.Method = "POST"
        webRequest__1.UserAgent = ".NET Framework Test Client"
        webRequest__1.Headers.Add("CB-ACCESS-SIGN", signatureStr)
        webRequest__1.Headers.Add("CB-ACCESS-TIMESTAMP", nonce)
        webRequest__1.Headers.Add("CB-ACCESS-KEY", key)
        webRequest__1.Headers.Add("CB-ACCESS-PASSPHRASE", "MY PASSPHRASE")

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



    Public Function placeOrder() As String
        Try
            Dim Body As String = "{""type"":""limit"",""side"":""sell"",""product_id"":""BTC-USD"",""price"":""20000"",""size\"":""0.02235229""}"
            Dim ts As String = GetNonce()
            Dim method As String = "/orders"
            Dim str_GDAX_Main As String = "https://public.sandbox.pro.coinbase.com"
            Dim sig As String = GetSignature(ts, "POST", method, Body)
            Dim fr As System.Net.HttpWebRequest
            Dim targetURI As New Uri(str_GDAX_Main & method)
            'Dim response As String

            Dim jsonDataBytes As Byte() = Encoding.UTF8.GetBytes(Body)


            fr = DirectCast(HttpWebRequest.Create(targetURI), System.Net.HttpWebRequest)
            fr.Headers.Add("CB-ACCESS-KEY", "1d4db1a427054932db633e59ad9b6f86")
            fr.Headers.Add("CB-ACCESS-SIGN", sig)
            fr.Headers.Add("CB-ACCESS-TIMESTAMP", ts)
            fr.Headers.Add("CB-ACCESS-PASSPHRASE", "6r1filjgxjv")
            fr.UserAgent = ".NET Framework Test Client"
            fr.Accept = "application/json"
            fr.Method = "POST"
            fr.ContentLength = jsonDataBytes.Length

            Dim stream = fr.GetRequestStream()
            stream.Write(jsonDataBytes, 0, jsonDataBytes.Length)
            stream.Close()

            Dim response = fr.GetResponse().GetResponseStream()

            Dim reader As New StreamReader(response)
            Dim res = reader.ReadToEnd()
            reader.Close()
            response.Close()
            Return res

            'If (fr.GetResponse().ContentLength > 0) Then
            '    Dim str As New System.IO.StreamReader(fr.GetResponse().GetResponseStream())
            '    response = (str.ReadToEnd())
            '    str.Close()
            'End If

            'Form1.RichTextBox1.Text = (response)
        Catch ex As System.Net.WebException
            Response.Write(ex.Message)
            'Error in accessing the resource, handle it
        End Try
    End Function

    Public Shared Function GetNonce() As String
        Return (DateTime.UtcNow - New DateTime(1970, 1, 1, 0, 0, 0)).TotalSeconds.ToString()
    End Function

    Public Shared Function GetSignature(ByVal nonce As String, ByVal method As String, ByVal url As String, ByVal body As String) As String
        Dim message As String = String.Concat(nonce, method.ToUpper(), url, body)
        Dim encoding = New ASCIIEncoding()
        Dim keyByte As Byte() = Convert.FromBase64String("A9tI8RepyTkP496nFYMvhvwTA2Y7sTjA971+5TCF6yFbb5a7a7S5BTFdtmxeGtcYtfplt9UI9Ckitv58tT07OQ==")
        Dim messageBytes As Byte() = encoding.GetBytes(message)
        Using hmacsha256 = New System.Security.Cryptography.HMACSHA256(keyByte)
            Dim hashmessage As Byte() = hmacsha256.ComputeHash(messageBytes)
            Return Convert.ToBase64String(hashmessage)
        End Using
    End Function

End Class
