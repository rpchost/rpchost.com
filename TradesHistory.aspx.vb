Imports System.Data.OleDb
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web

Partial Class TradesHistory
    Inherits System.Web.UI.Page


    Sub WriteToFile(ByVal str As String, ByVal strFile As String)

        Dim fp As StreamWriter
        Dim strr As String = ""


        Try
            If File.Exists("C:/Program Files/MIG Trading Station/experts/files/SignalsHist.txt") Then
                strr = File.ReadAllText("C:/Program Files/MIG Trading Station/experts/files/SignalsHist.txt")
            End If

            txtHist.Text = strr


        Catch err As Exception
            'lblStatus.Text = "File Creation failed. Reason is as follows "" & err.ToString()"
        Finally

        End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        WriteToFile("", "")

    End Sub

End Class
