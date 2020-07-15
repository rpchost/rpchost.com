
Partial Class OpenSignal
    Inherits System.Web.UI.Page


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


        Response.Write("<script language=javascript>")
        Response.Write("window.open('Synchronize.aspx')")
        Response.Write("</script>")

        'If (Request.QueryString("query") = "I") Then
        '    Response.Write("<script language=javascript>")
        '    Response.Write("window.open('createSignal.aspx?query=I&status=T&signalopen=" & Now & "&signalclose=" & Now & "&signal=" & Request.QueryString("signal") & "&Rate=" & Request.QueryString("Rate") & "&SL=" & Request.QueryString("SL") & "&Target=" & Request.QueryString("Target") & "&Type=" & Request.QueryString("Type") & "&Symbol=" & Request.QueryString("Symbol") & "&amount=" & Request.QueryString("amount") & "&Profit=" & Request.QueryString("profit") & "') ")
        '    Response.Write("</script>")
        'End If
        'If (Request.QueryString("query") = "U") Then

        '    Response.Write("<script language=javascript>")
        '    Response.Write("window.open('createSignal.aspx?query=U&type=" & Request.QueryString("type") & "&curr=" & Request.QueryString("curr") & " ') ")
        '    Response.Write("</script>")


        'End If
        'If (Request.QueryString("query") = "D") Then
        '    Response.Write("<script language=javascript>")
        '    Response.Write("window.open('createSignal.aspx?query=D') ")
        '    Response.Write("</script>")
        'End If
        

    End Sub


End Class
