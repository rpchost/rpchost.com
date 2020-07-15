Imports System.Data
Imports System.Data.OleDb


Namespace Rpchost



    Partial Class MemberSignals
        Inherits System.Web.UI.Page


        Public intSS As Integer

        Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
            DetailsView1.PageIndex = GridView1.SelectedIndex + (GridView1.PageIndex * GridView1.PageSize)
        End Sub


        Sub DoUpdate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs)

            GridView1.DataBind()
            Response.Redirect("MemberSignals.aspx")

        End Sub

        Sub DoDelete(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs)

            GridView1.DataBind()
            Response.Redirect("MemberSignals.aspx")

        End Sub

        Sub DoInsert(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)

            GridView1.DataBind()
            Response.Redirect("MemberSignals.aspx")

        End Sub



        Public Shared Function getSignal(ByVal intID As Integer) As String

            Dim opExec As New cs_Operation


            Dim reader As OleDbDataReader
            reader = opExec.rdGetReader("select * from [MembersSignal] where ID =" & intID)


            Dim str As String


            Try

                If (reader.HasRows = True) Then

                    reader.Read()

                    str = reader("Direction") + " " + reader("curr") + " - " + reader("SignalType") + " - Entry : " + reader("Entry") + " - SL : " + reader("SL") + " -  Target: " + reader("Target")
                    Return str

                Else

                    Return ""
                End If


            Catch ex As Exception

                ' Response.Write(ex.Message)
                Return ""

            Finally

                reader.Close()
                opExec.closeConnection()

            End Try

        End Function



        Protected Sub DetailsView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles DetailsView1.ItemCommand



            If (e.CommandName = "Insert") Then

                Dim opExec As New cs_Operation

                opExec.ExecuteSql("delete from [MembersSignal] where [Signal] = '' ")

            End If




            If (e.CommandName = "Update") Then

                Dim opExec As New cs_Operation

                Dim DDrSignal As DropDownList
                Dim txtComments As TextBox
                Dim txtStatus As TextBox
                Dim txtEntry As TextBox
                Dim txtSL As TextBox
                Dim txtTarget As TextBox
                Dim txtDateSignal As TextBox
                Dim txtDateClose As TextBox


                Dim lblID As Label


                DDrSignal = DetailsView1.Rows(0).Cells(0).FindControl("DDrSignal")
                txtComments = DetailsView1.Rows(0).Cells(0).FindControl("txtComments")
                txtStatus = DetailsView1.Rows(0).Cells(0).FindControl("txtStatus")
                txtEntry = DetailsView1.Rows(0).Cells(0).FindControl("txtEntry")
                txtSL = DetailsView1.Rows(0).Cells(0).FindControl("txtSL")
                txtTarget = DetailsView1.Rows(0).Cells(0).FindControl("txtTarget")

                txtDateSignal = DetailsView1.Rows(0).Cells(0).FindControl("txtDateSignal")
                txtDateClose = DetailsView1.Rows(0).Cells(0).FindControl("txtDateClose")


                lblID = DetailsView1.Rows(0).Cells(0).FindControl("lblID")

                opExec.ExecuteSql("update [MembersSignal] set [Direction]='" & DDrSignal.SelectedValue & "', [Comments] ='" & txtComments.Text & "' , [Status]= '" & txtStatus.Text & "' , [Entry]= '" & txtEntry.Text & "', SL= '" & txtSL.Text & "' , [Target]= '" & txtTarget.Text & "'  , dtDateSignal= '" & txtDateSignal.Text & "' , dtDateClose= '" & txtDateClose.Text & "',AmountK=0,UserSignal=0  where ID=" & lblID.Text)




            End If


            If (e.CommandName = "Insert") Then

                Dim opExec As New cs_Operation


                opExec.ExecuteSql("delete from [MembersSignal] where [Signal]='' ")


                Dim txtSignal As DropDownList
                Dim DDrType As DropDownList
                Dim txtComments As TextBox
                Dim txtStatus As DropDownList
                Dim txtEntry As TextBox
                Dim txtSL As TextBox
                Dim txtTarget As TextBox
                Dim txtDateSignal As TextBox
                Dim txtDateClose As TextBox
                Dim txtCurr As DropDownList


                Dim lblID As Label


                txtSignal = DetailsView1.Rows(0).Cells(0).FindControl("DDrSignal")
                DDrType = DetailsView1.Rows(0).Cells(0).FindControl("DDrType")
                txtCurr = DetailsView1.Rows(0).Cells(0).FindControl("DDrCurr")
                txtComments = DetailsView1.Rows(0).Cells(0).FindControl("txtComments")
                txtStatus = DetailsView1.Rows(0).Cells(0).FindControl("DDrStatus")
                txtEntry = DetailsView1.Rows(0).Cells(0).FindControl("txtEntry")
                txtSL = DetailsView1.Rows(0).Cells(0).FindControl("txtSL")
                txtTarget = DetailsView1.Rows(0).Cells(0).FindControl("txtTarget")

                txtDateSignal = DetailsView1.Rows(0).Cells(0).FindControl("txtDateSignal")
                txtDateClose = DetailsView1.Rows(0).Cells(0).FindControl("txtDateClose")


                lblID = DetailsView1.Rows(0).Cells(0).FindControl("lblID")


                opExec.ExecuteSql("insert into [MembersSignal] ([Direction],SignalType,[Comments],[Status],[Entry],[SL],[Target],dtDateSignal,dtDateClose,AmountK,UserSignal,curr) values ('" & txtSignal.SelectedValue & "','" & DDrType.SelectedValue & "' , '" & txtComments.Text & "' ,'" & txtStatus.SelectedValue & "' , '" & txtEntry.Text & "', '" & txtSL.Text & "' ,'" & txtTarget.Text & "'  , '" & Now & "' , '',0,0,'" & txtCurr.SelectedValue & "') ")


            End If


          


            If (e.CommandName = "Delete") Then

                Dim opExec As New cs_Operation
                Dim i As Int16
                Dim LastID As Integer
                Dim lblID As Label
                lblID = DetailsView1.Rows(0).Cells(0).FindControl("lblID")
                Dim reader As OleDbDataReader
                reader = opExec.rdGetReader("select * from [MembersSignal]")

                Try

                    If (reader.HasRows) Then
                        While reader.Read
                            i = i + 1
                            LastID = reader("ID")
                        End While

                    End If

                    If (i > 1) Then
                        MemberSignals.DeleteCommand = "delete from [MembersSignal] where ID=" & lblID.Text
                    Else
                        opExec.ExecuteSql("update [MembersSignal] set Signal='' where ID=" & LastID)
                    End If



                Catch ex As Exception



                Finally

                    reader.Close()
                    opExec.closeConnection()

                End Try
            End If


        End Sub



        'Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand


        '    Dim ss, sss As Integer



        '    If (e.CommandName = "Select") Then
        '        intSS = Convert.ToInt16(e.CommandArgument)



        '        Dim lblID As Label
        '        lblID = GridView1.Rows(intSS).Cells(0).FindControl("ID")



        '        MemberSignals.SelectCommand = "select * from MembersSignal where ID=" & lblID.Text

        '    End If
        'End Sub


    End Class



End Namespace
