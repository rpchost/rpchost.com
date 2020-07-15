Imports System.Data.OleDb

Partial Class PayeeDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Request.QueryString("ID"))
        Try

            lblUserID.Text = Request.QueryString("ID")

            If reader.HasRows = True Then

                reader.Read()

                txtFirst.Text = IIf(IsDBNull(reader("Firstname")), 0, reader("Firstname"))
                txtLast.Text = IIf(IsDBNull(reader("Lastname")), 0, reader("Lastname"))
                txtEmail.Text = IIf(IsDBNull(reader("Email")), 0, reader("Email"))
                txtCountry.Text = IIf(IsDBNull(reader("country")), 0, reader("country"))
                txtPhone.Text = IIf(IsDBNull(reader("phone")), 0, reader("phone"))
                txtPhoneCode.Text = IIf(IsDBNull(reader("CountryPhoneCode")), 0, reader("CountryPhoneCode"))
                txtPass.Text = IIf(IsDBNull(reader("Pwd")), 0, reader("Pwd"))
                txtRegisterDate.Text = IIf(IsDBNull(reader("RegisterDate")), 0, reader("RegisterDate"))
                txtWallet.Text = IIf(IsDBNull(reader("BitcoinWallet")), 0, reader("BitcoinWallet"))

                txtBankName.Text = IIf(IsDBNull(reader("BankName")), 0, reader("BankName"))
                txtIBAN.Text = IIf(IsDBNull(reader("IBAN")), 0, reader("IBAN"))
                txtBankAddress.Text = IIf(IsDBNull(reader("BankAddress")), 0, reader("BankAddress"))
                txtBankCountry.Text = IIf(IsDBNull(reader("BankCountry")), 0, reader("BankCountry"))
                txtSwift.Text = IIf(IsDBNull(reader("Swift")), 0, reader("Swift"))
                txtBankHolderName.Text = IIf(IsDBNull(reader("BankHolderName")), 0, reader("BankHolderName"))
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Sub


    Protected Sub btnVerification_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVerification.Click
        Response.Redirect("AccontVerificationBackend.aspx")
    End Sub
End Class
