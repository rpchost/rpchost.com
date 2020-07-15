Imports System.Data

'Imports System.Web.Mail
Namespace rpchost

    Partial Class ApprovedOrder
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

            opExec = New cs_Operation

            Try

                If (IsNothing(Session("UserID")) = False) Then

                    Dim sql As String = "update MembersForex set Status = 'P', DateLastPayment='" & Now & "' where ID = " & Session("UserID")

                    opExec.ExecuteSql(sql)
                    Response.Redirect("SendMessage.aspx?mail=" & getMail(Session("userID")) & "&userID=" & Session("userID") & "&pwd=" & getPsw(Trim(Session("UserID"))) & " ")
                    Response.End()
                Else
                    Response.Write("Your payment has been done and you are a memeber of Rpchost.com; The session has been ended at the time we were sending you your UserID and Password. Please check your mail, we will send you an invoice containing your account info, as soon as you agree and reply it to us, we will activate your membership immediatly.")
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                'opExec.closeConnection()
            End Try

        End Sub

        Private Function getPsw(ByVal strUserID As String) As String
            opExec = New cs_Operation
            conn = New cs_Connection
            Dim drLoad As OleDb.OleDbDataReader

            Dim strSql As String
            strSql = "SELECT Pwd,ID FROM MembersForex where ID = " & strUserID

            Try

                drLoad = opExec.rdGetReader(strSql)

                If drLoad.HasRows = True Then
                    drLoad.Read()
                    Return drLoad("Pwd")
                End If

            Catch ex As Exception
                Response.Write("Please retry again")
                cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
            Finally
                opExec.closeConnection()
            End Try

        End Function

        Private Function getMail(ByVal strUserID As String) As String
            opExec = New cs_Operation
            conn = New cs_Connection
            Dim drLoad As OleDb.OleDbDataReader

            Dim strSql As String
            strSql = "SELECT email,ID FROM MembersForex where ID = " & strUserID

            Try

                drLoad = opExec.rdGetReader(strSql)

                If drLoad.HasRows = True Then
                    drLoad.Read()
                    Return drLoad("email")
                End If

            Catch ex As Exception
                Response.Write("Please retry again")
                cs_LogFile.WriteFile("Error Description \\n" + ex.Message + "\\n" + ex.StackTrace)
            Finally
                opExec.closeConnection()
            End Try

        End Function

    End Class

End Namespace
