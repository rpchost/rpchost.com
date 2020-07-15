Imports System.Threading

Partial Class OMT
    Inherits System.Web.UI.Page

    Public Shared curr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        txtDepositAmount.Text = Session("AmountUSD") * 1500
      
        curr = "LBP"
        txtUserID.text = Session("UserID")
        lblAmountToPay.Text = curr & " To pay "

        If (Session("TransID") = Nothing) Then
            FName.Visible = False
            LName.Visible = False
            Omtn.Visible = False
            btnSubmit.Visible = False
            lblFName.Visible = False
            lblLName.Visible = False
            lblOmtn.Visible = False
            RequiredFieldValidator1.Visible = False
            RequiredFieldValidator2.Visible = False
            RequiredFieldValidator3.Visible = False
            btnReserve.Visible = True
            lbl1.Visible = True
            lbl2.Visible = False
            lblReserve.Text = "If you reserve the payment, it will be locked by the system for few hours so you can have time to pay with OMT"
        Else
            FName.Visible = True
            LName.Visible = True
            Omtn.Visible = True
            btnSubmit.Visible = True
            lblFName.Visible = True
            lblLName.Visible = True
            lblOmtn.Visible = True
            RequiredFieldValidator1.Visible = True
            RequiredFieldValidator2.Visible = True
            RequiredFieldValidator3.Visible = True
            btnReserve.Visible = False
            lbl1.Visible = False
            lbl2.Visible = True
        End If


    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Dim name As String = FName.Text + " " + LName.Text
        Session("LName") = LName.Text
        Session("OMTN") = Omtn.Text

        Dim opExec As New rpchost.cs_Operation
        Try
            opExec.ExecuteSql("update Payments set SenderName='" & name & "',MTCN='" & Omtn.Text & "',[Status]='Process' where ID= " & Session("TransID"))
            'SendNotification.Email("BUY BTC Payment with OMT paid by you on: " & Logger.GenerateTimeZone("Eastern Standard Time"), "Payment Details : " & vbCrLf & vbCrLf & " UserID = " & Session("UserID") & "<br><br>Best Regards<br>Rpchost.com ", Session("Email"))
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Response.Redirect("Transactions.aspx")
        End Try

    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("BuyBitcoins_CC.aspx?Type=7")
    End Sub

    Protected Sub btnReserve_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReserve.Click
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        End If

        Response.Redirect("ReservePayment.aspx?Type=7")
    End Sub
End Class
