using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using QL_Vat_Lieu_Xay_Dung_Data.Entities;
using QL_Vat_Lieu_Xay_Dung_Data.IRepositories;

namespace QL_Vat_Lieu_Xay_Dung_Data_EF.Repositories
{
    public class ProductCategoryRepository: EntityFrameworkRepository<ProductCategory, int>,IProductCategoryRepository
    {
        private AppDbContext _context;
        public ProductCategoryRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }

        public List<ProductCategory> GetByAlias(string alias)
        {
            return _context.ProductCategories.Where(x => x.SeoAlias == alias).ToList();
        }
    }
}
