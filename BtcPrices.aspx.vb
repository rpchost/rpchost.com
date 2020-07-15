Imports System.Data.OleDb
Imports System.IO
Imports System.Net

Partial Class BtcPrices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        If (Page.IsPostBack = False) Then


            Dim str As String = ""
            Dim opExec As New rpchost.cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Prices")
            Try

                If reader.HasRows = True Then

                    reader.Read()

                    txtAskEur.Text = IIf(IsDBNull(reader("BtcUsdAsk")), 0, reader("BtcUsdAsk"))
                    txtBidEur.Text = IIf(IsDBNull(reader("BtcUsdBid")), 0, reader("BtcUsdBid"))
                    
                    txtRate.Text = IIf(IsDBNull(reader("BCC")), 0, reader("BCC"))
                    lblLastUpdatedPrice.Text = "Last updated : " & IIf(IsDBNull(reader("LastUpdatedPricesDateTime")), 0, reader("LastUpdatedPricesDateTime"))

                    txtFrontUsdAsk.Text = IIf(IsDBNull(reader("FrontUsdAsk")), 0, reader("FrontUsdAsk"))
                    txtFrontUsdBid.Text = IIf(IsDBNull(reader("FrontUsdBid")), 0, reader("FrontUsdBid"))
                    txtFrontEurAsk.Text = IIf(IsDBNull(reader("FrontEurAsk")), 0, reader("FrontEurAsk"))
                    txtFrontEurBid.Text = IIf(IsDBNull(reader("FrontEurBid")), 0, reader("FrontEurBid"))

                    txtAskCommission.Text = IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))
                    txtBidCommission.Text = IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))

                    'txtCommission.Text = IIf(IsDBNull(reader("BTC")), 0, reader("BTC"))


                    'txtCrdCdCommission.Text = IIf(IsDBNull(reader("CrdComm")), 0, reader("CrdComm"))
                    'txtPayplCommission.Text = IIf(IsDBNull(reader("PayplComm")), 0, reader("PayplComm"))
                    'txtBankCommission.Text = IIf(IsDBNull(reader("BankComm")), 0, reader("BankComm"))
                    'txtPMCommission.Text = IIf(IsDBNull(reader("PMComm")), 0, reader("PMComm"))
                    'txtWUCommission.Text = IIf(IsDBNull(reader("WUComm")), 0, reader("WUComm"))
                    'txtRevCommission.Text = IIf(IsDBNull(reader("RevComm")), 0, reader("RevComm"))
                    'txtOMTCommission.Text = IIf(IsDBNull(reader("OmtComm")), 0, reader("OmtComm"))
                    'txtWiseCommission.Text = IIf(IsDBNull(reader("WiseComm")), 0, reader("WiseComm"))
                    'chkComm.Checked = reader("ActivatePaymntComm")

                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End If

    End Sub

    Function GetHTML(ByVal strPage As String) As String

        Try
            Dim wc As New System.Net.WebClient
            Dim s As String = wc.DownloadString(strPage)
            Return s
        Catch ex As Exception
            Return ""
        End Try
        
    End Function

    
    Protected Sub btcSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btcSubmit.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Prices set BtcUsdAsk = " & Request("txtAskEur") & " , BtcUsdBid = " & Request("txtBidEur") & " ,  MinAsk = " & Request("txtAskCommission") & ",MinBid = " & Request("txtBidCommission") & " ,BCC = " & Request("txtRate") & ",FrontUsdAsk = " & Request("txtFrontUsdAsk") & ",FrontUsdBid = " & Request("txtFrontUsdBid") & ",FrontEurAsk = " & Request("txtFrontEurAsk") & ",FrontEurBid = " & Request("txtFrontEurBid") & " ")
        opExec.closeConnection()

        Response.Redirect("BtcPrices.aspx")
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/Backend.aspx")
    End Sub

    Protected Sub txtBidEur_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBidEur.TextChanged
        txtBidUsd.Text = Convert.ToInt32(Convert.ToDouble(txtBidEur.Text) * Convert.ToDouble(txtRate.Text))
    End Sub

    Protected Sub txtAskEur_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAskEur.TextChanged
        txtAskUsd.Text = Convert.ToInt32(Convert.ToDouble(txtAskEur.Text) * Convert.ToDouble(txtRate.Text))
    End Sub

    Protected Sub txtRate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRate.TextChanged
        txtBidUsd.Text = Convert.ToInt32(Convert.ToDouble(txtBidEur.Text) * Convert.ToDouble(txtRate.Text))
        txtAskUsd.Text = Convert.ToInt32(Convert.ToDouble(txtAskEur.Text) * Convert.ToDouble(txtRate.Text))
    End Sub


    Protected Sub txtFrontEurAsk_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtFrontEurAsk.TextChanged
        If (IsNumeric(txtFrontEurAsk.Text)) Then txtFrontEurBid.Text = CDbl(txtFrontEurAsk.Text) - 700
    End Sub

    Protected Sub txtFrontUsdAsk_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtFrontUsdAsk.TextChanged
        If (IsNumeric(txtFrontUsdAsk.Text)) Then txtFrontUsdBid.Text = CDbl(txtFrontUsdAsk.Text) - 700

    End Sub

    'Protected Sub btnEUR_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEUR.Click
    '    Dim price As New Rate
    '    Dim prEur As Double
    '    prEur = price.GetPrice("EUR")
    '    txtFrontEurAsk.Text = prEur + CDbl(txtAskCommission.Text)
    '    txtFrontEurBid.Text = prEur - CDbl(txtBidCommission.Text)

    'End Sub

    Protected Sub btnUSD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUSD.Click
        Dim price As New Rate
        Dim prUsd As Double
        prUsd = price.GetPrice("USD")
        txtFrontUsdAsk.Text = prUsd + CDbl(txtAskCommission.Text)
        txtFrontUsdBid.Text = prUsd - CDbl(txtBidCommission.Text)


        Dim prEur As Double
        prEur = price.GetPrice("EUR")
        txtFrontEurAsk.Text = prEur + CDbl(txtAskCommission.Text)
        txtFrontEurBid.Text = prEur - CDbl(txtBidCommission.Text)

    End Sub
    'Protected Sub btnEur_Click1(sender As Object, e As EventArgs) Handles btnEur.Click
    '    Dim price As New Rate
    '    Dim prEur As Double
    '    prEur = price.GetPrice("EUR")
    '    txtFrontEurAsk.Text = prEur + CDbl(txtAskCommission.Text)
    '    txtFrontEurBid.Text = prEur - CDbl(txtBidCommission.Text)

    '    Dim prUsd As Double
    '    prUsd = price.GetPrice("USD")
    '    txtFrontUsdAsk.Text = prUsd + CDbl(txtAskCommission.Text)
    '    txtFrontUsdBid.Text = prUsd - CDbl(txtBidCommission.Text)
    'End Sub
End Class
