
Partial Class OnParticipe
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Response.Write("<script>window.open ('https://www.onparticipe.fr/cagnottes/yp2prXSi#je-participe','_blank');</script>")
    End Sub
End Class
