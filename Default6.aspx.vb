Imports rpchost
Imports System.Data.SqlClient

Partial Class Default6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    

    End Sub

    Protected Sub btnSetEur_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSetEur.Click
        Response.Redirect("buybitcoin.aspx")
    End Sub
End Class
