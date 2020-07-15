
Partial Class SendEmail
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Try
            SendNotification.Email(txtSubject.Text.Trim, txtReply.Text.Trim, txtTo.Text.Trim)
            lblMess.Text = "Message sent successfully"
        Catch ex As Exception
            lblMess.Text = "Error while sending message; Message Error : " & ex.Message
        Finally

            txtReply.Text = ""
            txtSubject.Text = ""
            txtTo.Text = ""
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub

    
    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub
End Class
