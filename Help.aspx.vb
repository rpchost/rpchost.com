Namespace rpchost

Partial Class Help
    Inherits System.Web.UI.Page

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
        lblComm.Text = "The first part of this form is a Global Economic Calendar; this calendar contains updated data, it is refreshed every 5 seconds; the second part is a realtime streaming news, it displays economic and currencies news, we release data in it and analyse it, compare it with other news data, we detect conflicts and this analysis lead us to Long and Short trades opportunities . the button Signals contains the news signals which we send 1 to 2 alerts per day concerning the report that will be released the next day; the news signal is as the follow: <br></br> <b>Fundamental Alert 1</b><br><br>Country   &nbsp;&nbsp;&nbsp;	= &nbsp;AUSTRALIA<br> Currency 	&nbsp;&nbsp;&nbsp;=&nbsp;&nbsp;    AUD/USD  <br> News   &nbsp;&nbsp;&nbsp;=&nbsp;&nbsp;   Employment change    <br>  Coming out at &nbsp;&nbsp;&nbsp;  =&nbsp;&nbsp; 9:30 pm New York Time<br> Expectations&nbsp;&nbsp;&nbsp;	= &nbsp;&nbsp; 5K  <br>Impact = High <br> <br>If Rate &nbsp;&nbsp;&nbsp;   <= -10K   &nbsp;&nbsp;   then    Short  AUD/USD <br>If Rate &nbsp;&nbsp;&nbsp;  >= 25K    &nbsp;&nbsp;    then    Long AUD/USD <br><br>We are expecting a move at least 30 pips on the spike if the triggers are hit. <br>-------------------------------------------------------------------------------------------------<br><br> All the user has to do is to be online at 9:30 pm, focus on the economic calendars (first and second part in the box) and the news release box (third part and the form which appears when the user presses the button News), and upon the released data the user will execute his trade. In case the report is a speach or announcement he can access the realtime streaming videos of Bloomberg or Forex TV and the streaming news. The button profit is to display the profit made by fundamental signals for the current month. The button comments is to read the comments of our analysist concerning the signals and the trades. The button News displays a box which displays streaming news, these news are forex, currencies, market data and economic releases, this streaming news is very fast and up to the second released data."
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Write("<script language=javascript>")
        Response.Write("window.close();")
        Response.Write("</script>")
    End Sub
End Class

End Namespace
