using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OdeToFood.Models;
using OdeToFood.Data;
using PagedList;
using PagedList.Mvc;
namespace EntityFramework4Example.Web.Controllers
{
    public class OdeToFoodController : Controller
    {
        OdeToFoodDb _db = new OdeToFoodDb();

        #region Restaurant

        public ActionResult AutoComplete(string term)
        {
            var result =
                _db.Restaurants.
                Where(r => r.Name.ToLower().StartsWith(term.ToLower())).
                Take(10).
                Select(r => new { label = r.Name });

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index(string searchTerm, int page = 1)
        {
            ViewData["LogoMessage"] = "OdeToFood";
            var models = (from r
                         in _db.Restaurants
                         where string.IsNullOrEmpty(searchTerm) || r.Name.Trim().ToLower().Contains(searchTerm.Trim().ToLower())
                         orderby r.Reviews.Average(resto => resto.Rating)
                         descending
                         select new RestaurantListViewModel
                         {
                             Id = r.Id,
                             Name = r.Name,
                             City = r.City,
                             Country = r.Country,
                             CountOfReviews = r.Reviews.Count
                         }).ToPagedList(page, 10);

            if (Request.IsAjaxRequest())
            {
                return PartialView("_Restaurant", models);
            }
            return View(models);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ActionName("Create")]
        public ActionResult SaveRestaurant(Restaurant model)
        {
            if (ModelState.IsValid)
            {
                _db.Restaurants.Add(model);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            var model = _db.Restaurants.Single(r => r.Id == id);
            if (model == null)
            {
                return HttpNotFound();
            }
            return View(model);
        }

        [HttpPost]
        [ActionName("Edit")]
        public ActionResult EditRestaurant(int id)
        {

            var model = _db.Restaurants.Single(r => r.Id == id);
            if (model == null)
            {
                return HttpNotFound();
            }
            if (TryUpdateModel(model))
            {
                _db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(model);
        }

        #endregion

        #region Reviews

        public ActionResult Review([Bind(Prefix="id")] int restaurantId)
        {
            var model = _db.Restaurants.Single(r => r.Id == restaurantId);
            if (model == null)
            {
                return HttpNotFound();
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult CreateReview(int restaurantId)
        {
            ViewData["restaurantId"] = restaurantId;
            return View();
        }

        [HttpPost]
        public ActionResult CreateReview(RestaurantReview model)
        {
            if (ModelState.IsValid)
            {
                _db.Reviews.Add(model);
                _db.SaveChanges();
                return RedirectToAction("Review", new {id = model.RestaurantId});
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult EditReview(int id)
        {
            var model = _db.Reviews.Find(id);
            if (model == null)
            {
                return HttpNotFound();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult EditReview(RestaurantReview model)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(model).State = System.Data.EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction("Review", new { id = model.RestaurantId });
            }
            return View(model);
        }

        #endregion

        protected override void Dispose(bool disposing)
        {
            if (_db != null)
            {
                _db.Dispose();
            }
        }
    }
}