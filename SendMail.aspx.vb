Imports System.Net.Mail
Imports System.Data.OleDb


Namespace rpchost

    Partial Class SendMail
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation


        Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

            Dim sss As String

            opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex")
            Try
                While reader.Read()
                    'reader.Read()
                    sss = reader("Email")

                    Dim message As New MailMessage(txtFrom.Text, sss, txtSubject.Text, txtBody.Text)
                    Dim emailClient As New SmtpClient(txtSMTPServer.Text)
                    emailClient.Send(message)

                End While

                litStatus.Text = "Message Sent"

            Catch ex As Exception
                Response.Write(ex.Message)
            End Try

        End Sub


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            txtSMTPServer.Text = "smtp.wise.net.lb"
            txtFrom.Text = "webmaster@rpchost.com"
            txtTo.Text = "All Mailing List"
        End Sub
    End Class

End Namespace