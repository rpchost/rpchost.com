Imports rpchost
Imports System.Data.OleDb

Partial Class CampaignBackend
    Inherits System.Web.UI.Page

    Private amountBtc As String
    Private amount As String
    Private BtcAddress As String
    Private BUY_Price As String
    Private Currency As String
    Private UserID As String
    Private Email As String
    Private Status As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub

    Protected Sub grdCampaign_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdCampaign.RowUpdating

        Dim ID As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text
        Dim Status As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("Status"), TextBox).Text

        Dim BTC As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("BTC"), TextBox).Text
        Dim BtcRemain As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("BtcRemain"), TextBox).Text
        Dim BtcPrice As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("BtcPrice"), TextBox).Text
        Dim BtcPriceRemain As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("BtcPriceRemain"), TextBox).Text
        Dim ContributionLink As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("ContributionLink"), TextBox).Text
        Dim Curr As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("Curr"), TextBox).Text
        Dim CampainName As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("CampainName"), TextBox).Text
        Dim MinContribution As String = DirectCast(grdCampaign.Rows(e.RowIndex).FindControl("MinContribution"), TextBox).Text
      
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Contribution set Curr='" & Curr & "',dtPost='" & Logger.GenerateTimeZone("Eastern Standard Time") & "',BTC= " & Convert.ToDouble(BTC) & ",BtcRemain= " & Convert.ToDouble(BtcRemain) & ",BtcPrice = " & Convert.ToDouble(BtcPrice) & ",BtcPriceRemain = " & Convert.ToDouble(BtcPriceRemain) & ",[Status] = '" & Status & "',ContributionLink = '" & ContributionLink & "',CampainName = '" & CampainName & "',MinContribution = " & MinContribution & "  where ID = " & ID)
        opExec.closeConnection()

    End Sub


    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub


    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Contribution (Curr,dtPost,BTC,BtcRemain,BtcPrice,BtcPriceRemain,Status,ContributionLink,CampainName,MinContribution) values ('" & txtCurr.Text & "','" & Logger.GenerateTimeZone("Eastern Standard Time") & "', " & txtBTC.Text & ", " & txtBtcRemain.Text & ", " & txtBtcPrice.Text & ", " & txtBtcPriceRemain.Text & ",'" & txtStatus.Text & "','" & txtContributionLink.Text & "','" & txtCampainName.Text & "'," & txtMinContribution.Text & ") ")
        opExec.closeConnection()

        Response.Redirect("CampaignBackend.aspx")
    End Sub
End Class
