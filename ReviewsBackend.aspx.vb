
Partial Class ReviewsBackend
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If (txtReview.Text.Trim = "") Then
            lblMess.Text = "Review must not be empty"
            Return
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Reviews (UserName,ReviewDate, Moderated, Review) values ('" & Request("txtUserName").Trim + "','" & Request("txtDate") & "','yes','" & Request("txtReview") & "') ")
        opExec.closeConnection()

        txtReview.Text = ""
        lblMess.Text = "Review added from Backend"

        Response.Redirect("ReviewsBackend.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        txtDate.Text = Logger.GenerateTimeZone("Eastern Standard Time")
    End Sub

    
    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub
End Class
