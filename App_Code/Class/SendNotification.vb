Imports System
Imports System.Reflection
Imports System.Security.Permissions
Imports System.Security
Imports System.IO
Imports System.Collections
Imports System.Text
Imports System.Web

Public Class SendNotification

    Public Shared Function Email(ByVal Subject As String, ByVal Body As String, Optional ByVal SendTo As String = "Rpchost.payments@gmail.com") As Boolean

        Try

            Dim msg As New System.Net.Mail.MailMessage
            Dim smtp As New System.Net.Mail.SmtpClient
            Dim addrFrom As New System.Net.Mail.MailAddress("webmaster@rpchost.com")
            Dim addrTo As New System.Net.Mail.MailAddress(SendTo)
            Dim addrToCC As New System.Net.Mail.MailAddress("Rpchost.payments@gmail.com")

            msg.From = addrFrom
            msg.To.Add(addrTo)

            If (Not addrTo.Equals("Rpchost.payments@gmail.com")) Then
                msg.Bcc.Add(addrToCC)
            End If
            msg.IsBodyHtml = True
            msg.Subject = Subject
            msg.Body = Body
            smtp.DeliveryMethod = Net.Mail.SmtpDeliveryMethod.Network
            smtp.EnableSsl = False
            smtp.Host = "relay-hosting.secureserver.net"
            smtp.Port = 25
            smtp.Credentials = New System.Net.NetworkCredential("Rpchost.payments@gmail.com", "Jijo1136!")
            smtp.Send(msg)

            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

End Class

