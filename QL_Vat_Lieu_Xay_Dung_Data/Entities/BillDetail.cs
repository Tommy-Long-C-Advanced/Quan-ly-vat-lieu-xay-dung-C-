using System.ComponentModel.DataAnnotations.Schema;
using QL_Vat_Lieu_Xay_Dung_Infrastructure.SharedKernel;

namespace QL_Vat_Lieu_Xay_Dung_Data.Entities
{
    [Table("BillDetails")]
    public class BillDetail : DomainEntity<int>
    {
        public BillDetail() { }

        public BillDetail(int id, int billId, int productId, int quantity, decimal price, int sizeId)
        {
            Id = id;
            BillId = billId;
            ProductId = productId;
            Quantity = quantity;
            Price = price;
            SizeId = sizeId;
        }

        public BillDetail(int billId, int productId, int quantity, decimal price, int sizeId)
        {
            BillId = billId;
            ProductId = productId;
            Quantity = quantity;
            Price = price;
            SizeId = sizeId;
        }
        public int BillId { set; get; }

        public int ProductId { set; get; }

        public int Quantity { set; get; }

        public decimal Price { set; get; }

        public int SizeId { get; set; }
        [ForeignKey("BillId")]
        public virtual Bill Bill { set; get; }

        [ForeignKey("ProductId")]
        public virtual Product Product { set; get; }

        [ForeignKey("SizeId")]
        public virtual Size Size { set; get; }
    }
}