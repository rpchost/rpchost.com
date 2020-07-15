Imports System.Data.OleDb
Imports rpchost

Partial Class Deposit_Bitcoin_Custom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("UserID")) Then
            Response.Redirect("Login.aspx?redirect=Deposit_Bitcoin_Custom")
        End If

        Dim rate As New Rate
        txtMonthlyProfit.Text = "Be your own bank"

      
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

        Try
            If (Convert.ToDouble(Request("txtBitcoin").Trim) <= 0) Then

                Response.Write("<script>alert('Amount must be positive number')</script>")

                Return
            End If
            If (Request("txtBitcoin").Trim.Equals("")) Then
                Response.Write("<script>alert('Amount must not be empty')</script>")
                Return
            End If

        Catch ex As Exception
            Response.Write("<script>alert('Amount must be valid number')</script>")
            Return
        End Try

        Dim opExec As New rpchost.cs_Operation
        Try

            Dim currBtcPrice As Double = getCurrentBTCprice()
            Dim BtcAmountSent As Double = Convert.ToDouble(txtBitcoin.Text.Trim)


            opExec.ExecuteSql("insert into Payments (UserID,AmountBTC,BUY_Price, dtDatePayment, Plan, PaymentReceived,PaymentMethod,[Currency],AmountBTCtoUSD) values (" & Session("UserID") & "," & BtcAmountSent & "," & currBtcPrice & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "',1000,0,'BITCOIN','BTC'," & BtcAmountSent * currBtcPrice & ") ")


            Response.Redirect("Deposit_Bitcoin.aspx?plan=" & Request.QueryString("plan"))

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub
End Class
