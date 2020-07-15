using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;



public partial class tm4b_1 : System.Web.UI.Page
{


    public class Account
    {
        public string Email { get; set; }
        public bool Active { get; set; }
        public DateTime CreatedDate { get; set; }
        public IList<string> Roles { get; set; }
    }

     public class Container
     {
            public Account venue ;
     }
       

   

    protected void Page_Load(object sender, EventArgs e)
    {

        var client = new RestClient("https://connect.routee.net/sms");
        var request = new RestRequest(Method.POST);
        request.AddHeader("content-type", "application/json");
        request.AddHeader("authorization", "Bearer 12dc9fe4-7df4-4786-8d7a-a46d307687f4");
        request.AddParameter("application/json", "{ \"body\": \"A new game has been posted to the MindPuzzle. Check it out\",\"to\" : \"+30697ΧΧΧΧΧΧΧ\",\"from\": \"amdTelecom\"}", ParameterType.RequestBody);
        IRestResponse response = client.Execute(request);

    }
}
