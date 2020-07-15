Imports rpchost
Imports System.Data.OleDb

Partial Class MyStrategiesSignals
    Inherits System.Web.UI.Page

    Dim conn As cs_Connection
    Dim opExec As cs_Operation


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        txtdtDateSignal.Text = Date.Now


        opExec = New cs_Operation
        Dim str As String
        Dim newItem As ListItem

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MyStrategy")
        Try

            If reader.HasRows = True Then

                While (reader.Read())
                    newItem = New ListItem()

                    newItem.Text = reader("StrategyLink").ToString()
                    newItem.Value = reader("ID").ToString()

                    ddStrategyList.Items.Add(newItem)

                End While
        
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

       


    End Sub


    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        opExec = New cs_Operation
        Dim sqlParam As String

        sqlParam = "insert into MyStrategySignals (MyStrategyID, [Signal] ,[Status],[dtDateSignal] ,dtDateClose,[curr],[Entry],[SL],[Target] ) values (" & ddStrategyList.SelectedValue & ",'" & Request("txtSignal") & "','" & Request("txtStatus") & "','" & Request("txtdtDateSignal") & "','" & Request("txtdtDateClose") & "','" & Request("txtCurr") & "','" & Request("txtEntry") & "','" & Request("txtSL") & "','" & Request("txtTarget") & "')"
        opExec.ExecuteSql(sqlParam)

        Response.Redirect("MyStrategiesSignals.aspx")
    End Sub

    Protected Sub ddStrategyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddStrategyList.SelectedIndexChanged
        AccessDataSource1.SelectCommand = "SELECT * FROM [MyStrategySignals] where MyStrategyID = " & ddStrategyList.SelectedValue & " order by ID DESC"


    End Sub

End Class
