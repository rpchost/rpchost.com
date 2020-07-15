Imports System.Data.OleDb
Imports System.IO
Imports System.Net

Partial Class BtcPricesMan
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

                    txtFrontUsdAsk.Text = IIf(IsDBNull(reader("FrontUsdAsk")), 0, reader("FrontUsdAsk"))
                    txtFrontUsdBid.Text = IIf(IsDBNull(reader("FrontUsdBid")), 0, reader("FrontUsdBid"))
                    txtFrontEurAsk.Text = IIf(IsDBNull(reader("FrontEurAsk")), 0, reader("FrontEurAsk"))
                    txtFrontEurBid.Text = IIf(IsDBNull(reader("FrontEurBid")), 0, reader("FrontEurBid"))

                    txtAskCommission.Text = IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))
                    txtBidCommission.Text = IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))

                    txtEurPrice.Text = IIf(IsDBNull(reader("BCC")), 0, reader("BCC"))
                    txtUsdPrice.Text = IIf(IsDBNull(reader("BTC")), 0, reader("BTC"))

                 
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End If

    End Sub


    Protected Sub btcSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btcSubmit.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Prices set BCC=" & Request("txtEurPrice") & ",BTC=" & Request("txtUsdPrice") & ", MinAsk = " & Request("txtAskCommission") & ",MinBid = " & Request("txtBidCommission") & " ,FrontUsdAsk = " & Request("txtFrontUsdAsk") & ",FrontUsdBid = " & Request("txtFrontUsdBid") & ",FrontEurAsk = " & Request("txtFrontEurAsk") & ",FrontEurBid = " & Request("txtFrontEurBid") & " ")
        opExec.closeConnection()

        Response.Redirect("BtcPricesMan.aspx")
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/Backend.aspx")
    End Sub

  
    Protected Sub btcGenerate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btcGenerate.Click
        txtFrontEurAsk.Text = ""
        txtFrontEurBid.Text = ""
        txtFrontUsdAsk.Text = ""
        txtFrontUsdBid.Text = ""

        txtFrontEurAsk.Text = CInt(txtEurPrice.Text) + CInt(txtAskCommission.Text)
        txtFrontEurBid.Text = CInt(txtEurPrice.Text) - CInt(txtBidCommission.Text)
        txtFrontUsdAsk.Text = CInt(txtUsdPrice.Text) + CInt(txtAskCommission.Text)
        txtFrontUsdBid.Text = CInt(txtUsdPrice.Text) - CInt(txtBidCommission.Text)

    End Sub
End Class
