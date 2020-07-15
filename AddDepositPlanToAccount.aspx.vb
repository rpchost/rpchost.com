Imports System.Data.OleDb

Partial Class AddDepositPlanToAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If


        lblMess.Text = ""

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select ID, (ID & ' - ' & FirstName & ' - ' & LastName & ' - ' & RegisterDate) as usr from MembersForex")
        Try

            If reader.HasRows = True Then

                ddUsers.DataSource = reader
                ddUsers.DataTextField = "usr"
                ddUsers.DataValueField = "ID"
                ddUsers.DataBind()

            End If

        Catch ex As Exception

        Finally
            opExec.closeConnection()
        End Try



        Dim opExecPlan As New rpchost.cs_Operation
        Dim readerPlan As OleDbDataReader = opExecPlan.rdGetReader("select PlanDeposit, plan as plan from Plan")
        Try

            If readerPlan.HasRows = True Then

                ddPlan.DataSource = readerPlan
                ddPlan.DataTextField = "PlanDeposit"
                ddPlan.DataValueField = "PlanDeposit"
                ddPlan.DataBind()

            End If

        Catch ex As Exception

        Finally
            opExecPlan.closeConnection()
        End Try


    End Sub

    Protected Sub grdlending_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdLending.RowUpdating
        Dim disabled As String = DirectCast(grdLending.Rows(e.RowIndex).FindControl("disabled"), CheckBox).Checked
        Dim ID As String = DirectCast(grdLending.Rows(e.RowIndex).FindControl("ID"), TextBox).Text

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("update Investment set disabled = " & disabled & " where ID = " & ID)
        opExec.closeConnection()

    End Sub

    Protected Sub btnDeposit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeposit.Click

        Dim dt As DateTime = Logger.GenerateTimeZon("Eastern Standard Time")

        If (isUserHasDeposit(Request("ddUsers")) = False) Then
            If CleanUserInvestment(Request("ddUsers")) Then

                Dim opExec As New rpchost.cs_Operation
                opExec.ExecuteSql("insert into Investment (UserID,Balance,InvestmentPlan,DepositDate,LendingDate,Lended,invested) values (" & Request("ddUsers") & "," & Request("ddPlan") & ",'" & ddPlan.SelectedItem.Text & "','" & dt.ToString("dd'/'MM'/'yyyy HH:mm") & "','" & dt.ToString("dd'/'MM'/'yyyy HH:mm") & "'," & chkLend.Checked & "," & chkInvest.Checked & ") ")
                opExec.closeConnection()

                lblMess.Text = "User " & Request("ddUsers") & " has been successfully Lended in investment"

            End If

        Else
            lblMess.Text = "This user has already an investment"

        End If

        Response.Redirect("AddDepositPlanToAccount.aspx")

    End Sub

    Private Function isUserHasDeposit(ByVal userID As Integer) As Boolean

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from investmentDetails where UserID=" & Request("ddUsers"))

        Try

            Return reader.HasRows

        Catch ex As Exception
            Response.Write(ex.Message)
            Return False
        Finally
            opExec.closeConnection()
        End Try


    End Function

    Private Function CleanUserInvestment(ByVal userID As Integer) As Boolean

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("delete from Investment where UserID = " & userID)
        opExec.closeConnection()

        Return True

    End Function

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
End Class
