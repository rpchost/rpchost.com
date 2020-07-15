
Partial Class AdvertiseAndroid
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim conn As New rpchost.cs_Operation
        Try
            Dim str As String = txtName.Text + "-" + txtEmail.Text + "-" + txtQuestion.Text

            conn.openConnection()
            conn.ExecuteSql("insert into Table1 (Field5, Field6) values ('" & str & "', 'Advertise')")

        Catch ex As Exception
            conn.closeConnection()
        Finally
            conn.closeConnection()
            txtName.Text = ""
            txtEmail.Text = ""
            txtQuestion.Text = ""
            Response.Write("<script language=javascript>")
            Response.Write("window.close();")
            Response.Write("</script>")
        End Try
    End Sub
End Class
