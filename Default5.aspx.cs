using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using OpenQA.Selenium.Chrome;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;

public partial class Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


       // String encr = EncryptText("1234567891234567","jijo1136");
       // String decr = DecryptText(encr, "jijo1136");

        //try
        //{
            MailMessage mail = new MailMessage();
            mail.To.Add("Rpchost.Payments@gmail.com");
           // mail.To.Add("test@gmail.com");
            mail.From = new MailAddress("rpchost1@gmail.com");
            mail.Subject = "sub";

            mail.Body = "TEST";

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "mail.gmail.com"; //Or Your SMTP Server Address
            smtp.Credentials = new System.Net.NetworkCredential
                 ("rpchost1@gmail.com", "Jijo1136!"); // ***use valid credentials***
            smtp.Port = 578;

            //Or your Smtp Email ID and Password
            smtp.EnableSsl = true;
            smtp.Send(mail);
       // }
        //catch (Exception ex)
       // {
        //    Response.Write("Exception in sendEmail:" + ex.Message);
       // }

       
    }



//    public string EncryptText(string input, string password)
//    {
//        // Get the bytes of the string
//        byte[] bytesToBeEncrypted = Encoding.UTF8.GetBytes(input);
//        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

//        // Hash the password with SHA256
//        passwordBytes = SHA256.Create().ComputeHash(passwordBytes);

//        byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, passwordBytes);

//        string result = Convert.ToBase64String(bytesEncrypted);

//        return result;
//    }


//    public string DecryptText(string input, string password)
//    {
//        // Get the bytes of the string
//        byte[] bytesToBeDecrypted = Convert.FromBase64String(input);
//        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
//        passwordBytes = SHA256.Create().ComputeHash(passwordBytes);

//        byte[] bytesDecrypted = AES_Decrypt(bytesToBeDecrypted, passwordBytes);

//        string result = Encoding.UTF8.GetString(bytesDecrypted);

//        return result;
//    }

//    public byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
//    {
//        byte[] encryptedBytes = null;

//        // Set your salt here, change it to meet your flavor:
//        // The salt bytes must be at least 8 bytes.
//        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };

//        using (MemoryStream ms = new MemoryStream())
//        {
//            using (RijndaelManaged AES = new RijndaelManaged())
//            {
//                AES.KeySize = 256;
//                AES.BlockSize = 128;

//                var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
//                AES.Key = key.GetBytes(AES.KeySize / 8);
//                AES.IV = key.GetBytes(AES.BlockSize / 8);

//                AES.Mode = CipherMode.CBC;

//                using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
//                {
//                    cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
//                    cs.Close();
//                }
//                encryptedBytes = ms.ToArray();
//            }
//        }

//        return encryptedBytes;
//    }


//    public byte[] AES_Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes)
//    {
//        byte[] decryptedBytes = null;

//        // Set your salt here, change it to meet your flavor:
//        // The salt bytes must be at least 8 bytes.
//        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };

//        using (MemoryStream ms = new MemoryStream())
//        {
//            using (RijndaelManaged AES = new RijndaelManaged())
//            {
//                AES.KeySize = 256;
//                AES.BlockSize = 128;

//                var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
//                AES.Key = key.GetBytes(AES.KeySize / 8);
//                AES.IV = key.GetBytes(AES.BlockSize / 8);

//                AES.Mode = CipherMode.CBC;

//                using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
//                {
//                    cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
//                    cs.Close();
//                }
//                decryptedBytes = ms.ToArray();
//            }
//        }

//        return decryptedBytes;
//    }
}
