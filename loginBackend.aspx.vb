Imports System.Data.OleDb

Namespace rpchost

    Partial Class loginBackend
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
        End Sub

        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click


            Dim str As String = ""
            Dim opExec As New rpchost.cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Backend where username = '" & Request("txtUsrName") & "' and Password='" & Request("txtPsw") & "' ")
            Try

                If reader.HasRows = True Then
                    reader.Read()
                    Session.Add("USR", reader("UserName"))
                    Response.Redirect("backend/backend.aspx")

                Else

                    lblMess.Text = "Invalid username or password"

                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End Sub
    End Class

End Namespace
