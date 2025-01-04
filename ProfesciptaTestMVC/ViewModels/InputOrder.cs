namespace ProfesciptaTestMVC.ViewModels
{
    public class InputOrder
    {
        public long? Id { get; set; }
        public string OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public int CustomerId { get; set; }
        public string Address { get; set; }
        public List<Items> Items { get; set; }
    }

    public class Items
    {
        public long? Id { get; set; }
        public float Price { get; set; }
        public string ItemName { get; set; }
        public int Quantity { get; set; }
    }
}
