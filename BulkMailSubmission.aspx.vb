Imports rpchost
Imports System.Data.OleDb

Partial Class BulkMailSubmission
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
        Dim sql As String = ""

        If (txtUserID1.Text.Trim <> "" And txtUserID2.Text.Trim <> "") Then
            sql = "SELECT Email,ID from MembersForex where ID between(" & txtUserID1.Text.Trim & "," & txtUserID2.Text.Trim & ")"
        End If
        If (txtUserID1.Text.Trim = "" And txtUserID2.Text.Trim = "") Then
            sql = "SELECT Email,ID from MembersForex"
        End If
        If (txtUserID1.Text.Trim <> "" And txtUserID2.Text.Trim = "") Then
            sql = "SELECT Email,ID from MembersForex where ID >= " & txtUserID1.Text.Trim
        End If
        If (txtUserID1.Text.Trim = "" And txtUserID2.Text.Trim <> "") Then
            sql = "SELECT Email,ID from MembersForex where ID <= " & txtUserID2.Text.Trim
        End If

        If (chkVerified.Checked And chkNonVerified.Checked = False) Then
            sql = "SELECT Email,ID from MembersForex where verified=true"
        End If
        If (chkVerified.Checked = False And chkNonVerified.Checked = True) Then
            sql = "SELECT Email,ID from MembersForex where verified=false or verified is null"
        End If
       

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader(sql)

        Try
            Dim email As String

            If reader.HasRows = True Then

                While reader.Read()
                    email = reader("Email")
                    If (EmailSent(email.Trim)) Then
                        lblMess.Text = lblMess.Text & "<div class='GreenText'>Message sent successfully to " & email.Trim & "</div><br>"
                        Threading.Thread.Sleep(15000)
                    Else
                        lblMess.Text = lblMess.Text = lblMess.Text & "<div class='RedTextBold'>Message was not sent successfully to " & email.Trim & "</div><br>"
                    End If

                End While

            End If

        Catch ex As Exception
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)
        Finally
            opExec.closeConnection()
            Dispose()
            txtReply.Text = ""
            txtSubject.Text = ""
        End Try
    End Sub

    Protected Function EmailSent(ByVal email As String) As Boolean

        Try
            SendNotification.Email(txtSubject.Text.Trim, txtReply.Text.Trim, email)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub
End Class
