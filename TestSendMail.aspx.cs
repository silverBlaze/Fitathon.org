using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitathon.org {
    public partial class TestSendMail : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            Common.SendEmail("no-reply@fitathon.org", "wellsjh@gmail.com", "Another test!", "hi google, i'm not spam!");
        }
    }
}