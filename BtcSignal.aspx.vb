
Partial Class BtcSignal
    Inherits System.Web.UI.Page

   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BtcSignal")
        Else
            
            AccessDataSource1.SelectCommand = "SELECT * FROM BtcSignals order by ID desc"
            grdSignals.DataBind()
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If


        'If (Page.IsPostBack = False) Then
        '    Dim row As Object
        '    For Each row In grdContract.Rows
        '        If Not DirectCast(row.FindControl("Status"), Label).Text.Equals("Pending") Then
        '            DirectCast(row.FindControl("Button1"), Button).Visible = False
        '        End If
        '    Next
        'End If

    End Sub

   
    Protected Sub grdSignals_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSignals.Load

        Dim row As Object

        Dim stat As String

        For Each row In grdSignals.Rows

            stat = DirectCast(row.FindControl("Trend"), Label).Text

            If (stat = "BUY") Then

                DirectCast(row.FindControl("TrendImg"), Image).ImageUrl = "pictures\Up.gif"
                DirectCast(row.FindControl("Trend"), Label).ForeColor = Drawing.Color.Green

            ElseIf (stat = "SELL") Then
                DirectCast(row.FindControl("TrendImg"), Image).ImageUrl = "pictures\Down.gif"
                DirectCast(row.FindControl("Trend"), Label).ForeColor = Drawing.Color.Red

            End If

        Next

    End Sub


End Class
