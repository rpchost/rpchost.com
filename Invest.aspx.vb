Imports System.Data.OleDb

Partial Class Invest
    Inherits System.Web.UI.Page

    Dim Balance As String
    Dim InvestmentDate As DateTime
    Dim InvestedAmount As Integer
    Dim Invested As Boolean
    Dim CurrentMonthNum As Integer
    Dim InvestmentID As Integer
    Dim profit As Integer
    Dim InterestRate As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=invest")
        End If

        ReturnInvestmentData(Session("UserID"))

        Dim rate As New Rate

        InterestRate = rate.GetInterestRate()

        txtMonthlyProfit.Text ="Be your own bank"

        txtBalance.Text = Balance
        txtInvestedAmount.Text = InvestedAmount
        txtInvestmentID.Text = InvestmentID

        UpdateElapsedTime(Session("UserID"))
        AddProfitToBalance(Session("UserID"))

        txtProfit.Text = profit
        txtMonth.Text = CurrentMonthNum


        If (Balance = 0) Then
            btnInvest.Enabled = False
            btnWithdraw.Enabled = False
            btnInvest.CssClass = "INPUTTEXTbtnDisabled"
            btnWithdraw.CssClass = "INPUTTEXTbtnDisabled"
        Else

            If (CurrentMonthNum = 1 Or CurrentMonthNum = 0) Then
                btnWithdraw.Enabled = False
                btnWithdraw.CssClass = "INPUTTEXTbtnDisabled"
            Else
                btnWithdraw.Enabled = True
                btnWithdraw.CssClass = "INPUTTEXTbtn"
            End If

            btnInvest.Enabled = True
            btnInvest.CssClass = "INPUTTEXTbtn"
            'btnWithdraw.CssClass = "INPUTTEXTbtn"
        End If

        AccessDataSource1.SelectCommand = "SELECT * FROM InvestmentDetails where UserId = " & Session("UserID") & " order by InvestmentMonth"

        Try
            grdInvest.DataBind()
        Catch ex As Exception

        End Try


    End Sub

    Protected Sub btnInvest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInvest.Click
        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=invest")
        End If

        If Balance > 0 Then
            If (AddBalanceToInvestment(Session("UserID"))) Then
                Response.Redirect("invest.aspx")
            End If
        End If

    End Sub

    Protected Sub grdInvest_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInvest.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(7).Text = "Withdrawn" Then
                e.Row.Cells(7).ForeColor = System.Drawing.Color.Red
            End If
            If e.Row.Cells(7).Text = "Running" Then
                e.Row.Cells(7).ForeColor = System.Drawing.Color.Blue
            End If
        End If
    End Sub


    Public Function WithdrawProfitFromInvestment(ByVal UserID As Integer) As Boolean

        Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
        Dim dueDate As DateTime = DateTime.Now.AddMonths(1)

        Dim ElapsedDate As Integer = DateDiff(DateInterval.Day, dt, dueDate)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Investment set InvestedAmount = 0 ,profit=0,Balance=0,CurrentMonthNum= " & getInvestmentMonth(Session("UserID")) & "  where UserId = " & Session("UserID"))
        opExec.closeConnection()

        Dim opExec2 As New rpchost.cs_Operation
        opExec2.ExecuteSql("update InvestmentDetails set Status='Withdrawn',PaymentType='" & RdWithdraw.SelectedValue & "',PaymentPhase='In process',WithdrawDate='" & dt.ToString("dd/MM/yyyy HH:mm tt") & "' where UserId = " & Session("UserID") & " and InvestmentMonth = " & getInvestmentMonth(Session("UserID")) - 1)
        opExec2.closeConnection()

        Dim opExec1 As New rpchost.cs_Operation
        opExec1.ExecuteSql("insert into InvestmentDetails (InvestmentMonth,Capital,profit, Rate, Status, UserID,dueDate,ElapsedDays,DateOfInvestment) values (" & getInvestmentMonth(Session("UserID")) & "," & Balance & "," & (Balance - profit) * InterestRate / 100 & "," & InterestRate & ",'Running'," & Session("UserID") & ",'" & dueDate.ToString("dd/MM/yyyy hh:mm tt") & "'," & ElapsedDate & ",'" & dt.ToString("dd'/'MM'/'yyyy HH:mm tt") & "') ")
        opExec1.closeConnection()

        Return True

    End Function


    Public Function AddBalanceToInvestment(ByVal UserID As Integer) As Boolean

        Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
        Dim dueDate As DateTime = DateTime.Now.AddMonths(1)

        Dim ElapsedDate As Integer = DateDiff(DateInterval.Day, dt, dueDate)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Investment set balance=0, InvestedAmount = " & Balance + profit & ",profit=0,CurrentMonthNum=" & getInvestmentMonth(Session("UserID")) & " , invested=true, InvestmentDate = '" & dt.ToString("dd'/'MM'/'yyyy HH:mm tt") & "'  where UserId = " & Session("UserID"))
        opExec.closeConnection()


        Dim opExec2 As New rpchost.cs_Operation
        opExec2.ExecuteSql("update InvestmentDetails set Status = 'Invested' where UserId = " & Session("UserID") & " and InvestmentMonth=" & getInvestmentMonth(Session("UserID")) - 1)
        opExec2.closeConnection()

        Dim opExec1 As New rpchost.cs_Operation
        opExec1.ExecuteSql("insert into InvestmentDetails (InvestmentMonth,Capital, Rate, Status, UserID,dueDate,ElapsedDays,DateOfInvestment) values (" & getInvestmentMonth(Session("UserID")) & "," & profit & "+" & Balance & "," & InterestRate & ",'Running'," & Session("UserID") & ",'" & dueDate.ToString("dd/MM/yyyy hh:mm") & "'," & ElapsedDate & ",'" & dt.ToString("dd'/'MM'/'yyyy HH:mm tt") & "') ")
        opExec1.closeConnection()

        Return True

    End Function


    Public Function UpdateElapsedTime(ByVal UserID As Integer) As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim dt As DateTime = Logger.GenerateTimeZone("Eastern Standard Time")
        Dim ss As String = Convert.ToDateTime("2018/06/01").ToString("dd/MM/yyyy")

        Dim ElapsedDate As Integer = DateDiff(DateInterval.Day, dt, Convert.ToDateTime(ss))

        opExec.ExecuteSql("update InvestmentDetails set ElapsedDays = DATEDIFF('d', '" & Logger.GenerateTimeZone("Eastern Standard Time") & "', Format (duedate, 'dd/MM/yyyy')), Profit=IIf(DATEDIFF('d', Now(), Format (duedate, 'dd/MM/yyyy')) <= 0, Capital*" & InterestRate & "/100, 0),Status=IIf(DATEDIFF('d', Now(), Format (duedate, 'dd/MM/yyyy')) <= 0, 'Completed', 'Running')   where Status = 'Running' and UserId = " & Session("UserID"))
        opExec.closeConnection()

        Return True

    End Function

    Public Function UpdateBalance(ByVal UserID As Integer, ByVal Balance As Integer, ByVal Profit As Integer, ByVal InvestmentMonth As Integer) As Boolean

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Investment set Balance = " & Balance & ",CurrentMonthNum=" & InvestmentMonth & ",Profit=" & Profit & ", InvestedAmount=0 where UserId = " & Session("UserID"))
        opExec.closeConnection()

        'Dim opExec1 As New rpchost.cs_Operation
        'opExec1.ExecuteSql("update InvestmentDetails set Status = 'Invested' where UserId = " & Session("UserID") & " and InvestmentMonth=" & InvestmentMonth)
        'opExec1.closeConnection()

        Return True

    End Function


    Public Function AddProfitToBalance(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InvestmentDetails where UserID = " & Session("UserID") & " order by InvestmentMonth desc ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (reader("ElapsedDays") <= 0) Then
                    UpdateBalance(Session("UserID"), reader("Capital"), reader("Profit"), reader("InvestmentMonth"))
                End If

            End If

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function


    Public Function GetInterestRate() As Integer

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select Rate from Rate")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("Rate")

            Else

                Return 0

            End If

        Catch ex As Exception
            Return 0
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function


    Public Function getInvestmentMonth(ByVal UserID As Integer) As Integer

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InvestmentDetails where UserID = " & Session("UserID") & " order by InvestmentMonth desc ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("InvestmentMonth") + 1

            Else

                Return 1

            End If

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Sub ReturnInvestmentData(ByVal UserID As Integer)

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Investment where UserID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (Not IsDBNull(reader("Balance"))) Then Balance = reader("Balance")
                If (Not IsDBNull(reader("InvestmentDate"))) Then InvestmentDate = reader("InvestmentDate")
                If (Not IsDBNull(reader("InvestedAmount"))) Then InvestedAmount = reader("InvestedAmount")
                If (Not IsDBNull(reader("Invested"))) Then Invested = reader("Invested")
                If (Not IsDBNull(reader("CurrentMonthNum"))) Then CurrentMonthNum = reader("CurrentMonthNum")
                If (Not IsDBNull(reader("ID"))) Then InvestmentID = reader("ID")
                If (Not IsDBNull(reader("profit"))) Then profit = reader("profit")

                lblMess.Text = "Your can withdraw or re-invest your profit at the Due date of each month"

            Else

                Balance = 0
                'lblMess.Text = "You do not have any running investment plan, please create a plan with a <a href=deposit.aspx>DEPOSIT</a>"
                lblMess.Text = "We do not have any plan for now"

            End If

        Catch ex As Exception
            opExec.closeConnection()
        End Try

    End Sub


    Protected Sub btnWithdraw_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWithdraw.Click

        lblWithdrawMess.Text = "Withdrawals will take half hour till 1 day to be deposited in your account"
        tblWithdraw.Visible = True

    End Sub

    Public Function isPerfectMoneyAccountExist(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim res As Boolean = False

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (Not IsDBNull(reader("PerfectMoney")) And reader("PerfectMoney") <> "") Then
                    res = True
                End If

            End If

            Return res

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

    End Function

    Public Function isPayeerAccountExist(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim res As Boolean = False

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (Not IsDBNull(reader("Payeer")) And reader("Payeer") <> "") Then
                    res = True
                End If


            End If

            Return res

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

    End Function


    Public Function isBitcoinAccountExist(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim res As Boolean = False

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & Session("UserID"))
        Try

            If reader.HasRows = True Then

                reader.Read()

                If (Not IsDBNull(reader("BitcoinWallet")) And reader("BitcoinWallet") <> "") Then
                    res = True
                End If

            End If

            Return res

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

    End Function

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=invest")
        End If

        If (RdWithdraw.SelectedValue = "PM") Then
            If (isPerfectMoneyAccountExist(Session("UserID")) = False) Then
                lblWithdrawMess.Text = "You do not have a Perfect Money accout, please go to your <a href=profile.aspx> profile </a> and add it"
                Return
            End If
        ElseIf (RdWithdraw.SelectedValue = "PAYEER") Then
            If (isPayeerAccountExist(Session("UserID")) = False) Then
                lblWithdrawMess.Text = "You do not have a Payeer accout, please go to your <a href=profile.aspx> profile </a> and add it"
                Return
            End If

        ElseIf (RdWithdraw.SelectedValue = "BITCOIN") Then
            If (isBitcoinAccountExist(Session("UserID")) = False) Then
                lblWithdrawMess.Text = "You do not have a Bitcoin accout, please go to your <a href=profile.aspx> profile </a> and add it"
                Return
            End If


        End If

        If (WithdrawProfitFromInvestment(Session("UserID"))) Then
            lblWithdrawMess.Text = ""
            Response.Redirect("invest.aspx")
        End If

      
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=invest")
        End If


        tblWithdraw.Visible = False
        Response.Redirect("invest.aspx")
    End Sub
End Class
