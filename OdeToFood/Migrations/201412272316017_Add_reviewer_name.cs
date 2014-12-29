namespace OdeToFood.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Add_reviewer_name : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.RestaurantReviews", "ReviewerName", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.RestaurantReviews", "ReviewerName");
        }
    }
}
