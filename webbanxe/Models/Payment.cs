using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webbanxe.Models
{
    public class Payment
    {
        [Key]
        public int IdPayment { get; set; }
        public int status { get; set; }

        [Required]
        [ForeignKey(nameof(Order))]
        public int IdOrder { get; set; }
        public virtual Order order { get; set; }



    }
}
