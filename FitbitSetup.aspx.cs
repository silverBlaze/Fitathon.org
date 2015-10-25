using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class FitbitSetup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void lnkLinkFitbit_Click(object sender, EventArgs e) {
            using(var ctx = new Data.FitathonDataEntities()) {
                var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                var part = user.participants.SingleOrDefault();

                if(user == null || part == null) {
                    Response.Redirect("~", false);
                    return;
                }

                Common.RedirectToFitbitAuthFlow(part.uniqueID);
            }
        }
    }
}