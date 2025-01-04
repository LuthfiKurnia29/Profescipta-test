using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProfesciptaTestMVC.Models
{
    [Table("SO_ITEM")]
    public class Item
    {
        [Key]
        [Column("SO_ITEM_ID")]
        public long Id { get; set; }
        [Column("SO_ORDER_ID")]
        public long OrderId { get; set; }
        [ForeignKey("OrderId")]
        public Order Order { get; set; }
        [Column("ITEM_NAME")]
        public string ItemName { get; set; }
        [Column("QUANTITY")]
        public int Quantity { get; set; }
        [Column("PRICE")]
        public float Price { get; set; }
    }
}
