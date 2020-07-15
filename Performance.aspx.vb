Imports rpchost
Imports System.Data.OleDb

Partial Class Performance
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

    'Protected WithEvents btnGet As System.Web.UI.WebControls.Button
    'Protected WithEvents DDmonth As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents DDyear As System.Web.UI.WebControls.DropDownList


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub


    Protected Sub DoGet(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Write("<script language=javascript>")
        Response.Write("window.open('PerformanceDetails.aspx?month=" + Request("DDmonth") + "&year=" + Request("DDyear") + "','CustomPopUp','width=1900, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
        Response.Write("</script>")
    End Sub

    'Protected Sub btnGet_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGet.Click
    '  Response.Write("<script language=javascript>")
    ' Response.Write("window.open('FinishedSignals.aspx?year=" & DDyear.SelectedItem.Text & ",month=" + DDmonth.SelectedItem.Text + "','CustomPopUp','width=1900, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
    ' Response.Write("</script>")
    ' End Sub
End Class

