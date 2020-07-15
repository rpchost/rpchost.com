Imports System.Data.OleDb


Namespace rpchost

    Partial Class Renew
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
            lblMess.Text = ""
            txtUsrName.TabIndex = 10
            txtPsw.TabIndex = 20
            btnLogin.TabIndex = 30
        End Sub

        Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
            Dim intS As String
            Dim sqlSelect As String
            Dim drLoad As OleDbDataReader

            If IsNumeric(txtUsrName.Text) Then

                Try

                    opExec = New cs_Operation
                    conn = New cs_Connection

                    sqlSelect = "SELECT * FROM MembersForex where ID = " & Trim(txtUsrName.Text) & " and Pwd = '" & txtPsw.Text & "' and DateLastPayment is not null "

                    drLoad = opExec.rdGetReader(sqlSelect)

                    If drLoad.HasRows = True Then
                        drLoad.Read()
                        Session.Add("UserID", drLoad("ID"))
                        Response.Redirect("OrderPage.aspx?UserID=" & Trim(txtUsrName.Text))
                    Else
                        lblMess.Text = "Invalid username or password"
                    End If

                Catch ex As Exception
                    Response.Write("Please retry again")
                    cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
                Finally
                    opExec.closeConnection()
                End Try

            Else
                lblMess.Text = "User ID must be numeric"
            End If
        End Sub
    End Class

End Namespace
