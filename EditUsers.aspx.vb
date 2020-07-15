Imports System.Data.OleDb


Namespace rpchost


Partial Class EditUsers
    Inherits System.Web.UI.Page

    Dim conn As cs_Connection
    Dim opExec As cs_Operation

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


        If IsNothing(Session("usr")) = True Then
            Response.Redirect("loginbackend.aspx")
            End If

            If (Request.QueryString("ID") = Nothing) Then
                Response.Write("<br><br>Provide an ID in the querystring")
                Return
            End If

            If (Page.IsPostBack) Then
                Return
            End If

            opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Request.QueryString("ID"))
            Try
                reader.Read()
                If reader.HasRows = True Then

                    txtStatus.Text = reader("Status")
                    txtLastPayment.Text = IIf(IsDBNull(reader("DateLastPayment")), "", reader("DateLastPayment"))
                    txtDate.Text = IIf(IsDBNull(reader("RegisterDate")), "", reader("RegisterDate"))
                    lblID.Text = reader("ID")
                    txtLevel.Text = IIf(IsDBNull(reader("level")), "", reader("level"))
                    chkSms.checked = reader("smsnotification")

                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            End Try
    End Sub

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim sqlParam As String

        Try

            opExec = New cs_Operation

                sqlParam = "update MembersForex set Status ='" & Request("txtStatus") & "' ,DateLastPayment = '" & Request("txtLastPayment") & "',[level] = '" & Request("txtLevel") & "',smsnotification=" & chkSms.checked & " where ID = " & Request.QueryString("ID")
            opExec.ExecuteSql(sqlParam)

            lblMess.Text = "User Edited"
                'Response.Redirect("Users.aspx")

        Catch ex As Exception
            Response.Write("Error Description \\n" & ex.Message)
            cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
        Finally
            opExec.closeConnection()
        End Try
    End Sub

    Private Sub btnMain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
        Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
            Dim sqlParam As String

            If IsNothing(Session("usr")) = True Then
                Response.Redirect("loginbackend.aspx")
            End If

            If (Request.QueryString("ID") = Nothing) Then
                Response.Write("<br><br>Provide an ID in the querystring")
                Return
            End If

            Try

                opExec = New cs_Operation

                sqlParam = "Delete from MembersForex where ID = " & Request.QueryString("ID")
                opExec.ExecuteSql(sqlParam)

                lblMess.Text = "User Deleted"
                'Response.Redirect("Users.aspx")

            Catch ex As Exception
                Response.Write("Error Description \\n" & ex.Message)
                cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
            Finally
                opExec.closeConnection()
            End Try
        End Sub

    End Class

End Namespace
