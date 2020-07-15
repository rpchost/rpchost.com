using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class Default12 : System.Web.UI.Page
{

    String contentType;
    Byte[] bytes;

    protected void Page_Load(object sender, EventArgs e)
    {
        //string message =  "POST" + "/v2/accounts/xxxx/transactions" +
        //"{type:send,to:xxxx,amount:0.0002,currency:BTC}";

        //string signature = "";//HashEncode(HashHMAC(StringEncode("xxxxxx"), StringEncode(message)));

        //var _client = new  RestClient("https://public.sandbox.pro.coinbase.com");

        //var request = new RestRequest("accounts/xxxxxx/transactions", Method.POST);

        //request.AddHeader("CB-VERSION", "2016-10-03");
        //request.AddHeader("Content-Type", "application/json");
        //request.AddHeader("Charset", "utf-8");
        //request.AddHeader("CB-ACCESS-KEY", "4j9TFRjQ2bWnCQSDvD2IFTiigvQa0PUpt0LahLlZ5iDbUhE08ldrrFkuO+JwTuFZsHMG9eYK/TddzT3u7ljUcA==");
        //request.AddHeader("CB-ACCESS-SIGN", signature);
        ////request.AddHeader("CB-ACCESS-TIMESTAMP", time_epoch.data.epoch.ToString());
        //request.AddParameter("type", "send");
        //request.AddParameter("to", "xxxx");
        //request.AddParameter("amount", "0.0002");
        //request.AddParameter("currency", "BTC");
        //request.AddParameter("idem", "9316dd16-6c09");

        ////request.Content = new StringContent("{\"type\":\"send\",\"to\":\"xxxx\",\"amount\":0.0002,\"currency\":\"BTC\"}", Encoding.UTF8, "application/json");

        //request.OnBeforeDeserialization = resp => { resp.ContentType = "application/json;charset=utf-8"; };
        //var response = _client.Execute(request);
        //return _client.Execute(request).Content;


        //GetWebResponse("https://public.sandbox.pro.coinbase.com", "Post","", "type=send&amount=0.0002,size=0.01&side=Buy&product_id=BTC-EUR");

        Uri u = new Uri("https://www.tradingview.com/symbols/BTCEUR/?exchange=COINBASE");
        RetrieveAsset(u);


    }



    private void RetrieveAsset(Uri uri)
    {
        try
        {
            
            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(uri);
            webRequest.KeepAlive = false;
            webRequest.ProtocolVersion = HttpVersion.Version10;
            webRequest.ServicePoint.ConnectionLimit = 1;
            webRequest.Headers.Add("UserAgent", "Pentia; MSI");

            //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Ssl3;
            webRequest.ProtocolVersion = HttpVersion.Version10; 

            using (WebResponse webResponse = webRequest.GetResponse())
            {
                contentType = webResponse.ContentType;
                using (Stream stream = webResponse.GetResponseStream())
                {
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        // Stream the response to a MemoryStream via the byte array buffer
                        Byte[] buffer = new Byte[0x1000];

                        Int32 bytesRead;
                        while ((bytesRead = stream.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            memoryStream.Write(buffer, 0, bytesRead);
                        }
                        bytes = memoryStream.ToArray();
                    }
                }
            }
            
        }
        catch (Exception ex)
        {
            Response.Write("Failed to retrieve asset from '" + uri + "': " + ex.Message);
        }
    }

    private static string GetWebResponse(string url, string command, string path, string body)
    {
        var timeStamp = "3600";
        var request = (HttpWebRequest)WebRequest.Create(url);

        request.Method = command;
        request.ContentType = "application/json";
        request.Headers.Add("CB-VERSION", "2/2/2019");
        request.Headers.Add("CB-ACCESS-KEY", "1d4db1a427054932db633e59ad9b6f86");
        request.Headers.Add("CB-ACCESS-SIGN", GetAccessSign(timeStamp, command, path, body));
        request.Headers.Add("CB-ACCESS-TIMESTAMP", timeStamp);

        if (command == "POST")
        {
            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(body);
                streamWriter.Flush();
                streamWriter.Close();
            }
        }

        var response = (HttpWebResponse)request.GetResponse();

        using (var reader = new StreamReader(response.GetResponseStream(), Encoding.ASCII))
        {
            return reader.ReadToEnd();
        }
    }

    private static string GetAccessSign(string timestamp, string command, string path, string body)
    {
        var hmacKey = Encoding.UTF8.GetBytes("6r1filjgxjv");

        string data = timestamp + command + path + body;
        using (var signatureStream = new MemoryStream(Encoding.UTF8.GetBytes(data)))
        {
            return new HMACSHA256(hmacKey).ComputeHash(signatureStream).Aggregate(new StringBuilder(), (sb, b) => sb.AppendFormat("{0:x2}", b), sb => sb.ToString());
        }
    }

}
