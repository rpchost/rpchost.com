Imports System.Data.OleDb

Partial Class RecoverPassword
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click


        If (txtEmail.Text.Trim = "") Then
            Return
        End If


        lblMess.Text = ""

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where [Email] = '" & txtEmail.Text.Trim & "' ")
        Try

            If reader.HasRows = True Then
                reader.Read()

                InsertIntoRecoverTable(reader("Email").trim, reader("Pwd").trim)

                Try
                    SendNotification.Email("Rpchost.com password recovery", "Dear " & reader("FirstName") & " " & reader("LastName") & "<br><br> Your password with Rpchost.com is <b>" & reader("Pwd").trim & "</b> <br><br>Best Regards <br><a href='http://rpchost.com/Login.aspx'>Rpchost.com</a> ", txtEmail.Text.Trim)
                    lblMess.Text = "Password is sent to your email"
                Catch ex As Exception
                    lblMess.Text = "We were not able to send you an email, please <a href=contact.aspx>contact us</a>"
                End Try

            Else
                lblMess.Text = "Not valid Email"

            End If

        Catch ex As Exception
            Response.Redirect(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub


    Protected Sub InsertIntoRecoverTable(ByVal Email As String, ByVal Password As String)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql(" insert into RecoverPassword ([Email],[Password],RequestDate) values ('" & Email.Trim & "','" & Password.Trim & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "') ")
        opExec.closeConnection()

    End Sub


    Protected Function AlreadyRequest(ByVal Email As String) As Boolean
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from RecoverPassword where [Email] = '" & Request("txtEmail").Trim & "' ")
        Try

            If reader.HasRows = True Then

                Return True


            Else
                Return False

            End If

        Catch ex As Exception
            Response.Redirect(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If
    End Sub
End Class
