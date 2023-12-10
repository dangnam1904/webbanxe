﻿using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

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
        [DisplayName("Name Bike")]
        public string NameBike { get; set; }
        [Required]
        public double price { get; set; }
        public double PricePromotion { get; set; }
        [Required]
        public int  Quantity { get; set; }

        [StringLength(700)]
        [ValidateNever]
        public string ImageBike { get; set; }
        public string DescriptionBike { get; set; }

        [ForeignKey(nameof(TypeBike))]
        [ValidateNever]
        public int IdType { get; set; }

        [ValidateNever]
        public virtual TypeBike TypeBike { get; set; }

        [NotMapped]
        [DisplayName("Upload File")]
        [ValidateNever]
        public List<IFormFile> ImageFile { get; set; }
    }
}
