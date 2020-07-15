using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

public partial class Payeer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
var m_shop = "Rpchost";
 var m_orderid = "1";
 var m_amount = "100.00";
 var m_curr = "USD";
 var m_desc = "Test";
 var m_key = "Jijo1136!";
 var arr = new string[] { m_shop, m_orderid, m_amount, m_curr, m_desc, m_key
};
 var sign = sign_hash(String.Join(":", arr));
 
    }


    public static string sign_hash(string text)
    {
        byte[] data = Encoding.Default.GetBytes(text);
        var result = new SHA256Managed().ComputeHash(data);
        return BitConverter.ToString(result).Replace("-", "").ToUpper();
    }

}
