Imports System.Drawing
Imports System.Data.OleDb
Imports System.Data
Imports rpchost

Partial Class Default8
    Inherits System.Web.UI.Page

    Shared jj As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim oTable, oRow, oCell, acct As Object
        Dim sumPips As Short
        Dim isEURExist As Boolean
        Dim isGBPExist As Boolean

        Dim i, j As Integer

        Dim data As New DataSet

        Dim t1 As New DataTable("Contacts")

        Dim newrow As DataRow
        Dim newCell As New Data.DataColumn()

        ' newCell = New Data.DataColumn()
        ' newCell.ColumnName = "ID"
        ' t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Email"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "First"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Last"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Company"
        t1.Columns.Add(newCell)

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex order by ID")
        Try

            Dim ii As Integer


            ii = 0
            jj = 28

            While reader.Read()

                If (Not Trim(reader("Email")).Equals("") And IsValidEmailFormat(Trim(reader("Email")))) Then
                    newrow = t1.NewRow()

                    ' newrow("ID") = Trim(reader("ID"))
                    newrow("Email") = Trim(reader("Email"))
                    newrow("First") = " "
                    newrow("Last") = " "
                    newrow("Company") = " "
                    If (jj = 1) Then

                        If (ii > 0 And ii <= 500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 2) Then

                        If (ii > 500 And ii <= 1000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 3) Then

                        If (ii > 1000 And ii <= 1500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 4) Then

                        If (ii > 1500 And ii <= 2000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 5) Then

                        If (ii > 2000 And ii <= 2500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 6) Then

                        If (ii > 2500 And ii <= 3000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 7) Then

                        If (ii > 3000 And ii <= 3500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 8) Then

                        If (ii > 3500 And ii <= 4000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 9) Then

                        If (ii > 4000 And ii <= 4500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 10) Then

                        If (ii > 4500 And ii <= 5000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 11) Then

                        If (ii > 5000 And ii <= 5500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 12) Then

                        If (ii > 5500 And ii <= 6000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 13) Then

                        If (ii > 6000 And ii <= 6500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 14) Then

                        If (ii > 6500 And ii <= 7000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 15) Then

                        If (ii > 7000 And ii <= 7500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 16) Then

                        If (ii > 7500 And ii <= 8000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 17) Then

                        If (ii > 8000 And ii <= 8500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 18) Then

                        If (ii > 8500 And ii <= 9000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 19) Then

                        If (ii > 9000 And ii <= 9500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 20) Then

                        If (ii > 9500 And ii <= 10000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 21) Then

                        If (ii > 10000 And ii <= 10500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 22) Then

                        If (ii > 10500 And ii <= 11000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 23) Then

                        If (ii > 11000 And ii <= 11500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 24) Then

                        If (ii > 11500 And ii <= 12000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 25) Then

                        If (ii > 12000 And ii <= 12500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 26) Then

                        If (ii > 12500 And ii <= 13000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If

                    If (jj = 27) Then

                        If (ii > 13000 And ii <= 13500) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If
                    If (jj = 28) Then

                        If (ii > 13500 And ii <= 14000) Then
                            t1.Rows.Add(newrow)
                        End If

                    End If




                    ii = ii + 1


                End If

               


            End While

            data.Tables.Add(t1)
            GridView1.DataSource = data
            GridView1.DataBind()


          

        Catch ex As Exception
            Response.Write(ex.Message)


        Finally
            opExec.closeConnection()
            reader.Close()
        End Try


       
    End Sub

    Function IsValidEmailFormat(ByVal s As String) As Boolean
        Try
            Dim a As New System.Net.Mail.MailAddress(s)
        Catch
            Return False
        End Try
        Return True
    End Function





    Protected Sub btntocsv_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btntoCsv.Click


        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=gvtocsv" & jj & ".csv")
        Response.Charset = ""
        Response.ContentType = "application/text"
        Dim sBuilder As StringBuilder = New System.Text.StringBuilder()
        For index As Integer = 0 To GridView1.Columns.Count - 1
            sBuilder.Append(GridView1.Columns(index).HeaderText + ","c)
        Next
        sBuilder.Append(vbCr & vbLf)
        For i As Integer = 0 To GridView1.Rows.Count - 1
            For k As Integer = 0 To GridView1.HeaderRow.Cells.Count - 1
                sBuilder.Append(GridView1.Rows(i).Cells(k).Text.Replace(",", "") + ",")
            Next
            sBuilder.Append(vbCr & vbLf)
        Next
        Response.Output.Write(sBuilder.ToString())


        Response.Flush()
        Response.[End]()


    End Sub

End Class