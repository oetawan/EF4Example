using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Data.Objects;
using System.Linq;
using System.Text;

namespace EntityFramework4Example.Data
{
    public class AWModel : ObjectContext
    {
        public AWModel(EntityConnection connection)
            : base(connection)
        {
            DefaultContainerName = "AWModel";
        }

        public IObjectSet<Contact> Contacts
        {
            get { return CreateObjectSet<Contact>(); }
        }

        public IObjectSet<Employee> Employees
        {
            get { return CreateObjectSet<Employee>(); }
        }
    }
}