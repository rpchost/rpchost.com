
Public Class Fundamental
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

        If IsNothing(Session("UsrName")) = True Then
            Response.Redirect("AccountMember.aspx")
        End If

    End Sub

    Private Sub btnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExit.Click
        Response.Redirect("AccountMember.aspx")
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Write("<script language=javascript>")
        Response.Write("window.close();")
        Response.Write("</script>")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Write("<script language=javascript>")
        Response.Write("window.open('Comments.aspx','','width=900, height=700, menubar=no, resizable=no,left=100,top=10');")
        Response.Write("</script>")
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Write("<script language=javascript>")
        Response.Write("window.open('FundProfit.aspx','','width=500, height=400, menubar=no, resizable=no,left=100,top=10');")
        Response.Write("</script>")
    End Sub



    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
    End Sub

    Private Sub btnTV_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Redirect("forexTV.aspx")
    End Sub

    Private Sub btnBloomberg_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Redirect("bloomberg.aspx")
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Write("<script language=javascript>")
        Response.Write("window.open('fundAlerts.aspx?param=true',target='Fund','','width=1000, height=700, menubar=no,scrollbars=yes, resizable=yes,left=10,top=20');")
        Response.Write("</script>")
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Write("<script language=javascript>")
        Response.Write("window.open('StreamNews.html','','width=700, height=400, menubar=no,scrollbars=yes, resizable=yes,left=198,top=20');")
        Response.Write("</script>")
    End Sub
End Class


