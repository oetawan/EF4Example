using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace EntityFramework4Example.Web.Filters
{
    public class LogAttribute : System.Web.Mvc.ActionFilterAttribute
    {
        public override void OnActionExecuting(System.Web.Mvc.ActionExecutingContext filterContext)
        {
            System.Diagnostics.EventLog.WriteEntry(Assembly.GetExecutingAssembly().FullName,
                string.Format("{0}::{1}", 
                    filterContext.ActionDescriptor.ControllerDescriptor.ControllerName,
                    filterContext.ActionDescriptor.ActionName));
        }
    }
}