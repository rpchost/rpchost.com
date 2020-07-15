Imports System.Data
Imports System.Data.OleDb



Partial Class RegisterAndroid
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
    Dim opExec As rpchost.cs_Operation

    Public Shared strFName, strLName, strEmail, strID, strPwd As String


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        conn = New rpchost.cs_Connection

        txtDeviceID.Text = Request.QueryString("AndroidID")

        LoadData()

    End Sub


    Protected Sub LoadData()

      
        Dim str As String = ""

        Dim arr As String()
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where UsrName = '" & Request.QueryString("AndroidID") & "' ")
        Try

            If reader.HasRows = True Then

                reader.Read()

              
                txtFirst.Text = reader("Firstname")
                txtLast.Text = reader("Lastname")
                txtEmail.Text = reader("Email")
                ddlCountry.SelectedValue = reader("Level")
                txtPass.Text = reader("Pwd")
                arr = Split(reader("City"), "@")
                Try
                    txtCity.Text = arr(0)
                    txtPostal.Text = arr(1)
                Catch ex As Exception
                    txtCity.Text = arr(0)
                    txtPostal.Text = ""
                End Try
               

            End If
            reader.Close()

        Catch ex As Exception
            Response.Write(ex.Message)

            Dispose()
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Sub

    Public Function isAndroidExist(ByVal strAndroidID As String) As Boolean


        Dim Ds As New rpchost.cs_Operation



        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where UsrName = '" & strAndroidID & "' ")
        Try

            If reader.HasRows = True Then

                Return True

            Else

                Return False

            End If



        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            Ds.closeConnection()
            reader.Close()
            Dispose()
        End Try
    End Function

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        Dim sql As String = ""

        Dim opExec As New rpchost.cs_Operation
        If (txtDeviceID.Text <> "" And txtDeviceID.Text <> "-1") Then

            If (isAndroidExist(txtDeviceID.Text)) Then

                sql = "update membersforex set firstname='" & Request("txtFirst") & "',lastname = '" & Request("txtLast") & "',email = '" & Request("txtEmail") & "',country = '" & ddlCountry.SelectedItem.Text & "',[Level] = '" & ddlCountry.SelectedValue & "',pwd = '" & Request("txtPass") & "', city='" & Request("txtCity") & "@" & Request("txtPostal") & "' where UsrName = '" & txtDeviceID.Text & "' "

            Else
                sql = "insert into membersforex(firstname,lastname,email,country,[Level],pwd,status,UsrName, city)values('" & Request("txtFirst") & "','" & Request("txtLast") & "','" & Request("txtEmail") & "','" & ddlCountry.SelectedItem.Text & "','" & ddlCountry.SelectedValue & "','" & Request("txtPass") & "','U','" & Request("txtDeviceID") & "','" & Request("txtCity") & "@" & Request("txtPostal") & "')"


            End If

            Try

                If (ddlCountry.SelectedValue = 0 Or ddlCountry.SelectedValue = -1) Then
                    lblMess.Text = "You must choose country"
                    btnSubmit.Text = "EDIT YOUR DATA"
                ElseIf (InStr(Request("txtEmail"), "@", CompareMethod.Text) = 0) Then
                    lblMess.Text = "Email must be valid"
                    btnSubmit.Text = "EDIT YOUR DATA"
              

                Else

                    'Dim strID = opExec.ExecuteScalaredSql(sql)
                    opExec.ExecuteSql(sql)
                    'If (strID <> "") Then
                    btnSubmit.Text = "DATA ADDED SUCCESSFULLY"
                    lblMess.Text = "DATA ADDED SUCCESSFULLY"

                    'Response.Redirect("RegisterAndroid.aspx?AndroidID=" & txtDeviceID.Text)
                    'End If
                End If



            Catch ex As Exception
                Response.Write(ex.Message)
                opExec.closeConnection()
                Dispose()

            Finally
                opExec.closeConnection()
                Dispose()

            End Try



        End If



       

    End Sub

End Class


