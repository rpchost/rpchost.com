Imports System.Data.OleDb


    Partial Class contact
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


        If (Session("UserID") = Nothing) Then
            'Response.Redirect("Login.aspx?redirect=contact")

            txtUserID.Text = "0"
            txtFirst.Enabled = True
            txtLast.Enabled = True
            txtEmail.Enabled = True
        Else

            txtUserID.Text = Session("UserID")
            txtFirst.Text = Session("FirstName")
            txtLast.Text = Session("LastName")
            txtEmail.Text = Session("Email")

            AccessDataSource1.SelectCommand = "SELECT * FROM ContactDetails where UserId = " & Session("UserID") & " order by ID desc"
            grdContact.DataBind()

        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub

    Function CheckSpecialChar(ByVal str As String) As Boolean
        Dim specials() As String = {"|", "^", "€", "$", "{", "}", "[", "]", "~", "/", "\", "&", "%", ";", ":", "@", "*", "<", ">", "?", "!", "+", "-", "_", "="}
        Dim count As Integer = 0
        Dim found As Boolean = False
        Dim i As Integer = 0

        For Each c As String In specials
            If str.Contains(c) Then
                found = True
                Exit For
            End If
        Next

        Return found
    End Function


        Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (txtComment.Text.Trim.Equals("")) Then
            lblMess.Text = "Feedback Empty; please write something"
            Return
        End If

        If (CheckSpecialChar(txtComment.Text.Trim)) Then
            lblMess.Text = "Special characters not allowed"
            Return
        End If

        If (CheckSpecialChar(txtFirst.Text.Trim) Or CheckSpecialChar(txtLast.Text.Trim)) Then
            lblMess.Text = "Special characters not allowed"
            Return
        End If

        If (txtFirst.Text.Trim.Contains("cunet") Or txtLast.Text.Trim.Contains("cunet") Or txtFirst.Text.Trim.Contains("jhxb") Or txtLast.Text.Trim.Contains("jhxb") Or txtEmail.Text.Trim.Contains("ample") Or txtEmail.Text.Trim.Contains("tst")) Then
            lblMess.Text = "Not allowed"
            Return
        End If


        If (txtComment.Text.Contains("http") Or txtComment.Text.Contains("ftp") Or txtComment.Text.Contains("ping") Or txtComment.Text.Contains("tcp")) Then
            lblMess.Text = "Invalid content"
            Return
        End If


        Dim opExec = New rpchost.cs_Operation

        Try
            Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")

            Dim strComment As String
            strComment = txtComment.Text

            strComment = strComment.Replace("'", "''")

            Dim sql As String = "insert into ContactDetails(UserID,DateSent,firstname,lastname,email,Feedback)values(" & Trim(txtUserID.Text) & ",'" & dt.ToString("dd'/'MM'/'yyyy HH:mm") & "','" & Trim(txtFirst.Text) & "','" & Trim(txtLast.Text) & "','" & Trim(txtEmail.Text) & "','" & strComment & "')"

            Try
                SendNotification.Email("New Contact sent by USerID = " & Trim(txtUserID.Text) & " on : " & DateTime.Now.AddHours(9).ToString("dd'/'MM'/'yyyy HH:mm"), " FeedBack/Question :  " & txtComment.Text)
            Catch ex As Exception
            End Try

            opExec.ExecuteSql(sql)
            lblMess.Text = "Thank you. Message sent, we will reply very soon"

            Logger.GenerateLog("New Contact information sent; UserID = " & Trim(txtUserID.Text), Logger.GenerateTimeZone("Middle East Standard Time"), "ContactForm.aspx")

            If (Session("UserID") <> Nothing) Then

                Response.Redirect("contact.aspx")

            Else
                txtComment.Text = ""
                txtFirst.Text = ""
                txtLast.Text = ""
                txtEmail.Text = ""
            End If

        Catch ex As Exception

            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    End Class


