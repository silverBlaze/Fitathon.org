using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class PayMethod : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //TODO: load the braintree drop in UI
        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                    var sponsor = user.sponsors.SingleOrDefault();

                    if(user == null || sponsor == null) {
                        Response.Redirect("~", false);
                        return;
                    }

                    sponsor.payMethodToken = "ASDF1234"; //TODO: Collect saved payment method token from braintree

                    ctx.SaveChanges();
                    Response.Redirect("ViewEvent.aspx", false);
                }
            } catch(Exception ex) {
                Response.Write("ERROR writing to database: " + ex.ToString());
            }
        }
    }
}