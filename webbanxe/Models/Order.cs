using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webbanxe.Models
{
    public class Order
    {
        [Key] 
        public int IdOrder { get; set; }

        [Required]
        [MaxLength(13)]
        public string NumberPhone { get; set; }

        [Required]
        [MaxLength(300)]
        public string Address { get; set; }
        [Required]
        public int OrderStatus { get; set; }

        public int idCart { get; set; }


    }
}
