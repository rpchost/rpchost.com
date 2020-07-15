Namespace Rpchost



    Partial Class DeleteSignals
        Inherits System.Web.UI.Page


        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

            If IsNothing(Session("USR")) = True Then
                Response.Redirect("loginbackend.aspx")
            End If

            If (Request.QueryString("stat") = "DEL") Then

                Dim conn As New cs_Operation
                conn.openConnection()
                conn.ExecuteSql("delete from signal")
                conn.closeConnection()

                Response.Write("<script language=javascript>")
                Response.Write("window.close();")
                Response.Write("</script>")

            End If

        End Sub

        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim conn1 As New cs_OperationSQL
            conn1.openConnection()
            conn1.ExecuteSql("Delete from signal where ID >= " & CInt(txtFrom.Text) & " and ID <= " & CInt(txtTo.Text))
            lblMess.Text = "Signals deleted"
            conn1.closeConnection()

        End Sub

    

        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Dim conn1 As New cs_OperationSQL
            conn1.openConnection()
            conn1.ExecuteSql("Delete from signal")
            lblMess.Text = "Signals deleted"
            conn1.closeConnection()
        End Sub


        Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
            Response.Redirect("backend/backend.aspx")
        End Sub

        Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEdit.Click
            Response.Redirect("SignalsManagement.aspx")
        End Sub
    End Class

End Namespace