
Partial Class RecalculateProfitCalculator
    Inherits System.Web.UI.Page

    Protected Sub btnRecalculate100_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRecalculate100.Click

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("delete from profitcalculator where plan=100")
        opExec.closeConnection()

        Dim rate As New Rate
        Dim interest As Integer

        interest = rate.GetInterestRate()


        Dim month As Integer = 1
        Dim amount As Integer = 100
        Dim investment As Integer = 0

        While month <= 12

            investment = amount + (amount * interest) / 100
            opExec.ExecuteSql("insert into profitcalculator (Plan,Amount,MonthProfit,interestRate,Investment) values (100," & amount & "," & month & "," & interest & "," & investment & ")")
            opExec.closeConnection()
            amount = investment

            month = month + 1
        End While

        grdStarterPlan.DataBind()

    End Sub

    Protected Sub btnRecalculateProPlan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRecalculateProPlan.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("delete from profitcalculator where plan=500")
        opExec.closeConnection()

        Dim rate As New Rate
        Dim interest As Integer

        interest = rate.GetInterestRate()


        Dim month As Integer = 1
        Dim amount As Integer = 500
        Dim investment As Integer = 0

        While month <= 12

            investment = amount + (amount * interest) / 100
            opExec.ExecuteSql("insert into profitcalculator (Plan,Amount,MonthProfit,interestRate,Investment) values (500," & amount & "," & month & "," & interest & "," & investment & ")")
            opExec.closeConnection()
            amount = investment

            month = month + 1
        End While

        grdProPlan.DataBind()
    End Sub
End Class
