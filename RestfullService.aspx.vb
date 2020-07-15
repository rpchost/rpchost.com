Imports System.Net

Imports System

Imports System.IO
Imports System.Text
Imports System.Threading
Imports Microsoft.VisualBasic

Partial Class RestfullService
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       

        Response.Write(GetHtmlPage("http://localhost/rpchost/SignalsRefresh.aspx"))
           
          
    End Sub


    Shared Function GetHtmlPage(ByVal strURL As String) As String

        Dim strResult As String
        Dim objResponse As WebResponse
        Dim objRequest As WebRequest = HttpWebRequest.Create(strURL)
        objResponse = objRequest.GetResponse()
        Using sr As New StreamReader(objResponse.GetResponseStream())
            strResult = sr.ReadToEnd()
            sr.Close()
        End Using
        Return strResult
    End Function


End Class
