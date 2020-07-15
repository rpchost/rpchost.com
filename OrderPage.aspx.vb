Imports System.Data.OleDb


Partial Class OrderPage
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

    Public strFName, strLName, strEmail, strPwd, strCountry, strCity, strPostalCode, strCountryID As String

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If (Request.QueryString("renew") = "true") Then
            lblmsg.Text = "Your membership has been expired. Renew It<br><br><br>"
        Else
            Dim opExec As New rpchost.cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from membersforex where ID = " & Request.QueryString("UserID"))
            Dim arr As String()


            If reader.HasRows = True Then
                reader.Read()

                strFName = reader("FirstName")
                strLName = reader("LastName")
                strEmail = reader("Email")
                strPwd = reader("Pwd")
                strCountry = reader("country")
                strCountryID = reader("Level")


                arr = Split(reader("City"), "@")
                strCity = Trim(arr(0))
                'strPostalCode = Trim(arr(1))

            End If

            ' lblmsg.Text = "Thank you &nbsp;&nbsp;&nbsp;" & "&nbsp;<span class=greentext>" & strFName & "&nbsp;" & strLName & "</span> <br><br>" & "You have been added successfully. <br><br><br>UserID = <font face=arial color=maroon>" & Request.QueryString("UserID") & " </font> / password = <font face=arial color=maroon>" & strPwd & "</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face=arial color=red>[You can use this UserID and Password to access our <a href='LoginSignals.aspx' >FREE FOREX SIGNAL</a>and after payment you can access the online signals directly to your <a href=login.aspx>CONTROL PANEL</a> and download the <a href='http://play.google.com'>RPCHOST.COM FXAS SYSTEM</a> application to your android smart phone and get instant signals with sound alerts directly to your phone. MONTHLY FEE IS $75 / MONTH</font><br><br> Copy and paste the UserID and Password in a safe place so you can use it to login when your account is activated.<br><br> <br> "
            lblmsg.Text = "Thank you &nbsp;&nbsp;&nbsp;" & "&nbsp;<span class=greentext>" & strFName & "&nbsp;" & strLName & "</span> <br><br>" & "You have been added successfully. <br><br><br>UserID = <font face=arial color=maroon>" & Request.QueryString("UserID") & " </font> / password = <font face=arial color=maroon>" & strPwd & "</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face=arial color=red>  [You can use this UserID and Password to access our <a href='LoginSignals.aspx' >FREE FOREX SIGNAL</a>] <br><br> <br> "
        End If

       


    End Sub

    'Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
    'Response.Write("<script language=javascript>")
    'Response.Write("window.open('https://secure.shareit.com/shareit/checkout.html?PRODUCT[300165730]=1&DELIVERY[300165730]=EML&languageid=1&stylefrom=300165730&backlink=http%3A%2F%2Frpchost.com%2FapprovedOrder.aspx&currencies=all')")
    'Response.Write("</script>")
    'https://secure.shareit.com/shareit/checkout.html?PRODUCT[300576626]=1&ADD[300576626][ANDROIDID]=<%=Request.querystring("AndroidID") %>&COMPANY=<%=Request.querystring("AndroidID") %>&FIRSTNAME=<%=strFName %>&LASTNAME=<%=strLName %>&EMAIL=<%=strEmail %>&EMAIL_CONFIRM=<%=strEmail%>&D_COUNTRY_ID=<%=strCountryID %>&D_CITY=<%=strCountry%>&D_STREET1=<%=strCountry%>&D_CITY=<%=strCity%>&D_POSTALCODE=<%=strPostalCode%>&D_POSTALCODE=10111&PAYMENTTYPE_ID=CCA&languageid=1&js=-1
    ' Response.Redirect("shareit.aspx?userID=" & Request.QueryString("UserID") & "&pwd=" & strPwd & "&FName=" & strFName & "&LName=" & strLName & "&Email=" & strEmail & "&Country=" & strCountry & "&City=" & strCity & "&Postal=" & strPostalCode & "&CountryID=" & strCountryID & "  ")
    ' End Sub
End Class


