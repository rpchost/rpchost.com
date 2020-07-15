Imports System.Data.OleDb
Imports System.Data


Partial Class FXAS_Platform

    Inherits System.Web.UI.Page



   
    Private Function isMember(ByVal user As String, ByVal pwd As String) As Boolean

        'Dim opExec As New rpchost.cs_Operation
        'Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM MembersForex where ID = " & Trim(txtUsername.Text) & " and Pwd = '" & Trim(txtPwd.Text) & "' ")
        'Try

        '    If reader.HasRows = True Then
        '        Return True
        '    Else
        '        Return False
        '    End If

        'Catch ex As Exception
        '    'Response.Write(ex.Message)
        'Finally
        '    opExec.closeConnection()
        '    Dispose()
        'End Try

    End Function

    Private Function CanDownload(ByVal user As String, ByVal pwd As String) As Boolean

        'Dim opExec As New rpchost.cs_Operation
        'Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Indicator] where UserID = '" & Trim(txtUsername.Text) & "' and Pwd = '" & Trim(txtPwd.Text) & "' ")
        'Try

        '    If reader.HasRows = True Then
        '        Return True
        '    Else
        '        Return False
        '    End If

        'Catch ex As Exception
        '    Response.Write(ex.Message)
        'Finally
        '    opExec.closeConnection()
        '    Dispose()
        'End Try

    End Function


    Private Sub getMemberInfo(ByVal user As String, ByVal pwd As String)

        'Dim opExec As New rpchost.cs_Operation
        'Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Indicator] where UserID = '" & Trim(txtUsername.Text) & "' and Pwd = '" & Trim(txtPwd.Text) & "' ")
        'Try

        '    If reader.HasRows = True Then
        '        reader.Read()

        '        '  lblUser.Text = IIf(IsDBNull(reader("UserID")), "", reader("UserID"))
        '        '  lblPwd.Text = IIf(IsDBNull(reader("Pwd")), "", reader("Pwd"))
        '        '  lblIssueDate.Text = IIf(IsDBNull(reader("DateIssued")), "", reader("DateIssued"))
        '        '  lblExpiryDate.Text = IIf(IsDBNull(reader("DateExpire")), "", reader("DateExpire"))
        '        '  lblMess1.Text = IIf(IsDBNull(reader("Mess")), "", reader("Mess"))

        '    Else

        '    End If

        'Catch ex As Exception
        '    Response.Write(ex.Message)
        'Finally
        '    opExec.closeConnection()
        '    Dispose()
        'End Try

    End Sub


    Protected Sub btnIssue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIssue.Click
      
        'Response.Write("window.open('ViewFeedback.aspx','CustomPopUp','width=500, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")

        Response.Write("<script language=javascript>")
        Response.Write("window.open ('FXCM_cover.aspx', 'CustomPopUp', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+(screen.width-20)+', height='+(screen.height-80)+', top=5, left=5')")
        Response.Write("</script>")


        'If (CanDownload(txtUsername.Text, txtPwd.Text) = False) Then
        '    Dim opExec As New rpchost.cs_Operation
        '    Dim sqlParam As String

        '    sqlParam = "insert into [Indicator] (UserID,Pwd,DateIssued,DateExpire) values ('" & Request("txtUsername") & "','" & Request("txtPwd") & "','" & System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Now)) & "','" & System.String.Format("{0: dd/MM/yyyy}", DateAdd(DateInterval.Day, 3, Now)) & "')"
        '    opExec.ExecuteSql(sqlParam)


        '    Response.ContentType = "zip"
        '    Response.AppendHeader("Content-Disposition", "attachment; filename=JoeChalhoub_FxCrusher.zip")
        '    Response.TransmitFile(Server.MapPath("FXAS.zip"))

        '    lblMess.Text = ""

        '    Response.End()

        'Else


        '    Response.ContentType = "zip"
        '    Response.AppendHeader("Content-Disposition", "attachment; filename=FXAS.zip")
        '    Response.TransmitFile(Server.MapPath("FXAS.zip"))

        '    lblMess.Text = ""

        '    Response.End()

        'End If

          


       

    End Sub

   


    'Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
    '    If (txtFeedback.Text <> "" And CanDownload(Request("txtUserName"), Request("txtpwd"))) Then

    '        Dim opExec As New rpchost.cs_Operation
    '        Dim sqlParam As String

    '        sqlParam = "insert into IndMess (IndicatorMessages,UserID,dtDate) values ('" & Request("txtFeedback") & "','" & Request("txtUserName") & "','" & System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Now)) & "')"
    '        opExec.ExecuteSql(sqlParam)

    '        lblMess.Text = "Feedback sent"
    '        txtFeedback.Text = ""

    '    End If
    '    If (CanDownload(Request("txtUserName"), Request("txtpwd")) = False) Then
    '        lblMess.Text = "You must download JoeChalhoub_FxCrusher indicator first."
    '    End If

    'End Sub

    'Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
    '    Response.Write("<script language=javascript>")
    '    Response.Write("window.open('ViewFeedback.aspx','CustomPopUp','width=500, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
    '    Response.Write("</script>")
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Request.QueryString("userID") <> "" And Request.QueryString("pwd") <> "") Then

              


        End If
    End Sub


End Class
