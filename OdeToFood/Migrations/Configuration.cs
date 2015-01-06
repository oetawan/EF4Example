namespace OdeToFood.Migrations
{
    using OdeToFood.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<OdeToFood.Data.OdeToFoodDb>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(OdeToFood.Data.OdeToFoodDb context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            for (int i = 0; i < 1000; i++)
            {
                context.Restaurants.AddOrUpdate(
                    r => r.Name,
                    new Restaurant
                    {
                        Id = i + 7,
                        Name = (i + 7).ToString(),
                        City = "Nowhere",
                        Country = "USA"
                    });
            }

            context.Restaurants.AddOrUpdate(
                r => r.Name,
                new Restaurant
                {
                    Id = 1,
                    Name = "Oetawan",
                    City = "Jakarta",
                    Country = "Indonesia"
                },
                new Restaurant
                {
                    Id = 2,
                    Name = "Arya",
                    City = "Depok",
                    Country = "Indonesia",
                },
                new Restaurant
                {
                    Id = 3,
                    Name = "Chandra",
                    City = "<script>alert('xss');</script>",
                    Country = "Indonesia"
                },
                new Restaurant
                {
                    Id = 5,
                    Name = "Muhammad",
                    City = "Jakarta",
                    Country = "Indonesia"
                },
                new Restaurant
                {
                    Id = 6,
                    Name = "Fakhri",
                    City = "Jakarta",
                    Country = "Indonesia"
                },
                new Restaurant
                {
                    Id = 7,
                    Name = "Inaz",
                    City = "Brisbane",
                    Country = "Australia"
                });
        }
    }
}