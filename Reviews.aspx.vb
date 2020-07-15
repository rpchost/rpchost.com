Partial Class Reviews
    Inherits System.Web.UI.Page

    Dim InterestRate As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=reviews")
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & rate.btcUsdAsk & "] [Bid " & rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & rate.btcEurAsk & "] [Bid " & rate.btcEurBid & "]"
        End If

        txtDate.Text = Logger.GenerateTimeZone("Eastern Standard Time")
        txtUserID.Text = Session("UserID")
        txtUserName.Text = Session("FirstName") + " " + Session("LastName")

    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (txtReview.Text.Trim = "") Then
            lblMess.Text = "Review must not be empty"
            Return
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Reviews (UserID,UserName,ReviewDate, Moderated, Review) values (" & Session("UserID") & ",'" & Session("FirstName") + " " + Session("LastName") & "','" & txtDate.Text & "','no','" & txtReview.Text & "') ")
        opExec.closeConnection()

        txtReview.Text = ""
        lblMess.Text = "Review added, it will appear soon."

        Logger.GenerateLog("New Review sent; UserID = " & Session("UserID"), Logger.GenerateTimeZone("Middle East Standard Time"), "ReviewsBackend.aspx")


    End Sub

  


End Class
