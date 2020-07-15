Imports System.Data.OleDb


Partial Class headerbutton
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

        If (Session("UserID") = Nothing) Then
            imgLogin.ImageUrl = "~/html/index/login.gif"
        Else
            imgLogin.ImageUrl = "~/html/index/logout.gif"
        End If

        lblNews.Text = ReadMarquee()
       

    End Sub

    Protected Sub imgLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgLogin.Click
        If (Session("UserID") <> Nothing) Then

            Logger.GenerateLog("Logout instance; Session UserID = " & Session("UserID"), Logger.GenerateTimeZon("Middle East Standard Time"), "PayeeDetail.aspx?ID=" & Session("UserID"))

            Session("UserID") = Nothing
            Session("FirstName") = ""
            Session("LastName") = ""
            Session("Email") = ""

            Response.Redirect("~/Login.aspx")

        Else
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Function ReadMarquee() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from News")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return "<u><b>Latest News </b></u>: " & reader("Description")

            Else

                Return ""

            End If

        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

End Class


