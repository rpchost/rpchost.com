Imports rpchost
Imports System.Data.OleDb

Partial Class Signals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=signals")
        End If

        lblMess.text = getLastPayment()

        'Dim rate As New Rate
        'txtMonthlyProfit.Text ="Be your own bank"

    End Sub

    Private Function getLastPayment() As String

        Dim opExec As New cs_Operation

        Dim strMarquee As String = ""
        Dim strStatus As String = ""

        Dim reader As OleDbDataReader = opExec.rdGetReader("select DateLastPayment,smsnotification from Membersforex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("DateLastPayment") + IIf(reader("smsnotification") = True, " [WITH SMS NOTIFICATION]", " [WITHOUT SMS NOTIFICATION]")

            Else

                Return ""

            End If


        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

    End Function

End Class
