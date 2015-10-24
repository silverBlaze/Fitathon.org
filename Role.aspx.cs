using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class Role : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }
        
        protected void btnSubmit_Click(object sender, EventArgs e) {
            Session["role"] = ddlRole.SelectedValue;
            Response.Redirect("Register.aspx", false);
        }
    }
}