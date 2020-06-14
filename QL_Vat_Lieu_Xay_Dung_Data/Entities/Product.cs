using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using QL_Vat_Lieu_Xay_Dung_Data.Enums;
using QL_Vat_Lieu_Xay_Dung_Data.Interfaces;
using QL_Vat_Lieu_Xay_Dung_Infrastructure.SharedKernel;

namespace QL_Vat_Lieu_Xay_Dung_Data.Entities
{
    [Table("Products")]
    public class Product : DomainEntity<int>, ISwitchable, IDateTracking,IHasSeoMetaData
    {
        [StringLength(255)]
        [Required]
        public string Name { get; set; }
        [Required]
        public int CategoryId { get; set; }
        [StringLength(255)]
        public string Image { get; set; }
        [Required]
        [DefaultValue(0)]
        public decimal Price { get; set; }
        // Giá Khuyến Mãi
        public decimal? PromotionPrice { get; set; }
        // Giá gốc khi nhập hàng vào
        [Required]
        public decimal OriginalPrice { get; set; }
        [StringLength(255)]
        public string Description { get; set; }

        public string Content { get; set; }
        public bool? HomeFlag { get; set; }
        public bool HotFlag { get; set; }
        public int? ViewCount { get; set; }
        [StringLength(255)]
        public string Tags { get; set; }
        // Unit cho nguoi dung tu go
        [StringLength(255)]
        public string Unit { get; set; }

        public Status Status { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public string SeoPageTitle { get; set; }
        [Column(TypeName = "varchar(255)")]
        public string SeoAlias { get; set; }
        [StringLength(255)]
        public string SeoKeywords { get; set; }
        [StringLength(255)]
        public string SeoDescription { get; set; }


        [ForeignKey("CategoryId")]
        public virtual ProductCategory ProductCategory { get; set; }

    }
}
