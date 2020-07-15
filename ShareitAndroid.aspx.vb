Imports System.Data.OleDb

Partial Class ShareitAndroid
    Inherits System.Web.UI.Page

    Public strFName As String
    Public strLName As String
    Public strEmail As String
    Public strCountry As String
    Public strCountryID As String
    Public strCity As String

    Public strPostalCode As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim Ds As New rpchost.cs_Operation
        Dim arr As String()

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where UsrName = '" & Request.QueryString("AndroidID") & "' ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                strFName = reader("Firstname")
                strLName = reader("Lastname")
                strEmail = reader("Email")
                strCountry = reader("Country")
                strCountryID = reader("Level")

                arr = Split(reader("City"), "@")
                strCity = Trim(arr(0))
                strPostalCode = Trim(arr(1))

            End If

        Catch ex As Exception

            Response.Write("Error: Please retry - ")
            Response.Write(ex.InnerException)
            Ds.closeConnection()
            Dispose()
        Finally
            Ds.closeConnection()
            Dispose()
        End Try

    End Sub
End Class
