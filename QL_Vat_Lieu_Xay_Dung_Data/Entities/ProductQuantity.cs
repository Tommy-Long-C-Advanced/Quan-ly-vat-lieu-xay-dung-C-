using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using QL_Vat_Lieu_Xay_Dung_Infrastructure.SharedKernel;

namespace QL_Vat_Lieu_Xay_Dung_Data.Entities
{
    [Table("ProductQuantities")]
    public class ProductQuantity : DomainEntity<int>
    {
        [Column(Order = 1)]
        public int ProductId { get; set; }

        [Column(Order = 2)]
        public int SizeId { get; set; }

        public int Quantity { get; set; }

        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }

        [ForeignKey("SizeId")]
        public virtual Size Size { get; set; }

    }
}
