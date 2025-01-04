using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProfesciptaTestMVC.Models
{
    [Table("COM_CUSTOMER")]
    public class Customer
    {
        [Column("COM_CUSTOMER_ID")]
        [Key]
        public int Id { get; set; }
        [Column("CUSTOMER_NAME")]
        public string Name { get; set; }
    }
}
