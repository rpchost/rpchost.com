Imports System.Data.OleDb
Imports rpchost

Partial Class Deposit_Bitcoin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Bitcoin")
        End If

        Dim rate As New Rate
        txtMonthlyProfit.Text ="Be your own bank"

        lblPlan.Text = Request.QueryString("plan") + " USD"

        If (Request.QueryString("plan").Equals("100")) Then txtBitcoin.Text = getCurrentBTCPlanAmount(101)
        If (Request.QueryString("plan").Equals("500")) Then txtBitcoin.Text = getCurrentBTCPlanAmount(502)

        If (isPaymentInProcess(Session("UserID"))) Then
            btnPaid.Enabled = False
            btnPaid.CssClass = "INPUTTEXTbtnDisabled"
            btnPaid.Text = "In Process ... "
        Else
            btnPaid.Enabled = True
            btnPaid.CssClass = "INPUTTEXTbtn"
        End If


    End Sub


    Protected Function isPaymentInProcess(ByVal UserID As Integer) As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from Payments where PaymentReceived=0 and PaymentMethod='BITCOIN' and UserID=" & UserID)
        Try

            If reader.HasRows = True Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception

            'opExec.closeConnection()
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Function

    Protected Function getCurrentBTCprice() As Double

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()
                Return reader("BTC")


            Else

                Return -1


            End If


        Catch ex As Exception

            'opExec.closeConnection()
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Function


    Protected Function getCurrentBTCPlanAmount(ByVal plan As Integer) As String

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()
                Return String.Format("{0:0.00000000}", plan / reader("BTC"))


            Else

                Return "-1"


            End If


        Catch ex As Exception

            'opExec.closeConnection()
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)

        Finally
            opExec.closeConnection()
            ' reader.Close()
            Dispose()

        End Try

    End Function

    Protected Sub btnPaid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPaid.Click
        If (Request.QueryString("plan") <> 100 And Request.QueryString("plan") <> 500) Or txtBitcoin.Text <= 0 Or txtBitcoin.Text = "" Then
            Return
        End If

        Dim opExec As New rpchost.cs_Operation
        Try

            Dim currBtcPrice As Double = getCurrentBTCprice()
            Dim BtcAmountSent As Double = Convert.ToDouble(txtBitcoin.Text.Trim)


            opExec.ExecuteSql("insert into Payments (UserID,AmountBTC,BUY_Price, dtDatePayment, Plan, PaymentReceived,PaymentMethod,[Currency],AmountBTCtoUSD) values (" & Session("UserID") & "," & BtcAmountSent & "," & currBtcPrice & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "'," & Request.QueryString("plan") & ",0,'BITCOIN','BTC'," & BtcAmountSent * currBtcPrice & ") ")


            Response.Redirect("Deposit_Bitcoin.aspx?plan=" & Request.QueryString("plan"))

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub
End Class
