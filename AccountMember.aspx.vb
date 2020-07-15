Namespace rpchost

Partial Class AccountMember
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

    Dim conn As cs_Connection
    Dim opExec As cs_Operation

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If IsNothing(Session("UsrName")) = True Or Session("UsrName") = "" Then
            AlertBtn_Click("End Session")
            Response.Redirect("RequireRegistration.aspx")
        End If

        lblMem.Text = "Welcome " & Session("UsrName") & " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Days Left = " & 31 - CInt(Session("nbDays")) & "]"
        txtDate.Text = Now

    End Sub

    Public Sub AlertBtn_Click(ByVal msg As String)

        Dim message As String = msg
        Dim alertScript As String
        alertScript = "<script language=JavaScript>"
        alertScript += "alert('" + message + "');window.close();"
        alertScript += "</script" + ">"

        If (IsClientScriptBlockRegistered("alert") = False) Then
            Me.RegisterClientScriptBlock("alert", alertScript)
        End If

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Write("<script language=javascript>")
        Response.Write("window.open('Fundamental.aspx','CustomPopUp','width=1900, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
        Response.Write("</script>")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Write("<script language=javascript>")
        Response.Write("window.close();")
        Response.Write("</script>")
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Response.Write("<script language=javascript>")
        Response.Write("window.open('signals.aspx','CustomPopUp','width=1900, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
        Response.Write("</script>")

    End Sub
End Class

End Namespace
