using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webbanxe.Models
{
    public class Bike
    {
        public Bike()
        {
        }

        public Bike(int idBike)
        {
            IdBike = idBike;
        }


        [Key] public int IdBike { get; set; }
        [Required]
        [StringLength(200)]
        public string NameBike { get; set; }
        [Required]
        public double price { get; set; }
        public double PricePromotion { get; set; }
        [Required]
        public int  Quantity { get; set; }

        [StringLength(700)]
        public string ImageBike { get; set; }
        public string DescriptionBike { get; set; }

        [ForeignKey(nameof(TypeBike))]
        public int IdType { get; set; }
        public virtual TypeBike TypeBike { get; set; }
    }
}
