Imports System.Data.OleDb

Partial Class TransactionsHistory
    Inherits System.Web.UI.Page

    Dim Balance As String
    Dim InvestmentDate As DateTime
    Dim InvestedAmount As Integer
    Dim Invested As Boolean
    Dim CurrentMonthNum As Integer
    Dim InvestmentID As Integer
    Dim Profit As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("UserID") = Nothing) Then
            Response.Redirect("Login.aspx?redirect=Transactionshistory")
        End If

        AccessDataSource1.SelectCommand = "Select * from InternalExchangeRequests where UserID=" & Session("UserID")
        grdHistory.DataBind()

        AccessDataSource2.SelectCommand = "Select * from WithdrawalRequests where UserID=" & Session("UserID")
        grdWithdraw.DataBind()

    End Sub



    Public Function RemoveProfitFromInvestment(ByVal UserID As Integer) As Boolean

        Dim dt As DateTime = DateTime.Now
        Dim dueDate As DateTime = DateTime.Now.AddMonths(1)

        Dim ElapsedDate As Integer = DateDiff(DateInterval.Day, dt, dueDate)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Investment set balance=0, InvestedAmount = " & Balance & " ,profit=0, InvestmentDate = '" & dt.ToString("dd'/'MM'/'yyyy HH:mm") & "'  where UserId = " & Session("UserID"))
        opExec.closeConnection()

        Dim opExec1 As New rpchost.cs_Operation
        opExec1.ExecuteSql("insert into InvestmentDetails (InvestmentMonth,Capital,profit, Rate, Status, UserID,dueDate,ElapsedDays,DateOfInvestment,withdrawn) values (" & getInvestmentMonth(Session("UserID")) & "," & Balance - Profit & "," & (Balance - Profit) * 20 / 100 & ",'20%','Running ... '," & Session("UserID") & ",'" & dueDate.ToString("dd'/'MM'/'yyyy hh:mm") & "'," & ElapsedDate & ",'" & dt.ToString("dd'/'MM'/'yyyy HH:mm") & "','Yes') ")
        opExec1.closeConnection()

        Return True

    End Function


    Public Function UpdateElapsedTime(ByVal UserID As Integer) As Boolean

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update InvestmentDetails set ElapsedDays = DATEDIFF('d', Now(), DueDate), Profit=IIf(DATEDIFF('d', Now(), DueDate) <= 0, Capital*20/100, 0),Status=IIf(DATEDIFF('d', Now(), DueDate) <= 0, 'Completed', 'Running ...')   where Status like '%Running%' and UserId = " & Session("UserID"))
        opExec.closeConnection()

        Return True

    End Function

    Public Function UpdateBalance(ByVal UserID As Integer, ByVal Investment As Integer, ByVal InvestmentMonth As Integer, ByVal Profit As Integer) As Boolean

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Investment set Balance = " & Investment & ",Profit = " & Profit & ", InvestedAmount=0 where UserId = " & Session("UserID"))
        opExec.closeConnection()

        Dim opExec1 As New rpchost.cs_Operation
        opExec1.ExecuteSql("update InvestmentDetails set Status = 'Deposited' where UserId = " & Session("UserID") & " and InvestmentMonth=" & InvestmentMonth)
        opExec1.closeConnection()

        Return True

    End Function


    Public Function AddProfitToBalance(ByVal UserID As Integer) As Boolean

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InvestmentDetails where UserID = " & Session("UserID") & " and InvestmentMonth=" & getInvestmentMonth(Session("UserID")) & " ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                UpdateBalance(Session("UserID"), reader("Capital"), reader("InvestmentMonth"), reader("Profit"))

            End If

        Catch ex As Exception
            Return False
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function


    Public Function getInvestmentMonth(ByVal UserID As Integer) As Integer

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from InvestmentDetails where UserID = " & Session("UserID") & " and Status = 'Deposited' order by InvestmentMonth desc ")
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
                If (Not IsDBNull(reader("Profit"))) Then Profit = reader("Profit")
                If (Not IsDBNull(reader("CurrentMonthNum"))) Then CurrentMonthNum = reader("CurrentMonthNum")

                If (Not IsDBNull(reader("ID"))) Then InvestmentID = reader("ID")

            End If

        Catch ex As Exception
            opExec.closeConnection()
        End Try

    End Sub

    'Protected Sub grdHistory_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdHistory.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        If e.Row.Cells(7).Text = "Withdrawn" Then
    '            e.Row.Cells(7).ForeColor = System.Drawing.Color.Red
    '        End If
    '        If e.Row.Cells(7).Text = "Running" Then
    '            e.Row.Cells(7).ForeColor = System.Drawing.Color.Blue
    '        End If
    '    End If
    'End Sub


End Class
