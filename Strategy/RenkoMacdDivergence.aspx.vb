Imports System.Data.OleDb

Namespace rpchost


    Partial Class RenkoMacdDivergence
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation

        Dim strID As String

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            opExec = New cs_Operation
            Dim str As String

           
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MyStrategy where ID like '" & Request.QueryString("ID") & "%' ")
            Try
                reader.Read()
                If reader.HasRows = True Then

                    lblHead.Text = str
                    lblTitle.Text = reader("StrategyLink")
                    lblDesc.Text = reader("StrategyText")
                    lblEmbed.Text = reader("StrategyVideo")
                    HyperLink1.Text = "[Access youtube video directly and post your ideas and questions]"
                    HyperLink1.NavigateUrl = reader("Field3")

                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

            reader = opExec.rdGetReader("SELECT [ID],[OrderID], [Signal], [Status], [dtDateSignal],[dtDateClose], [Entry], [SL], [Target], [Comments],[profit] FROM [MyStrategySignals] where MyStrategyID=" & Request.QueryString("ID") & "  order by dtDateSignal DESC")
            Try

                If reader.HasRows = True Then

                    GridView1.DataSource = reader
                    GridView1.DataBind()

                End If

            Catch ex As Exception
                Dispose()
                GC.Collect()
                Response.Write(ex.Message)
                Response.Write(ex.InnerException)

            Finally
                opExec.closeConnection()
                Dispose()

            End Try


        End Sub

    End Class


End Namespace
