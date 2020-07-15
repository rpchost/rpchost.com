Imports rpchost
Imports System.Data.OleDb


Partial Class ContactForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strMarquee As String = ""

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
        txtDateSend.Text = dt.ToString("dd'/'MM'/'yyyy HH:mm")
        txtUserName.Text = "Administrator"
        GridView1.DataBind()

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim opExec = New rpchost.cs_Operation


        Try
            Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")

            Dim sql As String = "insert into ContactDetails(UserID,DateSent,firstname,Feedback)values(" & Trim(Request("txtUserID")) & ",'" & txtDateSend.Text & "','" & Trim(txtUserName.Text) & "','" & txtReply.Text & "')"
            opExec.ExecuteSql(sql)
            GridView1.DataBind()

            txtReply.Text = ""
            txtUserID.Text = ""
            txtUserEmail.Text = ""

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()

            Response.Redirect("ContactForm.aspx")
        End Try
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/Backend.aspx")
    End Sub

    Protected Sub txtUserID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUserID.TextChanged
        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select ID,Email from MembersForex where ID = " & txtUserID.Text)
        Try

            If reader.HasRows = True Then

                reader.Read()

                txtUserEmail.Text = reader("Email")

            Else

                txtUserEmail.Text = ""

            End If

        Catch ex As Exception
            Response.Write("ERROR")
        Finally
            opExec.closeConnection()
        End Try

        If (txtUserEmail.Text.Trim <> "") Then
            Try
                SendNotification.Email("Rpchost.com replied your Question", "Dear Sir/Madam Rpchost.com administrator just replied your Question/Feedback. Please Login to your account." & vbCrLf & vbCrLf & " Best Regards " & vbCrLf & " Rpchost.com ", txtUserEmail.Text.Trim)
            Catch ex As Exception
            End Try
        End If

    End Sub
End Class
