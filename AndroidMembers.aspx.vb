Imports System.Data.OleDb

Imports rpchost


Partial Class AndroidMembers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [MembersForex] where UsrName <> ''")
        Try

            If reader.HasRows = True Then

                GridView1.DataSource = reader
                GridView1.DataBind()

            End If

        Catch ex As Exception
            Dispose()
            GC.Collect()
            Response.Write(ex.Message)
            Response.Write(ex.InnerException)
        Finally
            opExec.closeConnection()
            Dispose()

        End Try
    End Sub

    Protected Sub LoadData()

        Dim Ds As New rpchost.cs_Operation



        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where usrName = '" & txtAndroidID.Text & "' ")
        Try

            If reader.HasRows = True Then

                While reader.Read()
                    str = str & reader("ID") & "_" & reader("Pwd") & "_" & reader("Firstname") & "_" & reader("Lastname") & "_" & reader("Email") & "_" & IIf(IsDBNull(reader("Country")), "", reader("Country")) & "_" & "_" & IIf(IsDBNull(reader("Level")), "", reader("Level")) & "_" & IIf(IsDBNull(reader("UsrName")), "", reader("UsrName")) & vbCrLf
                    'Response.Write(reader("ID") & "_" & reader("Pwd") & "_" & reader("Firstname") & "_" & reader("Lastname") & "_" & reader("Email") & "_" & reader("Country") & "_" & "_" & reader("Level"))
                End While
                Response.Write(str)


            End If



        Catch ex As Exception
            Response.Write(ex.Message)
            Ds.closeConnection()
            Dispose()
        Finally
            Ds.closeConnection()
            Dispose()
        End Try

    End Sub


    Protected Sub btnADD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnADD.Click

        Dim opExec As New rpchost.cs_Operation

        If (txtAndroidID.Text <> "") Then
            Dim sql As String = "insert into membersforex (Pwd, FirstName, LastName, Email, UsrName, Status, DateLastPayment) values ('" & txtPwd.Text & "','" & txtFirstName.Text & "','" & txtLastName.Text & "','" & txtEmail.Text & "','" & txtAndroidID.Text & "','" & txtStatus.Text & "','" & txtDateLastPayment.Text & "') "
            opExec.ExecuteSql(sql)
        End If

        Response.Redirect("AndroidMembers.aspx")

    End Sub
End Class
