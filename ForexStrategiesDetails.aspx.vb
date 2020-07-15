Imports System.Data.OleDb

Namespace rpchost

    Partial Class ForexStrategiesDetails
        Inherits System.Web.UI.Page

        Dim objrow As TableRow
        Dim objcell As TableCell
        Dim objlink As HyperLink



        Private Function getNext(ByVal intID As Integer) As String

            Dim opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Strategy")
            Dim intRes As Integer = -1

            While reader.Read

                If reader("ID") = intID Then
                    reader.Read()
                    Try
                        intRes = reader("ID")
                    Catch ex As Exception
                        intRes = -2
                    End Try

                End If

            End While

            Return intRes

        End Function

        Private Function getPrevious(ByVal intID As Integer) As String

            Dim opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Strategy order by ID")
            Dim intRes As Integer = -1
            If intID = 1 Then
                Return -1
                Exit Function
            End If

            While reader.Read
                If reader("ID") <> intID Then
                    intRes = reader("ID")
                Else
                    Exit While
                End If
            End While

            Return intRes

        End Function


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

           

            If Request.QueryString("ID") = -2 Or Request.QueryString("ID") = -1 Then
                Response.Redirect("Forex-Strategies.aspx")
            End If


            Dim opExec = New cs_Operation

            If Request.QueryString("ID") <> "" And Request.QueryString("ID") <> Nothing Then

                Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Strategy where ID = " & Request.QueryString("ID"))

                Dim i As Integer = 1
                Dim str1, str2 As String

                While reader.Read

                    str1 = reader("ID") & " - " & reader("StrategyLink") & "  " & " [ " & reader("DateIssued") & " ] "

                    objrow = New TableRow
                    objlink = New HyperLink
                    objcell = New TableCell

                    objlink.Text = str1
                    objlink.NavigateUrl = "Forex-Videos.aspx?head=" & reader("StrategyLink")
                    objcell.Width = Unit.Parse("100%")
                    objcell.Height = Unit.Parse("30")
                    objcell.CssClass = "BlackTextBold"
                    objcell.VerticalAlign = VerticalAlign.Top
                    objcell.Controls.Add(objlink)

                    objrow.Controls.Add(objcell)
                    tbl.Controls.Add(objrow)


                    str2 = reader("StrategyText")
                    objrow = New TableRow
                    objcell = New TableCell
                    objcell.Text = str2
                    objcell.Width = Unit.Parse("100%")
                    objcell.VerticalAlign = VerticalAlign.Top
                    objrow.Controls.Add(objcell)

                    tbl.Controls.Add(objrow)

                    i = i + 1

                    objrow = New TableRow
                    objcell = New TableCell
                    objrow.Height = Unit.Parse("70")
                    objcell.VerticalAlign = VerticalAlign.Top
                    objrow.Controls.Add(objcell)
                    tbl.Controls.Add(objrow)

                    objrow = New TableRow

                    objcell = New TableCell
                    objlink = New HyperLink
                    objlink.Text = "<< Previous"
                    objlink.CssClass = "BlueText"

                    objlink.NavigateUrl = "ForexStrategiesDetails.aspx?ID=" & getPrevious(reader("ID"))
                    objcell.Controls.Add(objlink)
                    objcell.HorizontalAlign = HorizontalAlign.Center
                    objrow.Controls.Add(objcell)

                    objcell = New TableCell
                    objlink = New HyperLink
                    objlink.Text = "Return to Main"
                    objlink.CssClass = "BlueText"
                    objcell.HorizontalAlign = HorizontalAlign.Center
                    objlink.NavigateUrl = "Forex-Strategies.aspx"
                    objcell.Controls.Add(objlink)
                    objrow.Controls.Add(objcell)

               
                    objcell = New TableCell
                    objlink = New HyperLink
                    objlink.Text = "Next >>"
                    objlink.CssClass = "BlueText"
                    objcell.HorizontalAlign = HorizontalAlign.Center
                    objcell.Width = Unit.Parse("210")
                    objlink.NavigateUrl = "ForexStrategiesDetails.aspx?ID=" & getNext(reader("ID"))
                    objcell.Controls.Add(objlink)
                    objrow.Controls.Add(objcell)

                    tbl1.Controls.Add(objrow)

                End While

            End If

        End Sub

    End Class

End Namespace
