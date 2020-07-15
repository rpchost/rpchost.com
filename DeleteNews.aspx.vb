Imports System.Data.OleDb

Namespace rpchost

    Partial Class DeleteNews
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            ddNews.Items.Clear()

            opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from News")
            Try

                If reader.HasRows = True Then
                    While reader.Read()
                        ddNews.Items.Add(reader("ID") & "-" & reader("Description"))
                    End While
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
                Dispose()
            End Try
        End Sub

        Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
            opExec = New cs_Operation
            Dim sqlParam As String

            Dim str As String
            Dim intID As Integer
            Dim arr() As String

            str = Request("ddNews") 'ddNews.SelectedItem.Text
            arr = Split(str, "-")
            intID = arr(0)

            sqlParam = "delete from News where ID = " & intID & " "
            opExec.ExecuteSql(sqlParam)

            Response.Redirect("DeleteNews.aspx")

        End Sub


        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
            Response.Redirect("backend/backend.aspx")
        End Sub
    End Class


End Namespace