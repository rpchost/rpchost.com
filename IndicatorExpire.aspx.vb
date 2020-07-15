Imports System.Data.OleDb


Partial Class IndicatorExpire
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        getMemberInfo(Request.QueryString("userID"), Request.QueryString("pwd"))

    End Sub

   

    Private Sub getMemberInfo(ByVal user As String, ByVal pwd As String)

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Indicator] where UserID = '" & Trim(user) & "' and Pwd = '" & Trim(pwd) & "' ")
        Dim Code As String = ""

        Try

            If reader.HasRows = True Then
                reader.Read()
                If (Convert.ToDateTime(Today) <= Convert.ToDateTime(reader("DateExpire"))) Then
                    Code = reader("Code")
                End If

                lblInd.Text = " :: " & IIf(IsDBNull(System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Today))), "", System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Today))) & " -" & IIf(IsDBNull(reader("DateExpire")), "", System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(reader("DateExpire")))) & " - " & IIf(IsDBNull(reader("Mess")), "", reader("Mess")) & " - EUR=" & reader("CodeEUR") & " - GBP=" & reader("CodeGBP") & " - JPY=" & reader("CodeJPY") & " - EURGBP=" & reader("CodeEURGBP") & " - GBPJPY=" & reader("CodeGBPJPY") & " - AUDUSD=" & reader("CodeAUDUSD") & " - EURAUD=" & reader("CodeEURAUD") & " - USDJPY=" & reader("CodeUSDJPY") & " :: "

            Else
                lblInd.Text = " :: You are not a member, to become a member please fill that form go to that URL [www.rpchost.com/Registercontent.aspx] and once you got a userID and password, make the payment by credit card or by wire and we will offer you signals with 3 ways :<br><br> 1 - On web; Rpchost.com control panel <br> 2 - On your Android smartfone by downloading [FXAS Forex signals] application <br> 3 - An EA which we will send you and you can trade your account directly on MT4" & " :: "

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Sub

End Class
