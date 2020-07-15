Imports System.Data.OleDb


Partial Class OrderPageAndroid
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        LoadData()


    End Sub


    Protected Sub LoadData()

        Dim Ds As New rpchost.cs_Operation
        Dim arr As String()
        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from membersforex where UsrName = '" & Request.QueryString("AndroidID") & "' ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                lblUserID.Text = reader("ID")
                lblPwd.Text = reader("Pwd")
                lblFName.Text = reader("Firstname")
                lblLName.Text = reader("Lastname")
                lblEmail.Text = reader("Email")
                lblCountry.Text = reader("Country")
                lblCountryID.Text = IIf(IsDBNull(reader("Level")), "", reader("Level"))
                arr = Split(reader("City"), "@")
                lblCity.Text = arr(0)
                lblPostalCode.Text = arr(1)

                'lblDeviceID.Text = Request.QueryString("AndroidID")
            End If

            reader.Close()


        Catch ex As Exception
            Response.Write(ex.Message)
            opExec.closeConnection()
            Dispose()
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Sub



    'Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
    '    Response.Redirect("RegisterAndroid.aspx")
    'End Sub

    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
    '    Response.Redirect("https://secure.shareit.com/shareit/checkout.html?PRODUCT[300576626]=1&COMPANY=" & lblDeviceID.Text & "&FIRSTNAME=" & lblFName.Text & "&LASTNAME=" & lblLName.Text & "&EMAIL=" & lblEmail.Text & "&EMAIL_CONFIRM=" & lblEmail.Text & "&D_COUNTRY_ID=" & lblCountryID.Text & "&D_CITY=" & lblCountry.Text & "&D_STREET1=" & lblCountry.Text & "&D_POSTALCODE=10111&languageid=1&js=-1")
    'End Sub
End Class
