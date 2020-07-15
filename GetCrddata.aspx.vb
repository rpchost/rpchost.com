
Partial Class GetCrddata
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Cr.Text = (Convert.ToInt64(Request.QueryString("CR")) - CInt(Request.QueryString("VAL")) - 103).ToString

        EM.Text = CDbl(Request.QueryString("EM")) - CInt(Request.QueryString("VAL")) - 103
        EY.Text = CDbl(Request.QueryString("EY")) - CInt(Request.QueryString("VAL")) - 103
        CC.Text = CDbl(Request.QueryString("CC")) - CInt(Request.QueryString("VAL")) - 103
    End Sub
End Class
