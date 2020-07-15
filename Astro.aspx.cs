using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Net;
using System.IO;
using System.Collections;

public partial class Astro : System.Web.UI.Page
{


    private string x_login = "75655fbd67";
    private string x_trans_key = "58f316beba";

    private string x_login_for_webpaystatus = "e8e58cce11";
    private string x_trans_key_for_webpaystatus = "3ab9ad3bb5";

    private string secret_key = "a1eddf966faae8b6d53c7d5ceb34fbd7c";

    private bool sandbox = true;
    /*********************************
     * End of Merchant configuration *
     *********************************/

    /*****************************************************
     * ---- PLEASE DON'T CHANGE ANYTHING BELOW HERE ---- *
     *****************************************************/
    string[] url = new string[4] { "", "", "", "" };
    /*
    url[0]:create
    url[1]:status
    url[2]:exchange
    url[3]:banks
    */

    private int errors = 0;

    const string formatter = "{0,10}{1,16}";


    protected void Page_Load(object sender, EventArgs e)
    {

        this.errors = 0;
        this.url[0] = "https://astropaycard.com/api_curl/apd/create";
        this.url[1] = "https://astropaycard.com/apd/webpaystatus";
        this.url[2] = "https://astropaycard.com/apd/webcurrencyexchange";
        this.url[3] = "https://astropaycard.com/api_curl/apd/get_banks_by_country";


        this.url[0] = "https://sandbox.astropaycard.com/api_curl/apd/create";
        this.url[1] = "https://sandbox.astropaycard.com/apd/webpaystatus";
        this.url[2] = "https://sandbox.astropaycard.com/apd/webcurrencyexchange";
        this.url[3] = "https://sandbox.astropaycard.com/api_curl/apd/get_banks_by_country";


        string respuesta = create("Invoice de prueba AstroPay", (decimal)1.95, "idMeli", "", "BR", "USD", "descrp de prueba", "00003456789", 1, "", "", "string");
        Response.Write(respuesta);
        string status = confirmation("9", "Invoice de prueba AstroPay", "idUser", "descr. de prueba", "1234", "1", "00", "", (decimal)1.95, "");

        Response.Write(status);
    }



      public string create(string invoice, decimal amount, string iduser, string bank, string country, string currency, string description, string cpf, int sub_code, string return_url, string confirmation_url, string response_type)// = "json")
        {
            Hashtable post_values = new Hashtable();

            //Mandatory
            post_values.Add("x_login", this.x_login);
            post_values.Add("x_trans_key", this.x_trans_key);
            post_values.Add("x_invoice", invoice);
            post_values.Add("x_amount", amount);
            post_values.Add("x_iduser", iduser);
            //Optional
            post_values.Add("x_bank", bank);
            post_values.Add("country", country);
            post_values.Add("x_currency", currency);
            post_values.Add("x_description", description);
            post_values.Add("cpf", cpf);
            post_values.Add("x_sub_code", sub_code);
            post_values.Add("x_return", return_url);
            post_values.Add("x_confirm", confirmation_url);
            post_values.Add("type", response_type);

            string message_to_control = String.Concat(invoice, "D", amount, "P", iduser, "A");

            string control = getSign(this.secret_key, message_to_control);//hash_hmac("sha256", pack('A*', $message_to_control), pack('A*', this.secret_key));
            control = control.ToUpper();

            post_values.Add("control", control);

            string response = this.curl(this.url[0], post_values);
            return response;
        }

        public string get_status(string invoice)
        {
            Hashtable post_values = new Hashtable();

            //Mandatory
            post_values.Add("x_login", this.x_login_for_webpaystatus);
            post_values.Add("x_trans_key", this.x_trans_key_for_webpaystatus);
            post_values.Add("x_invoice", invoice);

            string response = this.curl(this.url[1], post_values);
            return response;
        }

        //public string get_exchange(string country = "BR", decimal amount = 1)
        //{
        //    Hashtable post_values = new Hashtable();

        //    //Mandatory
        //    post_values.Add("x_login", this.x_login);
        //    post_values.Add("x_country", country);
        //    post_values.Add("x_amount", amount);

        //    string response = this.curl(this.url[2], post_values);
        //    return response;
        //}

        public string get_banks_by_country(string country, string type)
        {
            Hashtable post_values = new Hashtable();

            //Mandatory
            post_values.Add("x_login", this.x_login);
            post_values.Add("x_trans_key", this.x_trans_key);
            post_values.Add("country_code", country);
            post_values.Add("type", type);

            string response = this.curl(this.url[3], post_values);
            return response;
        }

        /**
         * END OF PUBLIC INTERFACE
         */
        private string curl(string url, Hashtable post_values)
        {
            String post_string = "";
            String post_response = "";
            HttpWebRequest objRequest;
            foreach (DictionaryEntry field in post_values)
            {
                post_string += field.Key + "=" + field.Value + "&";
            }
            post_string = post_string.TrimEnd('&');

            try
            {
                // create an HttpWebRequest object to communicate with AstroPay transaction server
                objRequest = (HttpWebRequest)WebRequest.Create(url);
                objRequest.Method = "POST";
                objRequest.ContentLength = post_string.Length;
                objRequest.ContentType = "application/x-www-form-urlencoded, charset=utf-8";

                // post data is sent as a stream
                StreamWriter myWriter = null;
                myWriter = new StreamWriter(objRequest.GetRequestStream());
                myWriter.Write(post_string);
                myWriter.Close();

                // returned values are returned as a stream, then read into a string
                HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
                using (StreamReader responseStream = new StreamReader(objResponse.GetResponseStream()))
                {
                    post_response = responseStream.ReadToEnd();
                    responseStream.Close();
                }

                // the response string is broken into an array
                // The split character specified here must match the delimiting character specified above
            }
            catch (Exception e)
            {
                throw new Exception("Error ocurred in HttpWebRequest");
            }
            return post_response;
        }

        public string confirmation(string result, string x_invoice, string x_iduser, string x_description, string x_document, string x_bank, string x_payment_type, string x_bank_name, decimal x_amount, string x_control)
        {
            string post_response = this.get_status(x_invoice);
            Array response_array = post_response.Split('|');
            //Must verify parameters
            return post_response;
        }

        public string getSign(string key, string message)
        {
            System.Security.Cryptography.HMAC hmac = System.Security.Cryptography.HMAC.Create("HMACSHA256");
            hmac.Key = System.Text.Encoding.UTF8.GetBytes(key);
            byte[] hash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(message));
            return BitConverter.ToString(hash).Replace("-", "").ToUpperInvariant();
        }



}
