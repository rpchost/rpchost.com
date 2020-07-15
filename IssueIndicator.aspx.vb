Imports System.Data.OleDb
Imports System.Data


Partial Class IssueIndicator

    Inherits System.Web.UI.Page


    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click

        If (txtUsername.Text <> "" And txtPwd.Text <> "") Then

            If (isMember(txtUsername.Text, txtPwd.Text)) Then
                lblMess.Text = ""
                Response.Redirect("https://order.shareit.com/product?vendorid=200061227&productid=300769251")

            Else

                lblMess.Text = "You are not registered, please register first so we can track your payment"

            End If

        End If

    End Sub

    Private Function isMember(ByVal user As String, ByVal pwd As String) As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM MembersForex where ID = " & Trim(txtUsername.Text) & " and Pwd = '" & Trim(txtPwd.Text) & "' ")
        Try

            If reader.HasRows = True Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception
            'Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Function

    Private Function CanDownload(ByVal user As String, ByVal pwd As String) As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Indicator] where UserID = '" & Trim(txtUsername.Text) & "' and Pwd = '" & Trim(txtPwd.Text) & "' ")
        Try

            If reader.HasRows = True Then
                Return True
            Else
                Return False
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Function


    Private Sub getMemberInfo(ByVal user As String, ByVal pwd As String)

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Indicator] where UserID = '" & Trim(txtUsername.Text) & "' and Pwd = '" & Trim(txtPwd.Text) & "' ")
        Try

            If reader.HasRows = True Then
                reader.Read()

                ' lblUser.Text = IIf(IsDBNull(reader("UserID")), "", reader("UserID"))
                'lblPwd.Text = IIf(IsDBNull(reader("Pwd")), "", reader("Pwd"))
                'lblIssueDate.Text = IIf(IsDBNull(reader("DateIssued")), "", reader("DateIssued"))
                'lblExpiryDate.Text = IIf(IsDBNull(reader("DateExpire")), "", reader("DateExpire"))
                'lblMess1.Text = IIf(IsDBNull(reader("Mess")), "", reader("Mess"))

            Else

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Sub

    Private Function getEmail(ByVal strUserID As String, ByVal strPwd As String) As String

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [MembersForex] where ID = " & Trim(strUserID) & " and Pwd = '" & Trim(strPwd) & "' ")
        Try

            If reader.HasRows = True Then
                reader.Read()

                Return (reader("Email"))
            Else
                Return ("")
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Function

   

    ' Protected Sub btnRenew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRenew.Click
    'Dim opExec As New rpchost.cs_Operation
    'Dim sqlParam As String

    '   sqlParam = "update [Indicator] set DateIssued = '" & System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Now)) & "' ,DateExpire = '" & System.String.Format("{0: dd/MM/yyyy}", DateAdd(DateInterval.Day, 3, Now)) & "',Mess = '' where UserID = '" & Request("txtUsername") & "' "
    '    opExec.ExecuteSql(sqlParam)
    '    lblMess.Visible = True
    '    lblMess.Text = "You can use JoeChalhoub_FxCrusher another 3 days."

    ' End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("userID") <> "" And Request.QueryString("pwd") <> "") Then
            txtUsername.Text = Request.QueryString("userID")
            txtPwd.Text = Request.QueryString("pwd")

            btnLogin_Click(sender, e)

        End If
    End Sub


End Class
