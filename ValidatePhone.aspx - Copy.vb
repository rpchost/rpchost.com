Imports System.Data.OleDb

Partial Class ValidatePhone
    Inherits System.Web.UI.Page

    Public Shared valRnd As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Request.QueryString("TransID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Transactions")
        End If
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Transactions")
        End If

        lblTransID.Text = "Transaction ID = " & Request.QueryString("TransID")
        lblPhone.Text = Session("Phone")

        If (Page.IsPostBack = False) Then
            CodeSubmit()
        End If

    End Sub

    Private Function getAdminPassCode(ByVal TransID As Integer) As String
        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select AdminPassCode from Payments where ID = " & TransID)
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("AdminPassCode")

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
            Return "-1"
        Finally
            opExec.closeConnection()
        End Try

    End Function


    Protected Sub CodeSubmit()
        'If (Session("UserID") = Nothing) Then
        '    Response.Redirect("Login.aspx?redirect=BuyBitcoin")
        'End If

        ' If (Page.IsPostBack = False) Then

        If (Session("phone").Equals(Nothing) Or Session("phone").Equals("")) Then
            Response.Write("<script>alert('You should provide your phone number in your profile section')</script>")
            Return
        End If

        lblMess.Text = ""

        Dim Generator As System.Random = New System.Random()
        valRnd = Generator.Next(1000, 9000)

        'valRnd = CInt(Int((9000 * Rnd()) + 1000))

        Dim opExec As New rpchost.cs_Operation
        Try
            ' opExec.ExecuteSql("insert into ValidatePhone (UserID,Amount,AmountBTC,Wallet,RandomNumber,dtRandomized,[Currency],[Phone]) values (" & Session("UserID") & "," & Session("AmountUSD") & "," & Session("AmountBTC") & ",'" & Session("Wallet") & "','" & valRnd & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "','" & Session("Currency") & "','" & Session("Phone") & "') ")

            opExec.ExecuteSql("update Payments set AdminPassCode = '" & valRnd & "' where ID=" & Request.QueryString("TransID"))

            Try
                SendNotification.Email("Phone validation requested", "Random Num = " & valRnd & "<br>UserID = " & Session("UserID") & "<br>Phone = " & Session("Phone") & "<br>TransID = " & Request.QueryString("TransID") & "  ")
            Catch ex As Exception
                SendNotification.Email("Phone validation requested ERROR : For TransID=" & Request.QueryString("TransID"), ex.Message)
            End Try

            'btnSubmit.Visible = False
            btnValidate.Visible = True

        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            opExec.closeConnection()


        End Try
        '  End If
    End Sub

    Protected Sub btnValidate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnValidate.Click
        If (Request.QueryString("TransID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Transactions")
        End If

        Try
            If (CInt(txtCode.Text.Trim) = getAdminPassCode(Request.QueryString("TransID").Trim)) Then

                Dim opExec As New rpchost.cs_Operation
                opExec.ExecuteSql("update Payments set ClientPassCode = '" & txtCode.Text.Trim & "', [Status] = 'Process' where ID=" & Request.QueryString("TransID"))
                opExec.closeConnection()

                Response.Redirect("Transactions.aspx")
            Else
                lblMess.Text = "Wrong Code; if you do not provide correct code, after 1 hour the transaction will be refunded"
            End If
        Catch ex As Exception
            lblMess.Text = "Wrong Code; if you do not provide correct code, after 1 hour the transaction will be refunded"
        End Try
    End Sub
End Class
