//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityFramework4Example.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public Order()
        {
            this.Items = new HashSet<Item>();
        }
    
        public int OrderId { get; set; }
        public System.DateTime ModifyDateTime { get; set; }
        public int CustomerCustomerId { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual ICollection<Item> Items { get; set; }
    }
}
