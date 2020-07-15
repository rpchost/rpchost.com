
Partial Class advertise
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If (RdPayment.SelectedValue = "3000") Then
            Response.Redirect("Advertise3000.aspx")
        End If
        If (RdPayment.SelectedValue = "250") Then
            Response.Redirect("Advertise250.aspx")
        End If
        If (RdPayment.SelectedValue = "100") Then
            Response.Redirect("Advertise100.aspx")
        End If
        If (RdPayment.SelectedValue = "1200") Then
            Response.Redirect("Advertise1200.aspx")
        End If

    End Sub
End Class
