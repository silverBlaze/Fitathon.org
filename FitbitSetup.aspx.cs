using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class FitbitSetup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            /*
            
            TODO: create /Fitbit/Callback.aspx

            it will do something like:

            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var user = Common.GetUserFromEmail(Context.User.Identity.Name);
                    var part = user.participants.SingleOrDefault();

                    var part = Common.GetParticipantFromCode(uniqueIDFromFitbit);

                    if(user == null || part == null) {
                        Response.Redirect("~", false);
                        return;
                    }
                    
                    string accessToken;
                    string refreshToken;
                    Common.GetFitbitAccessTokens(authCodeFromFitbit, out accessToken, out refreshToken);
                    
                    part.FitbitAuthCode = authCodeFromFitbit;
                    part.FitbitAccessToken = accessToken;
                    part.FitbitRefreshToken = refreshToken;
                    
                    ctx.SaveChanges();
                    Response.Redirect("Invite.aspx", false);

                } catch(Exception ex) {
                    Response.Write("ERROR writing to database: " + ex.ToString());
                }
            
            }

            */
        }
    }
}