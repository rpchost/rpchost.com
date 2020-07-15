
Imports System.Data.OleDb


Partial Class Login
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

    Protected WithEvents RangeValidator1 As System.Web.UI.WebControls.RangeValidator
    'Protected WithEvents Label5 As System.Web.UI.WebControls.Label

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        lblMess.Text = ""
        txtUsrName.TabIndex = 10
        txtPsw.TabIndex = 20
        btnLogin.TabIndex = 30

        txtPsw.Attributes("value") = ""
        txtPsw.Text = ""

        Dim res As Boolean = Rate.getBTCprices()
        If (res = True) Then
            lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
        End If

        If Not IsPostBack Then
            If ((Not (Request.Cookies("UserID")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
                txtUsrName.Text = Request.Cookies("UserID").Value
                txtPsw.Attributes("value") = Request.Cookies("Password").Value
                txtPsw.Text = Request.Cookies("Password").Value
                chkRememberMe.Checked = True

            Else

                chkRememberMe.Checked = False
                txtUsrName.Text = ""
                txtPsw.Attributes("value") = ""
                txtPsw.Text = ""

            End If
        End If

    End Sub

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click

        Dim sqlSelect As String
        Dim drLoad As OleDbDataReader

        If chkRememberMe.Checked Then
            Response.Cookies("UserID").Expires = DateTime.Now.AddDays(30)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
        Else
            Response.Cookies("UserID").Expires = DateTime.Now.AddDays(-1)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
        End If

        Response.Cookies("UserID").Value = Request("txtUsrName").Trim
        Response.Cookies("Password").Value = Request("txtPsw").Trim


        If IsNumeric(Request("txtUsrName").Trim) Then

            Try

                opExec = New rpchost.cs_Operation
                conn = New rpchost.cs_Connection

                sqlSelect = "SELECT * FROM MembersForex where ID = " & Request("txtUsrName").Trim & " and Pwd = '" & Request("txtPsw").Trim & "' "

                drLoad = opExec.rdGetReader(sqlSelect)

                If drLoad.HasRows = True Then
                    drLoad.Read()

                    Session("userID") = drLoad("ID")
                    Session("FirstName") = drLoad("FirstName")
                    Session("LastName") = drLoad("LastName")
                    Session("Email") = drLoad("Email")

                    If (Not drLoad("phone").Equals(Nothing) And Not drLoad("CountryPhoneCode").Equals(Nothing) And Not drLoad("CountryPhoneCode").Equals("0")) Then
                        Session("Phone") = drLoad("CountryPhoneCode") & "-" & drLoad("phone")
                    Else
                        Session("Phone") = ""
                    End If

                    Dim log As New Logger

                    Session("Verified") = drLoad("verified")

                    log.GenerateLog_Static("New Login instance; Session UserID = " & Session("UserID"), log.GenerateTimeZone_Static("Middle East Standard Time"), "PayeeDetail.aspx?ID=" & Session("UserID"))

                    If (Request.QueryString("redirect") Is Nothing) Then

                        Response.Redirect("default.aspx")

                    Else

                        Response.Redirect(Request.QueryString("redirect") + ".aspx")

                    End If

                Else
                    lblMess.Text = "Invalid username or password"
                    txtPsw.Text = ""
                    txtPsw.Attributes("value") = ""

                End If

            Catch ex As Exception
                Response.Write("Please retry again " & ex.StackTrace.ToString())
            Finally
                opExec.closeConnection()
            End Try

        Else
            lblMess.Text = "User ID must be numeric"
        End If

    End Sub

    Private Sub SetFirstDateLogin(ByVal strID As Integer, ByVal strType As String)

        Dim conn1 As New rpchost.cs_Operation
        Dim strSQL1 As String
        Try

            conn1.openConnection()

            Dim timeZ As New Logger

            If strType = "F" Then
                strSQL1 = "update MembersForex set FirstLoginDate = '" & timeZ.GenerateTimeZon("Middle East Standard Time") & "' where ID = " & CInt(strID)
                conn1.ExecuteSql(strSQL1)
            End If

            If strType = "L" Then
                strSQL1 = "update MembersForex set LastLoginDate = '" & timeZ.GenerateTimeZon("Middle East Standard Time") & "' where ID = " & CInt(strID)
                conn1.ExecuteSql(strSQL1)
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
            Response.Write(ex.StackTrace)
        Finally
            conn1.closeConnection()
        End Try

    End Sub

End Class


