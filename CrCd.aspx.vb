Imports System.Threading

Partial Class CrCd
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If


        txtDepositAmount.Text = Session("AmountUSD")
        txtBtcAmount.Text = Session("AmountBTC")
        txtBtcAddress.Text = Session("Wallet")
        'txtEmail.Text = Session("Email")
        curr = Session("Currency")
        txtUserID.text = Session("UserID")
        lblAmountToPay.Text = curr & " To pay "

        'lblUSerID.Text = Session("UserID")
        'lblAmount.Text = Session("AmountUSD") + " " + curr
        'lblAmountBtc.Text = Session("AmountBTC")
        'lblWallet.Text = Session("Wallet")

        'lblPyToRpc.Text = lblAmount.Text

      
    End Sub



    '  Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

    'If (Session("UserID") = Nothing) Then
    '    Response.Redirect("Login.aspx?redirect=BuyBitcoin")
    'End If


    'Dim opExec As New rpchost.cs_Operation
    'Try
    '    opExec.ExecuteSql("insert into Payments (UserID,[UserEmail],AmountUSD, AmountBTC,dtDatePayment, BtcAddress,[Status],PaymentMethod,BUY_Price) values (" & Session("UserID") & ",'" & Session("Email") & "'," & Session("AmountUSD") & "," & Session("AmountBTC") & ",'" & Logger.GenerateTimeZone("Eastern Standard Time") & "','" & Session("Wallet") & "','Pending','INVOICE'," & Session("BTCBuyPrice") & ") ")

    'Catch ex As Exception
    '    Response.Write(ex.Message)
    'Finally
    '    opExec.closeConnection()
    'End Try


    'Response.Redirect("Transactions.aspx")
    ' End Sub




    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Response.Redirect("BuyBitcoins_CC.aspx?Type=1")
    'End Sub
End Class
