
Imports rpchost

Partial Class DeleteUser
    Inherits System.Web.UI.Page

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click

        If (txtFromUser.Text.Trim = "" Or txtToUser.Text.Trim = "") Then
            Return
        End If


        Try
            If (CInt(txtFromUser.Text.Trim) > CInt(txtToUser.Text.Trim)) Then
                Return
            End If
        Catch ex As Exception
            Return
        End Try



        Dim sqlParam As String
        Dim opExec As New cs_Operation

        Try



            sqlParam = "Delete from MembersForex where ID >= " & txtFromUser.Text.Trim & " and ID <= " & txtToUser.Text.Trim & " "
            opExec.ExecuteSql(sqlParam)


        Catch ex As Exception
            Response.Write("Error Description \\n" & ex.Message)

        Finally
            opExec.closeConnection()
        End Try
    End Sub
    Protected Sub btnMain_Click(sender As Object, e As EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
End Class
