using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org.Fitbit {
    public partial class Callback : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if(!string.IsNullOrEmpty(Request.QueryString["error"])
            || string.IsNullOrEmpty(Request.QueryString["state"])
            || string.IsNullOrEmpty(Request.QueryString["code"])) {
                //TODO: Log Error
                Response.Redirect("~", false);
                return;
            }

            string uniqueId = Request.QueryString["state"];
            string code = Request.QueryString["code"];
            long userId = 0;

            //Find user with key/token that matches the "state" returned in callback
            using(var ctx = new Data.FitathonDataEntities()) {
                var part = Common.GetParticipantFromCode(ctx, uniqueId);

                if(part == null) {
                    Response.Redirect("~", false);
                    return;
                }

                //link the authorization code to the 
                part.fitbitAuthCode = code;

                ctx.SaveChanges();
            }

            if(Common.RetrieveFitbitAccessTokens(userId, false)) {
                Response.Redirect("~/Invite.aspx", false);
            } else {
                Response.Redirect("~", false);
            }
        }
    }
}