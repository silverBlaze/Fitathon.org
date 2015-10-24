using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Fitathon.org {
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if(Session["role"] == null) {
                //check querystring for participant code
                if(Request.QueryString["code"] != null) {
                    Session["role"] = "sponsor";
                    txtParticipantCode.Text = Request.QueryString["code"];
                    divEventCode.Style["display"] = "none";
                } else {
                    Response.Redirect("~", false);
                    return;
                }
            }
            if(Session["role"] != null && !string.IsNullOrEmpty(Session["role"].ToString())) {

                if(Session["role"].ToString() == "coordinator") {
                    Response.Redirect("ComingSoon.aspx", false);
                    return;
                }

                phSponsor.Visible = (Session["role"].ToString() == "sponsor");
                phParticipant.Visible = (Session["role"].ToString() == "solowalker");
            } else {
                Response.Redirect("~", false);
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            if(Session["role"] != null && !string.IsNullOrEmpty(Session["role"].ToString())) {
                if(Session["role"].ToString() == "sponsor") {
                    FormsAuthentication.SetAuthCookie(txtEmail.Text, false);
                    Response.Redirect("Pledge.aspx", false);
                } else if(Session["role"].ToString() == "solowalker") {
                    FormsAuthentication.SetAuthCookie(txtEmail.Text, false);
                    Response.Redirect("RegisterEvent.aspx", false);
                }
            } else {
                Response.Redirect("~", false);
                return;
            }
        }
    }
}