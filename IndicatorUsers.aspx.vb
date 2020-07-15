
Imports System.Data.OleDb



Partial Class IndicatorUsers
    Inherits System.Web.UI.Page

    Dim ss As Integer
    Shared sss As Integer

   


    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
        Dim opExec As New rpchost.cs_Operation
        Dim sqlParam As String

        sqlParam = "update [Indicator] set Mess = '" & Request("txtMess") & "' "
        opExec.ExecuteSql(sqlParam)
        opExec.closeConnection()

        Response.Redirect("IndicatorUsers.aspx")

    End Sub


    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)


        If (e.CommandName = "Edit") Then
            ss = Convert.ToInt16(e.CommandArgument)
            sss = Convert.ToInt16(GridView1.Rows(ss).Cells(0).Text)
        End If

        If (e.CommandName = "Update") Then

            
            ss = Convert.ToInt16(e.CommandArgument)

            Dim lstID As TextBox = GridView1.Rows(ss).Cells(3).FindControl("UserID")
            Dim lstPwd As TextBox = GridView1.Rows(ss).Cells(3).FindControl("Pwd")
            
            Dim lstDateIssued As TextBox = GridView1.Rows(ss).Cells(3).FindControl("DateIssued")
            Dim lstDateExpired As TextBox = GridView1.Rows(ss).Cells(3).FindControl("DateExpire")
            Dim lstMess As TextBox = GridView1.Rows(ss).Cells(3).FindControl("Mess")
            Dim lstCode As TextBox = GridView1.Rows(ss).Cells(3).FindControl("Code")

            Dim lstCodeEUR As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeEUR")

            Dim lstCodeGBP As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeGBP")
            Dim lstCodeJPY As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeJPY")

            Dim lstCodeEURGBP As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeEURGBP")
            Dim lstCodeGBPJPY As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeGBPJPY")
            Dim lstCodeAUDUSD As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeAUDUSD")
            Dim lstCodeUSDJPY As TextBox = GridView1.Rows(ss).Cells(3).FindControl("CodeUSDJPY")

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class

