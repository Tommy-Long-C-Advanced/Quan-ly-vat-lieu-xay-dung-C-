using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using QL_Vat_Lieu_Xay_Dung_Infrastructure.SharedKernel;

namespace QL_Vat_Lieu_Xay_Dung_Data.Entities
{
    [Table("Tags")]
    public class Tag : DomainEntity<int>
    {
        public int ProductId { get; set; }
        [MaxLength(50)]
        [Required]
        public string Name { get; set; }
        [MaxLength(50)]
        [Required]
        public string Type { get; set; }
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }

    }
}
