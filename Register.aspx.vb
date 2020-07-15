Imports System.Data.OleDb



Partial Class Register
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

    Dim conn As rpchost.cs_Connection


    Public Shared strFName, strLName, strEmail, strID, strPwd As String


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        conn = New rpchost.cs_Connection
        lblMess.Text = ""

        LoadCountryCodes()

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

    End Sub

    Public Sub LoadCountryCodes()

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select PhoneCode from CountryPhoneCode where PhoneCode <> 0 order by PhoneCode ")
        Try

            Dim ls As New ListItem
            ls.Value = 0
            ls.Text = ""
            ddlCountryCodes.Items.Add(ls)

            If reader.HasRows = True Then
                While reader.Read()
                    ls = New ListItem
                    ls.Value = reader("PhoneCode")
                    ls.Text = reader("PhoneCode")

                    ddlCountryCodes.Items.Add(ls)

                End While
            End If
            ddlCountryCodes.DataBind()

        Catch ex As Exception
            Response.Redirect(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (isEmailExist(txtEmail.Text)) Then
            lblMess.Text = "Email already exist"
            Return
        End If
        If (Not txtEmail.Text.contains("@") Or Not txtEmail.Text.contains(".com")) Then
            lblMess.Text = "Not Valid Email"
            Return
        End If
       

        If (isNameExist(txtFirst.Text.Trim, txtLast.Text.Trim)) Then
            lblMess.Text = "Name already exist"
            Return
        End If

        If (CheckSpecialChar(txtFirst.Text.Trim) = True Or CheckSpecialChar(txtLast.Text.Trim) = True) Then
            lblMess.Text = "Special characters not allowed"
            Return
        End If

        If (txtFirst.Text.Contains("ping") Or txtFirst.Text.Contains("http") Or txtFirst.Text.Contains("local") Or txtFirst.Text.Contains("ftp") Or txtFirst.Text.Contains("file")) Then
            lblMess.Text = "Not Valid First Name"
            Return
        End If

        If (txtLast.Text.Contains("ping") Or txtLast.Text.Contains("http") Or txtLast.Text.Contains("local") Or txtLast.Text.Contains("ftp") Or txtLast.Text.Contains("file")) Then
            lblMess.Text = "Not Valid Last Name"
            Return
        End If

        If (txtFirst.Text.Trim.Contains("cunet") Or txtLast.Text.Trim.Contains("cunet") Or txtFirst.Text.Trim.Contains("jhxb") Or txtLast.Text.Trim.Contains("jhxb") Or txtEmail.Text.Trim.Contains("ample") Or txtEmail.Text.Trim.Contains("tst") Or txtEmail.Text.Contains(" @ ")) Then
            lblMess.Text = "Not allowed"
            Return
        End If

        If (txtPass.Text.Length() < 6) Then
            lblMess.Text = "Password must be at least 6 digits"
            Return
        End If

        If (ddlCountryCodes.SelectedValue = "0") Then
            lblMess.Text = "Please provide your correct phone number; In case you want to buy with your credit card or paypal we will send you a passcode for sms verification"
            Return
        End If

        If (txtPhone.Text.Length() = 0 Or txtPhone.Text.Trim = "" Or txtPhone.Text.Trim = "0") Then
            lblMess.Text = "Please provide your correct phone number; In case you want to buy with your credit card or paypal we will send you a passcode for sms verification"
            Return
        End If


        Dim opExec As New rpchost.cs_Operation
        Try
            Dim sql As String = "insert into membersforex(firstname,lastname,email,country,pwd,isMember,status,UsrName,[Level],RegisterDate,[phone])values('" & Trim(txtFirst.Text) & "','" & Trim(txtLast.Text) & "','" & Trim(txtEmail.Text) & "','" & ddlCountry.SelectedItem.Text & "','" & Trim(txtPass.Text) & "',0,'U','RPCHOST','" & ddlCountry.SelectedValue & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "','" & ddlCountryCodes.SelectedValue & " " & Trim(txtPhone.Text) & " ')"
            Dim strUserID = opExec.ExecuteScalaredSql(sql)

            'lblMess.Text = "Successfully registered <br><br>"
            'lblMess.Text = lblMess.Text & " UserID = " & strUserID & "<br>"
            'lblMess.Text = lblMess.Text & " Password = " & txtPass.text & "<br>"


            Try
                SendNotification.Email("Rpchost.com account registration", "Dear  <b>" & Trim(txtFirst.Text) & " " & Trim(txtLast.Text) & "</b>;  <br>Thank you for registering with Rpchost.com <br><br>Please login to your account with these credentials: <br><br> <b>UserID</b> = " & strUserID & "<br><b>Passwod</b> = " & txtPass.Text & "<br><br><a href=""http://www.rpchost.com/login.aspx?redirect=profile""> Login to your account </a> and finish your profile details <br>   <br><i>Best Regards</i> <br><i>Welcome to Rpchost.com</i> ", txtEmail.Text.Trim)

                'lblMess.Text = lblMess.Text & " Keep your credentials in safe place. <a href=login.aspx>Login</a>"
                lblMess.Text = "Registration successful. We send your credentials to your email, Please check your email."

                Logger.GenerateLog("New user registration; UserID = " & strUserID, Logger.GenerateTimeZone("Middle East Standard Time"), "payeeDetail.aspx?ID=" & strUserID)


            Catch ex As Exception
                lblMess.Text = "Successfully registered <br><br>"
                lblMess.Text = lblMess.Text & " UserID = " & strUserID & "<br>"
                lblMess.Text = lblMess.Text & " Password = " & txtPass.Text & "<br>"
                lblMess.Text = lblMess.Text & " Keep your credentials in safe place. <a href=login.aspx>Login</a>"
            End Try

            txtFirst.Text = ""
            txtLast.Text = ""
            txtEmail.Text = ""
            txtConfirmPass.Text = ""
            txtConfirmEmail.Text = ""
            txtPass.Text = ""
            ddlCountry.SelectedIndex = 0


        Catch ex As Exception
            lblMess.Text = "Error while registration, Please <a href='contact.aspx'>contact our support team</a>"
        Finally
            opExec.closeConnection()
        End Try

    End Sub


    Function CheckSpecialChar(ByVal str As String) As Boolean
        Dim specials() As String = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "|", "^", "$", "~", "€", "{", "}", "[", "]", "~", ".", "/", "\", "&", "%", ";", ":", "@", "*", "<", ">", "?", "!", "+", "-"}
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

    Function IsValidEmailFormat(ByVal s As String) As Boolean
        Try
            Dim a As New System.Net.Mail.MailAddress(s)

            Dim pattern As String = "^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$"

            Dim match As System.Text.RegularExpressions.Match = Regex.Match(s, pattern, RegexOptions.IgnoreCase)
            If (match.Success) Then
                Return True
            Else
                Return False
            End If

        Catch
            Return False
        End Try
        Return True
    End Function

    Public Function isEmailExist(ByVal Email As String) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where Email = '" & Email & "' ")
        Try

            If reader.HasRows = True Then

                Return True

            Else

                Return False

            End If

        Catch ex As Exception
            Response.Write("ERROR")
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Function isNameExist(ByVal FirstName As String, ByVal LastName As String) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where FirstName = '" & FirstName & "' and Lastname = '" & LastName & "'")
        Try

            If reader.HasRows = True Then

                Return True

            Else

                Return False

            End If

        Catch ex As Exception
            Response.Write("ERROR")
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function



    Protected Sub ddlCountryCodes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCountryCodes.SelectedIndexChanged
        If (ddlCountryCodes.SelectedValue <> 0) Then
            txtPhone.Text = ""
            txtPhone.Enabled = True
        Else
            txtPhone.Text = ""
            txtPhone.Enabled = False
        End If
    End Sub
End Class


