
Partial Class FXAS_statistics
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Redirect("sentiment.aspx?curr=" & ddCurrency.SelectedValue)
    End Sub
End Class
