using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class ProcessorSetup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnSubmit_Click(object sender, EventArgs e) {

            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                    var part = user.participants.SingleOrDefault();
                    var evt = part.fitevent;

                    if(user == null || part == null) {
                        Response.Redirect("~", false);
                        return;
                    }

                    evt.braintreeClientID = txtClientId.Text;
                    evt.braintreePublicKey = txtPublicKey.Text;
                    evt.braintreePrivateKey = txtPrivateKey.Text;

                    ctx.SaveChanges();
                    Response.Redirect("FitbitSetup.aspx", false);
                }

            } catch(Exception ex) {
                Response.Write("ERROR writing to database: " + ex.ToString());
            }
        }
    }
}