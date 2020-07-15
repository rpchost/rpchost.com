Imports System.Data.OleDb

Partial Class ReserveOffer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=transactions")
        End If

        Dim paymentMethod = "PAYPAL/CREDITCARD"
        Dim opExec As New rpchost.cs_Operation
        Dim rDate As String = Logger.GenerateTimeZone("Eastern Standard Time")

        Dim rr As New Rate
        'Dim Amount As Double = Session("AmountUSD")

        Try
            opExec.ExecuteSql("update Offers set status = 'Paid' where ID = " & Session("OfferID"))

            Try
                SendNotification.Email("BUY BTC Offer was paid Successfully on: " & rDate, "Payment Details : <br><br> UserID = " & Session("UserID") & "<br>Offer ID = " & Session("OfferID") & "<br>Price = " & Session("Price") & "<br>Currency = " & Session("Currency") & "<br>BTC Amount = " & Session("Amount") & "<br>Transaction status : PAID<br><br>Thank you for purchasing with Rpchost.com", Session("Email"))
            Catch ex As Exception
            End Try

        Catch ex As Exception
            Response.Write(ex.Message)
            SendNotification.Email("Offer reserve did not Reserved Successfully. Check the insert into Payments SQL", "Payment Details : " & vbCrLf & " UserID = " & Session("UserID") & " " & vbCrLf & " Offer ID = " & Session("OfferID") & " " & vbCrLf & " Error Details " & ex.Message)

        Finally
            opExec.closeConnection()

            Response.Redirect("Transactions.aspx")
        End Try
    End Sub

End Class
