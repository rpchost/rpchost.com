Imports System.Data.OleDb

Partial Class StopStartPayments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ManageBtcButtons")
        Try

            If reader.HasRows = True Then

                reader.Read()

                txtBtcAskMax.Text = IIf(IsDBNull(reader("BtcAskMax")), "", reader("BtcAskMax"))
                txtBtcAskMin.Text = IIf(IsDBNull(reader("BtcAskMin")), "", reader("BtcAskMin"))
                txtBtcBidMax.Text = IIf(IsDBNull(reader("BtcBidMax")), "", reader("BtcBidMax"))
                txtBtcBidMin.Text = IIf(IsDBNull(reader("BtcBidMin")), "", reader("BtcBidMin"))
                txtAskMessage.Text = IIf(IsDBNull(reader("AskMessage")), "", reader("AskMessage"))
                txtBidMessage.Text = IIf(IsDBNull(reader("BidMessage")), "", reader("BidMessage"))
                txtBuyReserve.Text = IIf(IsDBNull(reader("BuyReserve")), 0, reader("BuyReserve"))

            End If


        Catch ex As Exception
            Response.Write(ex.Message)

        Finally

            opExec.closeConnection()
        End Try

    End Sub

    Protected Sub btcSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btcSubmit.Click

        If (Request("txtAskMessage").Trim = "") Then

            If (Request("txtBuyReserve") <> "0") Then

                If (Convert.ToDouble(Request("txtBuyReserve")) < (Convert.ToDouble(Request("txtBtcAskMax")) + Convert.ToDouble(Request("txtBtcAskMin")))) Then
                    lblMess.Text = "Buy Reserve should be >= MaxAskPrice+MinAskPrice"
                    Return
                End If

                If (Convert.ToDouble(Request("txtBtcAskMax")) > Convert.ToDouble(Request("txtBuyReserve"))) Then

                    lblMess.Text = "Not valid MaxAskPrice, it should be less then the BUY reserve"
                    Return
                Else
                    lblMess.Text = ""
                End If

            End If
            If (Convert.ToDouble(Request("txtBtcAskMin")) > Convert.ToDouble(Request("txtBtcAskMax"))) Then
                lblMess.Text = "MaxAskPrice must be >= MinAskPrice"
                Return
            End If
            If (Convert.ToDouble(Request("txtBtcBidMin")) > Convert.ToDouble(Request("txtBtcBidMax"))) Then
                lblMess.Text = "MaxBidPrice must be >= MinBidPrice"
                Return
            End If

        End If

        Dim opExec As New rpchost.cs_Operation
        Try
            opExec.ExecuteSql("update ManageBtcButtons set BtcAskMin='" & Request("txtBtcAskMin") & "',BtcAskMax='" & Request("txtBtcAskMax") & "',BtcBidMin='" & Request("txtBtcBidMin") & "',BtcBidMax='" & Request("txtBtcBidMax") & "',AskMessage='" & Request("txtAskMessage") & "',BidMessage='" & Request("txtBidMessage") & "', BuyReserve = " & Request("txtBuyReserve") & " ")
            lblMess.Text = "Updated successfully"

            txtBtcAskMax.Text = ""
            txtBtcAskMin.Text = ""
            txtBtcBidMax.Text = ""
            txtBtcBidMin.Text = ""

            Response.Redirect("StopStartPayments.aspx")

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub

End Class
