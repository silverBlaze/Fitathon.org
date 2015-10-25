using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class Invite : System.Web.UI.Page {
        private const string LEARN_MORE_URL = "http://fitathon.org/About.aspx";
        private const string SPONSOR_URL_FMT = "http://fitathon.org/Register.aspx?code={0}";

        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            using(var ctx = new Data.FitathonDataEntities()) {
                var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                var part = user.participants.SingleOrDefault();

                if(user == null || part == null) {
                    Response.Redirect("~", false);
                    return;
                }

                //split textbox by commas and newlines
                var emails = txtInvite.Text.Split(new char[] { ',', '\n', '\r' });
                foreach(var em in emails) {
                    try {
                        Common.SendEmail("Fitathon.org@fitathon.org", em.Trim(), string.Format("Fitathon.org: {0} wants to invite you!", user.name), string.Format(
                            @"<p>You have been invited by {0} to sponsor them in a Fitathon event.</p>
                            <p>Fitathon.org is a digital walkathon platform, which enables people to raise funds by asking people like you to sponsor them. <a href='{1}'>Click here</a> to learn more</p>
                            <p><a href='{2}'>Sponsor {0}</a></p>", user.name, LEARN_MORE_URL, string.Format(SPONSOR_URL_FMT, part.uniqueID)));
                        } catch { }
                }
                
                Response.Redirect("ViewEvent.aspx", false);
            }
        }
    }
}