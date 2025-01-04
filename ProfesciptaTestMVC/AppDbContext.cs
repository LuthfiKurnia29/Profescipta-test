using Microsoft.EntityFrameworkCore;
using ProfesciptaTestMVC.Models;
using System.Xml;

namespace ProfesciptaTestMVC
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        // Definisikan DbSet untuk setiap tabel
        public DbSet<Order> Orders { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Item> Items { get; set; }
    }
}
