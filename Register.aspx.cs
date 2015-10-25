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
                if(Request.QueryString["code"] != null) {
                    Session["role"] = "sponsor";
                    txtParticipantCode.Text = Request.QueryString["code"];
                    divEventCode.Style["display"] = "none";
                }
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

                    var part = Common.GetParticipantFromCode(txtParticipantCode.Text);
                    if(part != null) {
                        try {
                            using(var ctx = new Data.FitathonDataEntities()) {

                                var user = new Data.user {
                                    name = txtName.Text,
                                    email = txtEmail.Text,
                                    passwordHash = txtPassword.Text,
                                    passwordSalt = txtPassword.Text
                                };
                                //TODO actually hash password

                                ctx.users.Add(user);
                                ctx.SaveChanges();

                                var sponsor = new Data.sponsor {
                                    userID = user.ID,
                                    participantID = part.id
                                };
                                ctx.sponsors.Add(sponsor);
                                ctx.SaveChanges();
                            }
                            FormsAuthentication.SetAuthCookie(txtEmail.Text, false);
                            Response.Redirect("Pledge.aspx", false);
                        } catch(Exception ex) {
                            Response.Write("ERROR writing to database: " + ex.ToString());
                        }
                    } else {
                        Response.Write("ERROR: Participant code not found");
                        return;
                    }

                } else if(Session["role"].ToString() == "solowalker") {
                    //store data in session to put in db after registerevent
                    Session["regName"] = txtName.Text;
                    Session["regEmail"] = txtEmail.Text;
                    Session["regPassword"] = txtPassword.Text;

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