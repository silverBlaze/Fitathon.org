//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Fitathon.org.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class fitevent
    {
        public fitevent()
        {
            this.participants = new HashSet<participant>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public System.DateTime begins { get; set; }
        public System.DateTime ends { get; set; }
        public Nullable<int> estimatedSteps { get; set; }
        public Nullable<decimal> donationGoal { get; set; }
        public string braintreeClientID { get; set; }
        public string braintreePublicKey { get; set; }
        public string braintreePrivateKey { get; set; }
        public bool settled { get; set; }
    
        public virtual ICollection<participant> participants { get; set; }
    }
}
