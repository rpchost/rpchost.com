Imports System.Net.Mail

Partial Class Default4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Try
        Dim msg As New System.Net.Mail.MailMessage
        Dim smtp As New System.Net.Mail.SmtpClient
        Dim addrFrom As New System.Net.Mail.MailAddress("webmaster@rpchost.com")
        Dim addrTo As New System.Net.Mail.MailAddress("Rpchost.payments@gmail.com")
        msg.From = addrFrom
        msg.To.Add(addrTo)

        msg.Subject = "Subject"
        msg.Body = "BODY"

        'smtp.Host = "smtp.gmail.com"
        'smtp.Port = 587
       
        smtp.DeliveryMethod = Net.Mail.SmtpDeliveryMethod.Network
        smtp.EnableSsl = False
        ' smtp.UseDefaultCredentials = True
        smtp.Host = "relay-hosting.secureserver.net"
        smtp.Port = 25
        'smtp.DeliveryMethod = SmtpDeliveryMethod.Network
        smtp.Credentials = New System.Net.NetworkCredential("Rpchost.payments@gmail.com", "Jijo1136!")
        smtp.Send(msg)

        ' Catch exc As Net.Mail.SmtpException
        'Response.Write(exc.Message.ToString)
        ' End Try
    End Sub
End Class
