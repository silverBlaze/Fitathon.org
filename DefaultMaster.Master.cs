using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class DefaultMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            ID = "fitathon";
        }
    }
}