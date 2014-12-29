using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EntityFramework4Example.Data;

namespace MvcApplication3.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["LogoMessage"] = string.Format(
                "{0}::{1} {2}",
                RouteData.Values["controller"],
                RouteData.Values["action"],
                RouteData.Values.Keys.Contains("id") ? RouteData.Values["id"] : ""); 

            using (var db = new CRSDashboardEntities())
            {
                var employee = db.CRS_EMP_EMPLOYEE;
                var selectedEmployees = from e in employee
                                        select e;
                ViewResult result = View(selectedEmployees.ToList());
                return result;
            }
        }

        public ActionResult LookUp(string name)
        {
            name = Server.HtmlEncode(name) ?? string.Empty;
            using (var db = new CRSDashboardEntities())
            {
                var employee = db.CRS_EMP_EMPLOYEE;
                var selectedEmployees = from e in employee
                                        where e.EMPLOYEE_NAME.ToLower().Contains(name.ToLower())
                                        select e;
                ViewResult result = View("Index", selectedEmployees.ToList());
                return result;
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}