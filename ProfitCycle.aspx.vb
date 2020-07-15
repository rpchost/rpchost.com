
Partial Class ProfitCycle
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation


        opExec.ExecuteSql("insert into ProfitCycle (CycleName,CyclePeriodBeg,CyclePeriodEnd,BeginAmount,EndAmount,Profit) values ('" & txtCycleName.Text & "','" & txtCyclePeriodBeg.Text & "', '" & IIf(txtCyclePeriodEnd.Text = "", 0, txtCyclePeriodEnd.Text) & "', " & IIf(txtBeginAmount.Text = "", 0, txtBeginAmount.Text) & ", '" & IIf(txtEndAmount.Text = "", 0, txtEndAmount.Text) & "','" & IIf(txtProfit.Text = "", 0, txtProfit.Text) & "') ")
        opExec.closeConnection()

        Response.Redirect("ProfitCycle.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub


    Protected Sub grdCycle_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdCycle.RowUpdating
        Dim ID As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim CycleName As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("CycleName"), TextBox).Text
        Dim CyclePeriodBeg As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("CyclePeriodBeg"), TextBox).Text
        Dim CyclePeriodEnd As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("CyclePeriodEnd"), TextBox).Text
        Dim BeginAmount As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("BeginAmount"), TextBox).Text
        Dim EndAmount As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("EndAmount"), TextBox).Text
        Dim Profit As String = DirectCast(grdCycle.Rows(e.RowIndex).FindControl("Profit"), TextBox).Text

        Dim dblBeginAmount As Double = IIf(BeginAmount = "", 0, Convert.ToDouble(BeginAmount))
        Dim dblEndAmount As Double = IIf(EndAmount = "", 0, Convert.ToDouble(EndAmount))
        Dim dblProfit As Double = IIf(Profit = "", 0, Convert.ToDouble(Profit))

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update ProfitCycle set CycleName= '" & CycleName & "' , CyclePeriodBeg='" & CyclePeriodBeg & "',CyclePeriodEnd='" & CyclePeriodEnd & "',BeginAmount= " & dblBeginAmount & ",EndAmount= " & dblEndAmount & ",Profit = " & dblProfit & "  where ID = " & ID)
        opExec.closeConnection()

    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub
End Class
