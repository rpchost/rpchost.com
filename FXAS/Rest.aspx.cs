using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;

using System.Net;
using System.IO;

public partial class FXAS_Rest : System.Web.UI.Page
{

    private const string URL = "http://tradingserverbinary.zulutrade.com/requestBalance";
    private const string DATA = @"{""object"":{""name"":""Name""}}";


    protected void Page_Load(object sender, EventArgs e)
    {
        CreateObject();
    }

    private static void CreateObject()
    {
        Uri baseUri = new Uri("http://tradingserverbinary.zulutrade.com/requestBalance");
        UriTemplate uriTemplate = new UriTemplate(
           "users/{username}/bookmarks/{id}");
        // generate a new bookmark URI
        Uri newBookmarkUri = uriTemplate.BindByPosition(baseUri, "skonnard", "123");
        // match an existing bookmark URI
        UriTemplateMatch match = uriTemplate.Match(baseUri, newBookmarkUri);
        System.Diagnostics.Debug.Assert(match != null);
        String ss = match.BoundVariables["username"];
        
        String ss1  =match.BoundVariables["id"];

    }

}
