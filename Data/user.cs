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
    
    public partial class user
    {
        public user()
        {
            this.participants = new HashSet<participant>();
            this.sponsors = new HashSet<sponsor>();
        }
    
        public int ID { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string passwordHash { get; set; }
        public string passwordSalt { get; set; }
    
        public virtual ICollection<participant> participants { get; set; }
        public virtual ICollection<sponsor> sponsors { get; set; }
    }
}
