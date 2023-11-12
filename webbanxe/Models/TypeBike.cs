using System.ComponentModel.DataAnnotations;

namespace webbanxe.Models
{
    public class TypeBike
    {
        [Key] 
        public int IdType { get; set; }
        [Required]
        [StringLength(300)]
        public string NameType { get; set; }
        public virtual List<Bike> Bike { get; set; }
    }
}
