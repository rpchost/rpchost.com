Imports System.Data.OleDb

Partial Class AccountVerification
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=AccountVerification")
        End If

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

               
                If (Not IsDBNull(reader("Verified"))) Then
                    If (reader("Verified") = True) Then
                        lblVerMess.Text = "Account Verified"
                        lblVerMess.CssClass = "GreenText"

                        'btnSubmit.Enabled = False
                        ' btnSubmit.CssClass = "INPUTTEXTbtnDisabled"
                    End If
                    If (reader("Verified") = False) Then
                        lblVerMess.Text = "Account Not Verified"
                        lblVerMess.CssClass = "RedtextBold"
                        btnSubmit.Enabled = True

                       
                    End If

                Else
                    lblVerMess.Text = "Account Not Verified"
                    lblVerMess.CssClass = "RedtextBold"
                    btnSubmit.Enabled = True
                End If

                If (Not IsDBNull(reader("VerificationMessage"))) Then
                    lblVerificationMessage.Text = reader("VerificationMessage")

                Else
                    lblVerificationMessage.Text = ""

                End If

            End If

        Catch ex As Exception
            Response.Redirect(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=profile")
        End If

        Dim strVerify As String = ""
        lblMess.Text = ""

        If (lblVerMess.Text = "Account Verified") Then
            'Return
        End If

        Dim strVerificationMessage As String = "tt"

        If (MyFile.PostedFile.ContentLength <> 0) Then

            Dim fn As String = System.IO.Path.GetFileName(MyFile.PostedFile.FileName)

            MyFile.PostedFile.SaveAs(Server.MapPath("Verification\" & Session("UserID") & "-" & fn))
            strVerify = "Verification\" & Session("UserID") & "-" & fn

            Try
                SendNotification.Email("New Verification requested", "<br>UserID = " & Session("UserID") & "<br>Verification = " & strVerify & "<br>DateSent = " & Logger.GenerateTimeZon("Eastern Standard Time") & " ")
            Catch ex As Exception
                SendNotification.Email("New Verification requested ERROR :", ex.Message)
            End Try


        Else
            Response.Write("<script>alert('You have to choose a document to verify')</script>")
            Return

        End If


        Dim opExec As New rpchost.cs_Operation
        Try
            Dim sql As String = "update membersforex set VerifiedFile = '" & strVerify & "',LastDocumentSent = '" & Logger.GenerateTimeZon("Middle East Standard Time") & "', VerificationMessage='Document sent, we are reviewing it' ,notifyVerification = false  where ID = " & Session("UserID")
            opExec.ExecuteSql(sql)
            opExec.closeConnection()

            lblMess.Text = "Document uploaded succesfully; we are reviewing it, please wait"

            Logger.GenerateLog("New Verification requested; UserID = " & Session("UserID"), Logger.GenerateTimeZon("Middle East Standard Time"), "AccontVerificationBackend.aspx")

        Catch ex As Exception
            lblMess.Text = "Error while registration"
        Finally
            opExec.closeConnection()
        End Try

        ' Response.Redirect("AccountVerification.aspx")
    End Sub
End Class
