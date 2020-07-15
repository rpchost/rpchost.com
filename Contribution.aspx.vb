
Partial Class Contribution
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Contribution")
        End If

        Dim row As Object

        Dim stat As String

        For Each row In grdContribution.Rows

                stat = DirectCast(row.FindControl("Status"), Label).Text

            If (stat = "Closed") Then
                DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Red
                DirectCast(row.FindControl("btnContribute"), Button).Enabled = False
            End If

            If (stat = "Running") Then
                DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Green
                DirectCast(row.FindControl("btnContribute"), Button).Enabled = True
            End If

        Next

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub

    Protected Sub btnContribute_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdContribution.Rows(index).FindControl("ID"), Label).Text



        Response.Redirect("BuySharesBitcoin.aspx?ID=" & ID)

    End Sub

   
End Class
