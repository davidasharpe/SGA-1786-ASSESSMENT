namespace PopeyeMarinaWebApp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Boats",
                c => new
                    {
                        BoatID = c.Int(nullable: false, identity: true),
                        StateRegoNo = c.String(nullable: false),
                        Length = c.Double(nullable: false),
                        Manufacturer = c.String(nullable: false),
                        Model = c.String(nullable: false),
                        Year = c.Int(nullable: false),
                        Description = c.String(),
                        Type = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.BoatID);
            
            CreateTable(
                "dbo.Leases",
                c => new
                    {
                        LeaseID = c.Int(nullable: false, identity: true),
                        CustomerID = c.Int(nullable: false),
                        SlipID = c.Int(nullable: false),
                        BoatID = c.Int(nullable: false),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(nullable: false),
                        Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        TotalDays = c.Decimal(nullable: false, precision: 18, scale: 2),
                        TotalFee = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.LeaseID)
                .ForeignKey("dbo.Boats", t => t.BoatID, cascadeDelete: true)
                .ForeignKey("dbo.Customers", t => t.CustomerID, cascadeDelete: true)
                .ForeignKey("dbo.Slips", t => t.SlipID, cascadeDelete: true)
                .Index(t => t.CustomerID)
                .Index(t => t.SlipID)
                .Index(t => t.BoatID);
            
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        CustomerID = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 80),
                        Address = c.String(nullable: false, maxLength: 200),
                        Phone = c.String(nullable: false, maxLength: 16),
                        Email = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.CustomerID);
            
            CreateTable(
                "dbo.Slips",
                c => new
                    {
                        SlipID = c.Int(nullable: false, identity: true),
                        DockID = c.Int(nullable: false),
                        Width = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Length = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.SlipID)
                .ForeignKey("dbo.Docks", t => t.DockID, cascadeDelete: true)
                .Index(t => t.DockID);
            
            CreateTable(
                "dbo.Docks",
                c => new
                    {
                        DockID = c.Int(nullable: false, identity: true),
                        Location = c.String(nullable: false),
                        Electricity = c.String(nullable: false),
                        Water = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.DockID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Leases", "SlipID", "dbo.Slips");
            DropForeignKey("dbo.Slips", "DockID", "dbo.Docks");
            DropForeignKey("dbo.Leases", "CustomerID", "dbo.Customers");
            DropForeignKey("dbo.Leases", "BoatID", "dbo.Boats");
            DropIndex("dbo.Slips", new[] { "DockID" });
            DropIndex("dbo.Leases", new[] { "BoatID" });
            DropIndex("dbo.Leases", new[] { "SlipID" });
            DropIndex("dbo.Leases", new[] { "CustomerID" });
            DropTable("dbo.Docks");
            DropTable("dbo.Slips");
            DropTable("dbo.Customers");
            DropTable("dbo.Leases");
            DropTable("dbo.Boats");
        }
    }
}
