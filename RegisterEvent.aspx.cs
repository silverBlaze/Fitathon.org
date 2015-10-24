using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class RegisterEvent : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            if(Session["regName"] == null || Session["regEmail"] == null || Session["regPassword"] == null) {
                Response.Redirect("~", false);
                return;
            }

            try {

                using(var ctx = new Data.FitathonDataEntities()) {
                    //create the user now from session values

                    var user = new Data.user {
                        name = Session["regName"].ToString(),
                        email = Session["regEmail"].ToString(),
                        passwordHash = Session["regPassword"].ToString(),
                        passwordSalt = Session["regPassword"].ToString()
                    };
                    //TODO actually hash password

                    ctx.users.Add(user);
                    ctx.SaveChanges();

                    decimal goal = 0;
                    DateTime begins, ends;
                    int estSteps = 0;
                    int.TryParse(txtEstimatedSteps.Text, out estSteps);
                    decimal.TryParse(txtDonationGoal.Text, out goal);
                    DateTime.TryParse(txtBegins.Text, out begins);
                    DateTime.TryParse(txtEnds.Text, out ends);

                    //create event
                    var evt = new Data.fitevent {
                        name = txtName.Text,
                        donationGoal = goal,
                        begins = begins,
                        ends = ends,
                        estimatedSteps = estSteps
                    };

                    ctx.fitevents.Add(evt);
                    ctx.SaveChanges();

                    //create participant record
                    var part = new Data.participant {
                        userID = user.ID,
                        eventID = evt.id,
                        uniqueID = Guid.NewGuid().ToString()
                    };
                    
                    ctx.participants.Add(part);
                    ctx.SaveChanges();
                    Response.Redirect("ProcessorSetup.aspx", false);
                }
            } catch(Exception ex) {
                Response.Write("ERROR writing to database: " + ex.ToString());
            }
        }
        
    }
}