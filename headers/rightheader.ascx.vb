Imports System.Data.OleDb


Partial Class rightheader
    Inherits System.Web.UI.UserControl

    Protected dlNews As DataList
    Protected WithEvents LNews As System.Web.UI.HtmlControls.HtmlGenericControl
    'Public strconn As String = "Data Source=rpchost.db.11465240.hostedresource.com; Initial Catalog=rpchost; User ID=rpchost; Password='Jijo1136!';"


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub


    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'Dim dt As DateTime = DateTime.Now
        'lblTime.Text = DateTime.Now.ToString("dd/MM/yyy hh:mm:ss") + " <br> New York Time [GMT-5]"

        If (Session("UserID") = Nothing) Then
            lblSession.Text = ""
        Else
            lblSession.Text = "Welcome " & Session("FirstName")
        End If

        If (Session("Verified")) Then
            imgVer.Visible = True
        Else
            imgVer.Visible = False
        End If

        'lblTime.Text = DateTime.Now.ToString("dd/MM/yyy hh:mm:ss") + " <br> New York Time [GMT-5]"
        lblDateTime.Text = Logger.GenerateTimeZon("Eastern Standard Time") & "<br>Eastern Standard Time"
        Dim totInvest As New Rate
        lblTotalInvestments.Text = totInvest.GetTotalInvestmenst()

        'Dim res As Boolean = Rate.getBTCprices()
        'If (res = True) Then
        '    lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] <br> BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        'End If

    End Sub

    'Private Sub TimerTime_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs)
    '    lblTime.Text = DateTime.Now.ToString("dd/MM/yyy hh:mm:ss") + " <br> New York Time [GMT-5]"
    'End Sub

End Class


