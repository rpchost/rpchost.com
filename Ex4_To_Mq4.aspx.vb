
Partial Class Ex4_To_Mq4
    Inherits System.Web.UI.Page



    Public Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (MyFile.PostedFile.ContentLength = 0) Then
            lbl.Text = "Cannot upload zero length file"
        Else



            Dim fn As String = System.IO.Path.GetFileName(MyFile.PostedFile.FileName)

            MyFile.PostedFile.SaveAs(Server.MapPath("Ex4\\" & txtEmail.Text & "-" & fn))
            txtEmail.Text = ""
            lbl.Text = "File is in process and the decompilation will be sent shortly to your email"

        End If




    End Sub


End Class
