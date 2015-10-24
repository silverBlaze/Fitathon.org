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
            Response.Redirect("ViewEvent.aspx", false);
        }
    }
}