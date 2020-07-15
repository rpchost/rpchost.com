
Partial Class OffersBackend
    Inherits System.Web.UI.Page

    Private amountBtc As String
    Private BtcAddress As String
    Private BUY_Price As String
    Private Currency As String
    Private UserID As String
    Private Email As String
    Private Status As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        If (Page.IsPostBack = False) Then

            AccessDataSource1.SelectCommand = "Select * from Offers order by DateOffer desc"
            grdOffers.DataBind()
        End If

        DateOffer.Text = Logger.GenerateTimeZone("Eastern Standard Time")


    End Sub

    Protected Sub grdOffers_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdOffers.RowUpdating

        Dim ID As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        UserID = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        Dim Amount As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("Amount"), TextBox).Text
        Dim Wallet As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("Wallet"), TextBox).Text
        Dim CryptoType As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("CryptoType"), TextBox).Text
        Dim BuyPrice As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("BuyPrice"), TextBox).Text
        Dim SellPrice As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("SellPrice"), TextBox).Text
        Dim DateOffer As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("DateOffer"), TextBox).Text
        Dim Status As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("Status"), TextBox).Text
        Dim BuyCurrency As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("BuyCurrency"), TextBox).Text
        Dim SellCurrency As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("SellCurrency"), TextBox).Text
        Dim OfferType As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("OfferType"), TextBox).Text
        Dim SellRate As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("SellRate"), TextBox).Text
        Dim profit As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("profit"), TextBox).Text
        Dim ReservedDate As String = DirectCast(grdOffers.Rows(e.RowIndex).FindControl("ReservedDtTime"), TextBox).Text

        If (UserID.Trim = "") Then UserID = "0"
        If (Amount.Trim = "") Then Amount = "0"
        If (BuyPrice.Trim = "") Then BuyPrice = "0"
        If (SellPrice.Trim = "") Then SellPrice = "0"
        If (SellRate.Trim = "") Then SellRate = "0"
        If (profit.Trim = "") Then profit = "0"

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Offers set UserID = " & UserID & ", Amount = " & Amount & ",  [Wallet]='" & Wallet & "',  CryptoType='" & CryptoType & "',  BuyPrice=" & Convert.ToDouble(BuyPrice) & ",  SellPrice=" & Convert.ToDouble(SellPrice) & ",  DateOffer='" & DateOffer & "',  Status='" & Status & "',  BuyCurrency='" & BuyCurrency & "',  SellCurrency='" & SellCurrency & "',  OfferType='" & OfferType & "',  SellRate=" & SellRate & ",Profit=" & profit & " ,ReservedDtTime='" & ReservedDate & "' where ID = " & ID)
        opExec.closeConnection()

    End Sub

    Protected Sub walet(ByVal sender As Object, ByVal e As EventArgs) Handles grdOffers.SelectedIndexChanged

    End Sub



    Protected Sub grdOffers_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdOffers.Load

        ' Dim row As Object

        'For Each row In grdOffers.Rows
        '    If (row.Cells(10).Text = "Buy") Then
        '        row.Cells(10).ForeColor = Drawing.Color.Blue
        '    End If
        '    If (row.Cells(10).Text = "Sell") Then
        '        row.Cells(10).ForeColor = Drawing.Color.Red
        '    End If

        '    If (row.Cells(11).Text = "Pending") Then
        '        row.Cells(11).ForeColor = Drawing.Color.DarkMagenta
        '    End If
        '    If (row.Cells(11).Text = "Process") Then
        '        row.Cells(11).ForeColor = Drawing.Color.Maroon
        '    End If
        '    If (row.Cells(11).Text = "Finished") Then
        '        row.Cells(11).ForeColor = Drawing.Color.DarkGreen
        '    End If

        'Next


    End Sub

    Protected Sub btnAddOffer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddOffer.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Offers (Amount,CryptoType,BuyPrice,SellPrice,DateOffer,Status,BuyCurrency,SellCurrency,OfferType,SellRate,ClientGet) values (" & Amount.Text & ",'" & CryptoType.Text & "'," & BuyPrice.Text & "," & SellPrice.Text & ",'" & DateOffer.Text & "','" & txtStatus.Text & "','" & BuyCurrency.Text & "','" & SellCurrency.Text & "','" & OfferType.Text & "'," & txtSellRate.Text & "," & ClientGet.Text & ")")
        opExec.closeConnection()

        Response.Redirect("OffersBackend.aspx")
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub

    Protected Sub btnClearPending_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearPending.Click
        Dim opExec As New rpchost.cs_Operation

        Dim dtNow As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
        Dim dtRow As DateTime
        Dim ID As Integer

        Dim stat As String

        For Each row As GridViewRow In grdOffers.Rows
            stat = DirectCast(row.FindControl("Status"), Label).Text
            dtRow = DirectCast(row.FindControl("ReservedDtTime"), Label).Text
            ID = DirectCast(row.FindControl("ID"), Label).Text

            If (stat = "Pending") Then
                If (DateDiff(DateInterval.Minute, dtRow, dtNow) > 5) Then
                    opExec.ExecuteSql("update Offers set UserID=0,Status='Running',Wallet='',ReservedDtTime='' where Status='Pending' and wallet<> '' and ID=" & ID)
                    opExec.closeConnection()
                End If
            End If
        Next

        Response.Redirect("OffersBackend.aspx")


    End Sub

    Protected Sub SellPrice_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SellPrice.TextChanged
        ClientGet.Text = CInt(CDbl(Amount.Text) * CDbl(SellPrice.Text))
    End Sub
End Class
