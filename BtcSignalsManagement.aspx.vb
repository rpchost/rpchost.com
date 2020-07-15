Imports rpchost
Imports System.Data.OleDb

Partial Class BtcSignalsManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub

    Protected Sub grdSignals_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdSignals.RowUpdating

        Dim ID As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim CryptoCurr As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("CryptoCurr"), TextBox).Text
        Dim Trend As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("Trend"), TextBox).Text
        Dim EntryPrice As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("EntryPrice"), TextBox).Text
        Dim TrendBeginDate As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("TrendBeginDate"), TextBox).Text
        Dim TrendEndDate As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("TrendEndDate"), TextBox).Text
        Dim ClosePrice As String = DirectCast(grdSignals.Rows(e.RowIndex).FindControl("ClosePrice"), TextBox).Text

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update BtcSignals set CryptoCurr='" & CryptoCurr & "', Trend='" & Trend & "', EntryPrice='" & EntryPrice & "', TrendBeginDate='" & TrendBeginDate & "', TrendEndDate='" & TrendEndDate & "', ClosePrice='" & ClosePrice & "' where ID = " & ID)
        opExec.closeConnection()

        Response.Redirect("BtcSignalsManagement.aspx")

    End Sub



    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation
        Dim rr As New Rate

        Dim strPrice As String = ""

        If (txtCurr.Text.Contains("USD")) Then
            strPrice = rr.GetPrice("USD")
        ElseIf (txtCurr.Text.Contains("EUR")) Then
            strPrice = rr.GetPrice("EUR")
        Else
            Response.End()
        End If

        opExec.ExecuteSql("insert into BtcSignals (CryptoCurr,Trend,EntryPrice,TrendBeginDate) values ('" & txtCurr.Text & "', '" & txtTrend.Text & "','" & strPrice & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "') ")
        opExec.closeConnection()

        Response.Redirect("BtcSignalsManagement.aspx")
    End Sub
End Class
