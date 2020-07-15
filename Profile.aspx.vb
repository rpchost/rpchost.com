Imports System.Data.OleDb

Partial Class Profile
    Inherits System.Web.UI.Page

    Private passStatus As String
    Private proofStatus As String
    Private isCreditCardExist As Boolean
    Private isCreditCardValid As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=profile")
        End If

        If (Page.IsPostBack = True) Then
            Return
        End If

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

        txtUserID.Text = Session("UserID")

        LoadCountryCodes()

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader

        'Dim ls As ListItem
        'ls = New ListItem
        'ls.Value = ""
        'ls.Text = ""
        'ddlBankCountry.Items.Add(ls)
        'Dim opExec As New rpchost.cs_Operation
        'Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM CountryWithdraw where BankDeposit=yes order by countryName")
        'If reader.HasRows = True Then
        '    While reader.Read()
        '        ls = New ListItem
        '        ls.Value = reader("CountryName")
        '        ls.Text = reader("CountryName")

        '        ddlBankCountry.Items.Add(ls)

        '    End While
        'End If
        'ddlBankCountry.DataBind()
        'ls = Nothing

        'ls = New ListItem
        'ls.Value = ""
        'ls.Text = ""
        'ddlPickUpCountry.Items.Add(ls)
        'opExec = New rpchost.cs_Operation
        'reader = opExec.rdGetReader("SELECT * FROM CountryWithdraw where CashPickUp=yes order by countryName")
        'If reader.HasRows = True Then
        '    While reader.Read()
        '        ls = New ListItem
        '        ls.Value = reader("CountryName")
        '        ls.Text = reader("CountryName")

        '        ddlPickUpCountry.Items.Add(ls)

        '    End While
        'End If
        'ddlPickUpCountry.DataBind()


        opExec = New rpchost.cs_Operation
        reader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (Not IsDBNull(reader("FirstName"))) Then txtFirst.Text = reader("FirstName")
                If (Not IsDBNull(reader("LastName"))) Then txtLast.Text = reader("LastName")
                'CrdName.Text = reader("FirstName") + " " + reader("LastName")
                txtHolder.Text = reader("FirstName") + " " + reader("LastName")
                If (Not IsDBNull(reader("FatherName"))) Then txtFatherName.Text = reader("FatherName")
                If (Not IsDBNull(reader("Email"))) Then txtEmail.Text = reader("Email")
                If (Not IsDBNull(reader("Phone"))) Then txtMobile.Text = reader("Phone")
                If (Not IsDBNull(reader("Pwd"))) Then txtPass.Text = reader("Pwd")
                If (Not IsDBNull(reader("BitcoinWallet"))) Then txtWallet.Text = reader("BitcoinWallet")
                If (Not IsDBNull(reader("Country"))) Then ddlCountry.SelectedValue = reader("Country")

                ' If (Not IsDBNull(reader("BankHolderName"))) Then txtHolder.Text = reader("BankHolderName")
                If (Not IsDBNull(reader("Swift"))) Then txtSwift.Text = reader("Swift")
                If (Not IsDBNull(reader("BankName"))) Then txtBankname.Text = reader("BankName")
                If (Not IsDBNull(reader("IBAN"))) Then txtIBAN.Text = reader("IBAN")
                If (Not IsDBNull(reader("AccountNum"))) Then txtAccountNumber.Text = reader("AccountNum")
                If (Not IsDBNull(reader("BankCountry"))) Then ddlBankCountry.SelectedValue = reader("BankCountry")

                'If (Not IsDBNull(reader("PaypalEmail"))) Then txtPaypalEmail.Text = reader("PaypalEmail")
                'If (Not IsDBNull(reader("CashPickUpCountry"))) Then ddlPickUpCountry.SelectedValue = reader("CashPickUpCountry")

                If (Not IsDBNull(reader("CountryPhoneCode"))) Then ddlCountryCodes.SelectedValue = reader("CountryPhoneCode")


                ' If (Not IsDBNull(reader("VerifyFirst4Digits"))) Then txtFirst4Dig.Text = reader("VerifyFirst4Digits")
                ' If (Not IsDBNull(reader("VerifyLast4Digits"))) Then txtLast4Dig.Text = reader("VerifyLast4Digits")

               
            End If

        Catch ex As Exception
            Response.Redirect(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=profile")
        End If


        If (isEmailExist(Request("txtEmail"))) Then
            Response.Write("<script>alert('Email already exist')</script>")
            Return
        End If
        If (Not Request("txtEmail").Contains("@") Or Not Request("txtEmail").Contains(".com")) Then
            Response.Write("<script>alert('Not valid Email')</script>")
            Return
        End If

        If (CheckSpecialChar(txtFatherName.Text.Trim) = True Or CheckSpecialChar(txtFirst.Text.Trim) = True Or CheckSpecialChar(txtLast.Text.Trim) = True) Then
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

        If (Trim(Request("txtPass")).Length() < 6) Then
            Response.Write("<script>alert('Password must be at least 6 digits')</script>")
            Return
        End If

        If (Trim(Request("txtIBAN")).Length() > 0 And (Trim(Request("txtBankname")).Length() = 0 Or Trim(txtHolder.Text).Length() = 0 Or Trim(Request("txtSwift")).Length() = 0 Or Trim(Request("txtSwift")).Length() = 0)) Then
            Response.Write("<script>alert('You provided the IBAN but the other bank account data are not provided')</script>")
            Return
        End If

        Dim cntry As String = Request("ddlCountry")
        Dim BnkCntry As String = Request("ddlBankCountry")
        Dim CrdCntry As String = Request("ddlCardCountry")

        If (cntry.Equals("Select Country")) Then
            cntry = ddlCountry.SelectedItem.Text
        End If
        If (BnkCntry.Equals("Select Country")) Then
            BnkCntry = ddlBankCountry.SelectedItem.Text
        End If

        If (ddlCountryCodes.SelectedValue <> "0") Then
            If (Not Request("txtMobile").Equals(Nothing)) Then
                Session("phone") = ddlCountryCodes.SelectedValue & "-" & Request("txtMobile").Trim
            End If
        Else
            Session("phone") = ""
            
        End If

        If (ddlCountryCodes.SelectedValue = "0") Then
            Response.Write("<script>alert('You should provide a valid phone number, in case you will pay with your credit card we will send a payment link to your phone for verification')</script>")
            Return
        End If

        If (Request("txtMobile") = Nothing Or Request("txtMobile").Trim = "" Or Request("txtMobile").Trim = "0") Then
            Response.Write("<script>alert('You should provide a valid phone number, in case you will pay with your credit card we will send payment link to your phone for verification')</script>")
            Return
        End If
        If (Request("txtMobile").Trim = "") Then
            Response.Write("<script>alert('You should provide a valid phone number, in case you will pay with your credit card we will send payment link to your phone for verification')</script>")
            Return
        End If

        Dim strVerify As String = ""

        Dim strVerificationMessage As String = "tt"

        Dim opExec As New rpchost.cs_Operation
        Try
            ',VerifyFirst4Digits= '" & Request("txtFirst4Dig").Trim & "',VerifyLast4Digits= '" & Request("txtLast4Dig").Trim & "'
            Dim sql As String = "update membersforex set BitcoinWallet = '" & txtWallet.Text & "', firstname='" & Trim(Request("txtFirst")) & "',lastname='" & Trim(Request("txtLast")) & "',Fathername='" & Trim(Request("txtFatherName")) & "',email='" & Trim(Request("txtEmail")) & "',CountryPhoneCode=" & ddlCountryCodes.SelectedValue & ",Phone='" & Trim(Request("txtMobile")) & "',pwd='" & Trim(Request("txtPass")) & "',country = '" & cntry & "',BankHolderName= '" & Request("txtFirst").Trim & " " & Request("txtLast").Trim & "',Swift= '" & IIf(Request("txtSwift") = Nothing, "", Request("txtSwift")) & "',BankName= '" & IIf(Request("txtBankname") = Nothing, "", Request("txtBankname")) & "',IBAN= '" & IIf(Request("txtIBAN") = Nothing, "", Request("txtIBAN")) & "',AccountNum= '" & IIf(Request("txtAccountNumber") = Nothing, "", Request("txtAccountNumber")) & "',BankCountry= '" & BnkCntry & "',CashPickUpCountry= '" & Request("ddlPickUpCountry") & "',PaypalEmail= '" & Request("txtPaypalEmail") & "' where ID = " & Session("UserID")
            opExec.ExecuteSql(sql)
            opExec.closeConnection()

            Response.Write("<script>alert('Successfully updated')</script>")


        Catch ex As Exception
            lblMess.Text = "Error while registration"
        Finally
            opExec.closeConnection()
        End Try

        Response.Redirect("profile.aspx")

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




    Public Function isEmailExist(ByVal Email As String) As Boolean

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=profile")
        End If

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where Email = '" & Email & "' and ID <> " & Session("UserID"))
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



    Protected Sub ddlBankCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBankCountry.SelectedIndexChanged
        'txtIBAN.Text = ""
        ' txtSwift.Text = ""
        'txtBankname.Text = ""
        txtIBAN.Enabled = True
        txtSwift.Enabled = True
        txtAccountNumber.Enabled = True
        txtBankname.Enabled = True

        If (Request("ddlBankCountry") = "") Then
            txtIBAN.Text = ""
            txtSwift.Text = ""
            txtAccountNumber.Text = ""
            txtBankname.Text = ""
            txtIBAN.Enabled = False
            txtSwift.Enabled = False
            txtAccountNumber.Enabled = False
            txtBankname.Enabled = False
        End If
    End Sub

    Protected Sub ddlCountryCodes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCountryCodes.SelectedIndexChanged
        If (ddlCountryCodes.SelectedValue <> 0) Then
            txtMobile.Text = ""
            txtMobile.Enabled = True
        Else
            txtMobile.Text = ""
            txtMobile.Enabled = False
        End If

    End Sub
End Class
