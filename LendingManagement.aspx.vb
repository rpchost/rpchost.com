Imports rpchost
Imports System.Data.OleDb

Partial Class LendingManagement
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

    Protected Sub grdLending_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdLending.RowUpdating

        Dim ID As String = DirectCast(grdLending.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        UserID = DirectCast(grdLending.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text

        Status = DirectCast(grdLending.Rows(e.RowIndex).FindControl("Status"), TextBox).Text
        Dim StartD As String = DirectCast(grdLending.Rows(e.RowIndex).FindControl("StartDate"), TextBox).Text
        Dim EndD As String = DirectCast(grdLending.Rows(e.RowIndex).FindControl("EndDate"), TextBox).Text

        Dim StartDate As DateTime
        Dim EndDate As DateTime
        Dim Days As Integer

        If (Status = "Process") Then
            StartDate = Logger.GenerateTimeZon("Eastern Standard Time") 'Logger.GenerateTimeZone("Eastern Standard Time")
            EndDate = StartDate.AddDays(20)
            Days = DateDiff(DateInterval.Day, StartDate, EndDate)

            DirectCast(grdLending.Rows(e.RowIndex).FindControl("DaysLeft"), Label).Text = Days

        Else
            StartDate = StartD
            EndDate = EndD
            Days = DateDiff(DateInterval.Day, StartDate, EndDate)
        End If

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Lending set [Status]='" & Status & "', StartDate='" & StartDate & "', EndDate='" & EndDate & "' where ID = " & ID)
        opExec.closeConnection()

        Response.Redirect("LendingManagement.aspx")

    End Sub


    Protected Sub grdLending_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdLending.Load

        Dim row As Object

        Dim stat As String

        For Each row In grdLending.Rows

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

                Try
                    Dim StartD As DateTime = DirectCast(row.FindControl("StartDate"), Label).Text
                    'Dim EndD As DateTime = DirectCast(row.FindControl("EndDate"), Label).Text

                    Dim Days As Integer

                    Days = DateDiff(DateInterval.Day, StartD, Logger.GenerateTimeZon("Eastern Standard Time"))

                    DirectCast(row.FindControl("DaysLeft"), Label).Text = Days
                Catch ex As Exception

                End Try


            End If


        Next

    End Sub

  
    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("backend/backend.aspx")
    End Sub
End Class
