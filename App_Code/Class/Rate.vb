Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports rpchost
Imports System.Net
Imports System.IO

Imports System
Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Text.RegularExpressions
Imports System.Text
Imports System.Security.Cryptography
Imports System.Net.Mail

Imports System.Collections.Generic

Public Class Rate

    Public Shared btcUsdAsk As Double
    Public Shared btcUsdBid As Double
    Public Shared btcEurAsk As Double
    Public Shared btcEurBid As Double
    Public Shared AskCommission As Double
    Public Shared BidCommission As Double


    Public Function GetInterestRate() As Integer

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select Rate from Rate")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("Rate")

            Else

                Return 0

            End If

        Catch ex As Exception
            Return 0
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Shared Function getAskcommission() As Integer
        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT MinAsk from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()

                Return IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))

            Else
                Return -1

            End If


        Catch ex As Exception

           Return -1

        Finally
            opExec.closeConnection()
        End Try
    End Function

    Public Shared Function getBidcommission() As Integer
        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT MinBid from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()

                Return IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))

            Else
                Return -1

            End If


        Catch ex As Exception

            Return -1

        Finally
            opExec.closeConnection()
        End Try
    End Function

    Public Shared Function getBTCprices() As Boolean

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * from prices")
        Try

            If reader.HasRows = True Then
                reader.Read()

                AskCommission = IIf(IsDBNull(reader("MinAsk")), 0, reader("MinAsk"))
                BidCommission = IIf(IsDBNull(reader("MinBid")), 0, reader("MinBid"))

                btcUsdAsk = IIf(IsDBNull(reader("FrontUsdAsk")), 0, reader("FrontUsdAsk"))
                btcUsdBid = IIf(IsDBNull(reader("FrontUsdBid")), 0, reader("FrontUsdBid"))
                btcEurAsk = IIf(IsDBNull(reader("FrontEurAsk")), 0, reader("FrontEurAsk"))
                btcEurBid = IIf(IsDBNull(reader("FrontEurBid")), 0, reader("FrontEurBid"))

                Return True

            Else

                Return False


            End If


        Catch ex As Exception

            Return False

            GC.Collect()

        Finally
            opExec.closeConnection()


        End Try

    End Function


    Public Function GetTotalInvestmenst() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select TotalInvestments from TotalInvestments")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("TotalInvestments")

            Else

                Return ""

            End If

        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Function GetPrice(ByVal Curr As String) As Integer
        Dim request As WebRequest = Nothing

        If (Curr = "EUR") Then
            request = WebRequest.Create("https://cryptowat.ch/markets/coinbase-pro/btc/eur")
            'request = WebRequest.Create("https://api.gdax.com/products/BTC-EUR/ticker")
        End If

        If (Curr = "USD") Then
            request = WebRequest.Create("https://cryptowat.ch/markets/coinbase-pro/btc/usd")
        End If

        ServicePointManager.Expect100Continue = True
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls Or SecurityProtocolType.Ssl3


        Dim response As WebResponse = request.GetResponse()

        Dim data As Stream = response.GetResponseStream()

        Dim html As String = String.Empty

        Dim reader As StreamReader = New StreamReader(data)
        Dim cacheline As String = ""
        Dim line As String = ""
        Dim lines As New List(Of String)

        Dim arrr As String()
        Dim pp As String = ""

        Do

            line = reader.ReadLine()
            If (line.Contains("price")) Then
                lines.Add(cacheline)
                If (cacheline.Contains("price")) Then
                    arrr = System.Text.RegularExpressions.Regex.Split(cacheline, ":")
                    pp = arrr(1).Trim
                    pp = pp.Replace(",", "")
                    pp = pp.Replace("''", "")
                    pp = pp.Replace("""", String.Empty)
                    Exit Do

                End If

            End If

            cacheline = line

        Loop

        reader.Close()

        'If (Curr = "USD") Then
        '         Return CInt(pp) + 500
        '     else 
        Return CInt(pp) '+ 110
        ' End If


    End Function


    Public Function GetBtcPrice() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Prices")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("BtcUsdAsk")

            Else

                Return ""

            End If

        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Function GetBtcAskPrice() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Prices ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("BtcUsdAsk")

            Else

                Return ""

            End If

        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Function GetBtcBidPrice() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Prices")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("BtcUsdBid")

            Else

                Return ""

            End If

        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

    Public Function GetCurrency() As String

        Dim str As String = ""
        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Prices")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return IIf(reader("BCC") = 1, "USD", "EUR")

            Else

                Return ""

            End If

        Catch ex As Exception
            Return ""
        Finally
            opExec.closeConnection()
        End Try

        Return True

    End Function

End Class
