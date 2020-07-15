Imports System.Data.OleDb

Partial Class ThankYou
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=ThankYou")
        End If

        Dim rate As New Rate
        Dim InterestRate As Integer
        InterestRate = rate.GetInterestRate()

        txtMonthlyProfit.Text = "Be your own bank"


        If (Request.QueryString("Plan") = "100") Then
            lblMess.Text = "Thank you for purshasing Rpchost.com Statrter Plan Lending program <br> We are in the process of setting your account [10 minutes - 2 hours] <br><br> Please Check your <a href=invest.aspx>Investment / Withdraw</a> section in the coming few [minutes - hours]"



        End If

    End Sub




End Class
