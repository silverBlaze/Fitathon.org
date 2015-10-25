using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class Pledge : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnSubmit_Click(object sender, EventArgs e) {

            decimal amount = 0;
            decimal max = 0;
            int perSteps = 0;

            decimal.TryParse(txtPledge.Text, out amount);
            decimal.TryParse(txtMaxDonation.Text, out max);
            int.TryParse(txtPerSteps.Text, out perSteps);

            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);

                    var sponsor = user.sponsors.SingleOrDefault();

                    if(user == null || sponsor == null) {
                        Response.Redirect("~", false);
                        return;
                    }

                    sponsor.pledgeAmount = amount;
                    sponsor.donationMax = max;
                    sponsor.pledgePerSteps = perSteps;

                    ctx.SaveChanges();
                    Response.Redirect("PayMethod.aspx", false);
                }
            } catch(Exception ex) {
                Response.Write("ERROR writing to database: " + ex.ToString());
            }

        }

    }
}