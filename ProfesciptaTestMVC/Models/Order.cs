using System.ComponentModel.DataAnnotations.Schema;

namespace ProfesciptaTestMVC.Models
{
    [Table("SO_ORDER")]
    public class Order
    {
        [Column("SO_ORDER_ID")]
        public long Id { get; set; }
        [Column("ORDER_NO")]
        public string OrderNo { get; set; }
        [Column("ORDER_DATE")]
        public DateTime OrderDate { get; set; }
        [Column("COM_CUSTOMER_ID")]
        public int CustomerId { get; set; }
        [ForeignKey("CustomerId")]
        public Customer Customer { get; set; }
        [Column("ADDRESS")]
        public string Address { get; set; }
    }
}
