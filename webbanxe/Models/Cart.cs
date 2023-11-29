using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webbanxe.Models
{
    public class Cart
    {
        [Key] public int IdCart { get; set; }
        [Required] public int QuantityPurchased  { get; set; }

        [ForeignKey(nameof(Bike))]
        public int IdBike { get; set; }
        public virtual Bike Bike { get; set; }

        [ForeignKey(nameof(User))]
        public int IdUser {  get; set; }
        public virtual User User { get; set; }
    }
}
