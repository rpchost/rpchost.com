
Partial Class Offers
    Inherits System.Web.UI.Page

    Private amountBtc As String
    Private BtcAddress As String
    Private BUY_Price As String
    Private Currency As String
    Private UserID As String
    Private Email As String
    Private Status As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Offers")
        End If
        If (Page.IsPostBack = False) Then

            AccessDataSource1.SelectCommand = "Select * from Offers where Status = 'Running' order by DateOffer desc"
            grdOffers.DataBind()
        End If
        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

        Dim row As Object

        For Each row In grdOffers.Rows

            Dim wallet As String = DirectCast(row.FindControl("Wallet"), TextBox).Text
            If (wallet.Trim = "") Then

                DirectCast(row.FindControl("btnBuy"), Button).Visible = False

            Else

                DirectCast(row.FindControl("btnBuy"), Button).Visible = True

            End If
        Next

    End Sub

    Protected Sub OpenBuy(ByVal sender As Object, ByVal e As EventArgs)
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Offers")
        End If
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                          GridViewRow)

        Dim index As Integer = gvRow.RowIndex
        Dim wallet As String = DirectCast(grdOffers.Rows(index).FindControl("Wallet"), TextBox).Text
        If (wallet.Trim <> "") Then

            DirectCast(grdOffers.Rows(index).FindControl("btnBuy"), Button).visible = True

        End If
    End Sub

    Protected Sub btnOffers_Click(ByVal sender As Object, ByVal e As EventArgs)

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Offers")
        End If

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)

        Dim index As Integer = gvRow.RowIndex

        Dim ID As String = DirectCast(grdOffers.Rows(index).FindControl("ID"), Label).Text
        Dim Status = DirectCast(grdOffers.Rows(index).FindControl("Status"), Label).Text
        Dim wallet As String = DirectCast(grdOffers.Rows(index).FindControl("Wallet"), TextBox).Text
        Dim Amount As String = DirectCast(grdOffers.Rows(index).FindControl("Amount"), Label).Text
        Dim SellPrice As String = DirectCast(grdOffers.Rows(index).FindControl("SellPrice"), Label).Text
        Dim SellCurrency As String = DirectCast(grdOffers.Rows(index).FindControl("SellCurrency"), Label).Text

        If (wallet.Trim = "") Then
            Response.Write("<script>alert('Please provide a wallet so we can be able to send you the cryptocurrency')</script>")
        Else

            If (Status = "Running") Then

                Dim opExec As New rpchost.cs_Operation
                opExec.ExecuteSql("update Offers set UserID=" & Session("UserID") & ", [Status] = 'Pending' ,ReservedDtTime='" & Logger.GenerateTimeZone("Eastern Standard Time") & "',Wallet='" & wallet & "'  where ID = " & ID)
                opExec.closeConnection()

                Session("Amount") = Amount
                Session("wallet") = wallet.Trim
                Session("SellPrice") = SellPrice
                Session("Currency") = SellCurrency
                Session("OfferID") = ID

                Response.Redirect("OfferPayment.aspx")

            End If
        End If

    End Sub


    Protected Sub grdOffers_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdOffers.Load

        
    End Sub
End Class
