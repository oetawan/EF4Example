using OdeToFood.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;

namespace OdeToFood.Data
{
    public class OdeToFoodDb : DbContext
    {
        public OdeToFoodDb()
            : base("name=OdeToFood")
        {
        }
        public DbSet<Restaurant> Restaurants { get; set; }
        public DbSet<RestaurantReview> Reviews { get; set; }
    }
}