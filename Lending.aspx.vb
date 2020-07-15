Imports System.Data.OleDb

Partial Class Lending
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim opExec As New rpchost.cs_Operation
        Try
            Dim ContractID As Integer = opExec.ExecuteScalaredSql("insert into Lending (UserID,LendingValue,Curr,MinimumReturningVal,[Status],WalletAddress) values (" & Session("UserID") & ",'" & txtBtcLend.Text & "','BTC','" & txtProfit.Text & "','Pending','" & txtAddress.Text & "')")
            SendNotification.Email("Rpchost.com; New Contract Created", "Contract Details : " & vbCrLf & vbCrLf & " UserID = " & Session("UserID") & " Contract ID = " & ContractID & " <br><br> Contract target is reached after 1 week, but it can sometimes take maximum 20 days<br> The contract will stay in Pending mode until the bitcoin arrive to Rpchost wallet after then it will be in Process mode<br> Once the contract is finished we will send your bitcoin+profit back to your wallet address and the status of the contract will be finished <br> Your profit may vary between 1.5% and 3% depending on network difficulties and miner fees, most of times your contract will hit 3% profit<br> Please be sure to send to Rpchost.com bitcoin wallet the exact amount of bitcoin you reserved in your contract <br><br>  Best Regards<br>Rpchost.com ", Session("Email"))
            Dim timeZ As New Logger


            timeZ.GenerateLog_Static("New Lending contract requested; Contract ID = " & ContractID, timeZ.GenerateTimeZone_Static("Middle East Standard Time"), "LendingManagement.aspx")

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Response.Redirect("Lending.aspx")
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=lending")
        Else
            txtUserID.Text = Session("UserID")
            txtFullName.Text = Session("FirstName") + " " + Session("LastName")
            AccessDataSource1.SelectCommand = "SELECT * FROM Lending where UserId = " & Session("UserID") & " order by ID desc"
            grdContract.DataBind()

            Dim res As Boolean = Rate.getBTCprices()
            If (res = True) Then
                lblBTC.Text = "BTC/USD [Ask " & Rate.btcUsdAsk & "] [Bid " & Rate.btcUsdBid & "] &nbsp;&nbsp;&nbsp; BTC/EUR [Ask " & Rate.btcEurAsk & "] [Bid " & Rate.btcEurBid & "]"
            End If

        End If

        If (isLendingActive()) Then
            btnSubmit.Enabled = True
        Else
            btnSubmit.Enabled = False
        End If

        If (Page.IsPostBack = False) Then
            Dim row As Object
            For Each row In grdContract.Rows
                If Not DirectCast(row.FindControl("Status"), Label).Text.Equals("Pending") Then
                    DirectCast(row.FindControl("Button1"), Button).Visible = False
                End If
            Next
        End If

    End Sub

    Private Function isLendingActive() As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select ActivateLending from Prices")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return IIf(IsDBNull(reader("ActivateLending")) Or reader("ActivateLending") = False, False, True)
               

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent,  _
                                            GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Dim ID = DirectCast(grdContract.Rows(index).FindControl("ID"), Label).Text
        Dim Status = DirectCast(grdContract.Rows(index).FindControl("Status"), Label).Text

        If (Status = "Pending") Then

            Dim opExec As New rpchost.cs_Operation
            Try
                opExec.ExecuteSql("update Lending set [Status]='Canceled' where ID=" & ID & " and [Status] = 'Pending' ")
                SendNotification.Email("Contract Canceled", "Contract Details : " & vbCrLf & vbCrLf & " UserID = " & Session("UserID") & " Contract ID = " & ID & "<br><br>Best Regards<br>Rpchost.com ", Session("Email"))
            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
                Response.Redirect("Lending.aspx")
            End Try

        End If

    End Sub

    Protected Sub txtBtcLend_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBtcLend.TextChanged
        If (IsNumeric(txtBtcLend.Text)) Then

            If (CDbl(txtBtcLend.Text) < 0.0067 Or CDbl(txtBtcLend.Text) > 0.014) Then
                Response.Write("<script>alert('Your lending bitcoin amount should be between 0.0067 and 0.014')</script>")
                txtBtcLend.Text = ""
                txtProfit.Text = ""
                txtAddress.Text = ""

            Else
                txtProfit.Text = CDbl(txtBtcLend.Text) + (CDbl(txtBtcLend.Text) * 1 / 100)
            End If
        Else

            Response.Write("<script>alert('Your lending bitcoin amount should be numeric')</script>")
            Response.Redirect("Lending.aspx")

        End If
    End Sub


    Protected Sub grdContract_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdContract.Load

        Dim row As Object

        Dim stat As String

        For Each row In grdContract.Rows

            Try
                stat = DirectCast(row.FindControl("Status"), Label).Text
            Catch ex As Exception
                stat = DirectCast(row.FindControl("Status"), TextBox).Text
            End Try


            If (stat = "Finished") Then
                Try
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Green
                Catch ex As Exception
                    DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Green
                End Try


            End If

            If (stat = "Process") Then
                Try
                    DirectCast(row.FindControl("Status"), Label).ForeColor = Drawing.Color.Red
                Catch ex As Exception
                    DirectCast(row.FindControl("Status"), TextBox).ForeColor = Drawing.Color.Red
                End Try


            End If


        Next

    End Sub


End Class
