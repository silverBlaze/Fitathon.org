using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Braintree;

namespace Fitathon.org {
    public partial class PayMethod : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //handle form-submission which includes paymethod nonce
            if(Request.Form["payment_method_nonce"] != null) {
                Submission(Request.Form["payment_method_nonce"]);
                return;
            }

            using(var ctx = new Data.FitathonDataEntities()) {
                var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                var sponsor = user.sponsors.SingleOrDefault();
                var evt = sponsor.participant.fitevent;
                
                var gateway = new Braintree.BraintreeGateway {
                    Environment = Braintree.Environment.SANDBOX,
                    MerchantId = evt.braintreeClientID,  
                    PublicKey = evt.braintreePublicKey,
                    PrivateKey = evt.braintreePrivateKey
                };

                var btToken = gateway.ClientToken.generate();
                litBTClientToken.Text = string.Format("<script type='text/javascript'>var clientToken = '{0}';</script>", btToken);
            }
        }

        protected void Submission(string paymentNonce) {
            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                    var sponsor = user.sponsors.SingleOrDefault();

                    if(user == null || sponsor == null) {
                        Response.Redirect("~", false);
                        return;
                    }
                    string pmToken, pmCustId, pmType;
                    GetSavedPayMethodInfo(paymentNonce, out pmCustId, out pmToken, out pmType);
                    
                    sponsor.payMethodCustomerId = pmCustId;
                    sponsor.payMethodToken = pmToken;
                    sponsor.payMethodType = pmType;
                    
                    ctx.SaveChanges();
                    Response.Redirect("ViewEvent.aspx", false);
                }
            } catch(Exception ex) {
                Response.Write("ERROR writing to database: " + ex.ToString());
            }
        }

        private void GetSavedPayMethodInfo(string paymentNonce, out string customerId, out string token, out string type) {
            using(var ctx = new Data.FitathonDataEntities()) {
                var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
                var sponsor = user.sponsors.SingleOrDefault();
                var evt = sponsor.participant.fitevent;

                var gateway = new Braintree.BraintreeGateway {
                    Environment = Braintree.Environment.SANDBOX,
                    MerchantId = evt.braintreeClientID,
                    PublicKey = evt.braintreePublicKey,
                    PrivateKey = evt.braintreePrivateKey
                };

                //create request with just the payment nonce (empty customer)
                var custRequest = new Braintree.CustomerRequest {
                    PaymentMethodNonce = paymentNonce
                };
                Braintree.Result<Braintree.Customer> custResult = gateway.Customer.Create(custRequest);

                if(custResult.IsSuccess()) {
                    Braintree.Customer customer = custResult.Target;
                    customerId = customer.Id;
                    token = customer.PaymentMethods[0].Token;
                    type = GetPMType(customer.PaymentMethods[0]);
                    return;
                }
            }
            customerId = null;
            token = null;
            type = null;
        }

        private string GetPMType(PaymentMethod paymentMethod) {
            if(paymentMethod.GetType() == typeof(Braintree.CreditCard))
                return ((Braintree.CreditCard)paymentMethod).CardType.ToString();
            else if(paymentMethod.GetType() == typeof(Braintree.PayPalAccount))
                return "PayPal Account";
            return null;
        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            //try {
            //    using(var ctx = new Data.FitathonDataEntities()) {
            //        var user = Common.GetUserFromEmail(ctx, Context.User.Identity.Name);
            //        var sponsor = user.sponsors.SingleOrDefault();

            //        if(user == null || sponsor == null) {
            //            Response.Redirect("~", false);
            //            return;
            //        }

            //        sponsor.payMethodToken = "ASDF1234"; //TODO: Collect saved payment method token from braintree

            //        ctx.SaveChanges();
            //        Response.Redirect("ViewEvent.aspx", false);
            //    }
            //} catch(Exception ex) {
            //    Response.Write("ERROR writing to database: " + ex.ToString());
            //}
        }
    }
}