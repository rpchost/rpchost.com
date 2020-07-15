Imports System.Data.OleDb
Imports rpchost

Partial Class AccontVerificationBackend
    Inherits System.Web.UI.Page

    Protected Sub grdVerification_Select(ByVal sender As Object, ByVal e As EventArgs) Handles grdVerification.SelectedIndexChanged

        Dim UserID As String = DirectCast(grdVerification.SelectedRow.FindControl("UserID"), HyperLink).Text
        Dim Verified As Boolean = DirectCast(grdVerification.SelectedRow.FindControl("Verified"), Label).Text
        Dim VerificationMessage As String = DirectCast(grdVerification.SelectedRow.FindControl("VerificationMessage"), Label).Text
        'Dim NotifyVerification As Boolean = DirectCast(grdVerification.SelectedRow.FindControl("NotifyVerification"), Label).Text

        If (SendAlert(UserID, getUserMail(UserID), VerificationMessage, Verified)) Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update membersForex set NotifyVerification= true  where ID = " & UserID)
            opExec.closeConnection()

            Response.Redirect("AccontVerificationBackend.aspx")
        End If

    End Sub


    Protected Sub grdVerification_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdVerification.RowUpdating

        Dim UserID As String = DirectCast(grdVerification.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text
        Dim Verified As Boolean = DirectCast(grdVerification.Rows(e.RowIndex).FindControl("Verified"), CheckBox).Checked
        Dim VerificationMessage As String = DirectCast(grdVerification.Rows(e.RowIndex).FindControl("VerificationMessage"), TextBox).Text
        Dim CRD As String = DirectCast(grdVerification.Rows(e.RowIndex).FindControl("CRD"), TextBox).Text

        If (Verified = True) Then
            VerificationMessage = ""
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update membersForex set Verified= " & Verified & ", [VerificationMessage]='" & VerificationMessage & "', CRD='" & CRD & "' where ID = " & UserID)
        opExec.closeConnection()

    End Sub

   

    Protected Sub BtnDeleteDoc_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                           GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim UserID As String = DirectCast(grdVerification.Rows(index).FindControl("UserID"), HyperLink).Text
        Dim VerifiedFile As String = DirectCast(grdVerification.Rows(index).FindControl("VerifiedFile"), HyperLink).Text

        If System.IO.File.Exists(Server.MapPath(VerifiedFile)) = True Then
            System.IO.File.Delete(Server.MapPath(VerifiedFile))

        Else
            MsgBox("Document already deleted or does not exist")

        End If

    End Sub

    Protected Sub btnNotify_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                        GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim UserID As String = DirectCast(grdVerification.Rows(index).FindControl("UserID"), HyperLink).Text

        Dim Verified As Boolean = DirectCast(grdVerification.Rows(index).FindControl("Verified"), Label).Text
        Dim VerificationMessage As String = DirectCast(grdVerification.Rows(index).FindControl("VerificationMessage"), Label).Text

        If (SendAlert(UserID, getUserMail(UserID), VerificationMessage, Verified)) Then
            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("update membersForex set NotifyVerification= true  where ID = " & UserID)
            opExec.closeConnection()

            Response.Redirect("AccontVerificationBackend.aspx")
        End If

    End Sub


    Protected Function getUserMail(ByVal UserID As Integer) As String

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT Email from MembersForex where ID=" & UserID)
        Try

            If reader.HasRows = True Then
                reader.Read()
                Return Trim(reader("Email"))
            Else
                Return ""
            End If

        Catch ex As Exception

            opExec.closeConnection()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
        End Try

    End Function

    Protected Function SendAlert(ByVal UserID As String, ByVal Email As String, ByVal Decision As String, ByVal Verified As String) As Boolean

        Try
            SendNotification.Email("Rpchost.com Verification", "<br><br> UserID = " & UserID & "<br> Verified = " & Verified & "<br> Decision = " & Decision & "<br><br>Thank you", Email)
            Return True
        Catch ex As Exception
            Return False
            SendNotification.Email("Rpchost.com Verification ERROR for UserID = " & UserID, "rpchost.payments@gmail.com")
        End Try

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub

    Protected Sub btnPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayment.Click
        Response.Redirect("PaymentsBackend.aspx")
    End Sub
End Class
