Imports System.Data.OleDb
Imports rpchost

Partial Class BuySharesBitcoin
    Inherits System.Web.UI.Page

    Shared link As String

    Private btcAsk As Double
    Private btcUsdAsk As Double
    Private btcUsdBid As Double
    Private btcEurAsk As Double
    Private btcEurBid As Double
    Private Commission As Double

    Private btcFrontUsdAsk As Double
    Private btcFrontUsdBid As Double
    Private btcFrontEurAsk As Double
    Private btcFrontEurBid As Double

    Dim BtcAskMin As Double
    Dim BtcAskMax As Double


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Contribution where ID = " & Request.QueryString("ID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                lblVerification.Text = "Campaign Name : " & reader("CampainName") & "<br> Remained bitcoin : " & reader("BtcRemain") & "<br> Min Contribution : " & reader("MinContribution") & reader("Curr") & " - Max Contribution : " & reader("BtcPriceRemain") & reader("Curr")
                BtcAskMin = reader("MinContribution")
                BtcAskMax = reader("BtcPriceRemain")
                link = reader("ContributionLink")
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Response.Write("<script language=javascript>")
        Response.Write("window.open('" & link & "',target='_blank')")
        Response.Write("</script>")

    End Sub

    Protected Sub txtDepositAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDepositAmount.TextChanged
        CalculateBuyBtc()
    End Sub

    Protected Sub CalculateBuyBtc()

        getBTCprices()

        btcAsk = btcFrontEurAsk + Commission
        

        If (IsNumeric(Request("txtDepositAmount").Trim)) Then
            If (Convert.ToDouble(Request("txtDepositAmount").Trim) >= BtcAskMin And Convert.ToDouble(Request("txtDepositAmount").Trim) <= BtcAskMax) Then
                If (btcAsk <> 0) Then txtBtcAmount.Text = String.Format("{0:0.00000000}", Convert.ToDouble(Request("txtDepositAmount")) / btcAsk)
            Else

                txtBtcAmount.Text = ""
                txtDepositAmount.Text = ""
                txtBtcAddress.Text = ""

                Response.Write("<script>alert('Not valid amount or the amount you entered is not between " & BtcAskMin & " and " & BtcAskMax & "')</script>")
            End If

        Else

            txtBtcAmount.Text = ""
            txtDepositAmount.Text = ""
            txtBtcAddress.Text = ""

            If (Not Request("txtDepositAmount").Trim.Equals("")) Then
                Response.Write("<script>alert('Not valid amount')</script>")
            End If

        End If

    End Sub

    Protected Function getBTCprices() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()

                btcUsdAsk = IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))
                btcUsdBid = IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))
                btcEurAsk = IIf(IsDBNull(reader("BtcUsdAsk")), 0, reader("BtcUsdAsk"))
                btcEurBid = IIf(IsDBNull(reader("btcUsdBid")), 0, reader("btcUsdBid"))
                Commission = IIf(IsDBNull(reader("BTC")), 0, reader("BTC"))

                btcFrontUsdAsk = IIf(IsDBNull(reader("FrontUsdAsk")), 0, reader("FrontUsdAsk"))
                btcFrontUsdBid = IIf(IsDBNull(reader("FrontUsdBid")), 0, reader("FrontUsdBid"))
                btcFrontEurAsk = IIf(IsDBNull(reader("FrontEurAsk")), 0, reader("FrontEurAsk"))
                btcFrontEurBid = IIf(IsDBNull(reader("FrontEurBid")), 0, reader("FrontEurBid"))

                Return True

            Else

                Return False


            End If


        Catch ex As Exception

            Return False
            ' Dispose()
            ' GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Function

    Protected Sub btnCancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelPayment.Click
        Response.Redirect("BuyBitcoins.aspx")
    End Sub
End Class
